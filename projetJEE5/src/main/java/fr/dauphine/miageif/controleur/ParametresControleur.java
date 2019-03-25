package fr.dauphine.miageif.controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.dao.ParametresDao;
import fr.dauphine.miageif.dao.PointLocationDao;

public class ParametresControleur extends HttpServlet {
	ParametresDao metier;
	PointLocationDao pl;
	@Override
	public void init() throws ServletException {
		
		metier = new ParametresDao();
		pl = new PointLocationDao();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("NDML",metier.getParametres().getNDML());
		request.setAttribute("NDmL",metier.getParametres().getNDmL());
		request.setAttribute("NMOR",metier.getParametres().getNMOR());
		request.setAttribute("NDMR",metier.getParametres().getNDMR());
		request.setAttribute("NMOL",metier.getParametres().getNMOL());
		
		request.setAttribute("pls", pl.getListPointlocation());
        
		String action = request.getParameter("action");
		if(action!=null) {
        if (action.equals("Supprimer") ) {
			try {
				int id = Integer.parseInt(request.getParameter("idPl"));
				System.out.println("==========="+id);
				pl.deletePointLocation(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			
		 }
        }
		request.getRequestDispatcher("compteAdminListePl.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter("action");
		if (action.equals("Modifier") ) {
			int NDML = Integer.valueOf(request.getParameter("NDML"));
			int NDmL = Integer.valueOf(request.getParameter("NDmL"));
			int NMOR = Integer.valueOf(request.getParameter("NMOR"));
			int NDMR = Integer.valueOf(request.getParameter("NDMR"));
			int NMOL = Integer.valueOf(request.getParameter("NMOL"));
			metier.updateParametres(NDML,NDmL,NMOR,NDMR,NMOL);		
			
		}
		
		doGet(request, response);
	}

}