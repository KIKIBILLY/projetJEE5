package fr.dauphine.miageif.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.dao.PointLocationDao;

/**
 * Servlet implementation class PointLocationControleur
 */
public class PointLocationControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PointLocationDao pl;
       
    @Override
    public void init() throws ServletException {
    		
    	pl = new PointLocationDao();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action != null) {
			
		  if (action.equals("Ajouter")) {
		   
			PointLocation point = new PointLocation();
			point.setLibelle(request.getParameter("libelle"));
			point.setAdresse(request.getParameter("adresse"));
			pl.addPl(point);		
			
		  } else if (action.equals("Supprimer")) {
			 
			int id = Integer.parseInt(request.getParameter("idPl"));
			pl.deletePointLocation(id);
			
		  }	
		}
		request.setAttribute("pls", pl.getListPointlocation());
		request.getRequestDispatcher("compteAdminListePl.jsp").forward(request, response);
		
	}

}
