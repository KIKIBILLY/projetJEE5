package fr.dauphine.miageif.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.miageif.bean.Employe;
import fr.dauphine.miageif.bean.EtatObjet;
import fr.dauphine.miageif.bean.FicheProduit;
import fr.dauphine.miageif.bean.Objet;
import fr.dauphine.miageif.dao.EmployeeDao;
import fr.dauphine.miageif.dao.ObjetDao;
import fr.dauphine.miageif.dao.PointLocationDao;
import fr.dauphine.miageif.util.GenerateurID;

/**
 * Servlet implementation class GestionStockControleur
 */
public class GestionStockControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ObjetDao objet;
	
	@Override
		public void init() throws ServletException {
		
		   objet = new ObjetDao();
		}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		
		String email = (String) getServletContext().getAttribute ("email");
		
		String test ="bilal.rezkellah@dauphine.eu";
		
		request.setAttribute("reserves", objet.getListObjetPl(test, EtatObjet.reserve) );
	    request.setAttribute("loues", objet.getListObjetPl(test, EtatObjet.loue));
	    request.setAttribute("autre", objet.getListObjetPl(test, EtatObjet.autre));
	    request.getRequestDispatcher("CompteEmployeGestionStock.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String test ="bilal.rezkellah@dauphine.eu";
		
		if(action!=null) {
		if (action.equals("Enregistrer") ) {
			Objet obj = new Objet();
			FicheProduit fp = new FicheProduit();
			GenerateurID gid = new GenerateurID();
			EmployeeDao edao = new EmployeeDao();
			String id_objet = gid.generate(12);
			
			obj.setIdentifiant(id_objet);
			obj.setCategorie(request.getParameter("categorie"));
			
			fp.setLibelle(request.getParameter("libelle"));
			fp.setDescription(request.getParameter("description"));
			
			fp.setadj(Double.valueOf(request.getParameter("amende")));
			fp.setpxlj(Double.valueOf(request.getParameter("prix")));
			fp.setcl(Double.valueOf(request.getParameter("caution")));
			fp.setDefauts(request.getParameter("defauts"));
			obj.setFp(fp);
			obj.setIdPL(edao.getEmployeByEmail(test).getPl().getIdPL());
			
			obj.getImages().add(request.getParameter("url_image"));
		
			objet.insertObjet(obj);		
			
		 } else if(action.equals("Editer")) {
			 
			    System.out.println("Je suis lààààààà");
			 
			    Objet objM = new Objet();
				FicheProduit fpM = new FicheProduit();
				
				objM.setIdentifiant(request.getParameter("identifiantM"));
				
				
				
				fpM.setLibelle(request.getParameter("libelleM"));
				fpM.setDescription(request.getParameter("descM"));
				
				fpM.setadj(Double.valueOf(request.getParameter("amendeM")));
				fpM.setpxlj(Double.valueOf(request.getParameter("prixM")));
				fpM.setcl(Double.valueOf(request.getParameter("cautionM")));
				fpM.setDefauts(request.getParameter("defautM"));
				objM.setFp(fpM);
				System.out.println("Idnetifiant : "+objM.getIdentifiant()  );
				System.out.println("Libelle :"+objM.getFp().getLibelle());
				System.out.println("Prix :"+objM.getFp().getpxlj());
				System.out.println("Caution :");
				System.out.println("Amende :");
				
				
			
				objet.updateObjet(objM);
		 }
		} 
		
		doGet(request, response);
	}

}
