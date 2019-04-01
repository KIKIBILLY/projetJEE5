package fr.dauphine.miageif.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Employe;
import fr.dauphine.miageif.bean.FicheProduit;
import fr.dauphine.miageif.bean.Objet;
import fr.dauphine.miageif.dao.EmployeeDao;
import fr.dauphine.miageif.util.GenerateurID;

/**
 * Servlet implementation class ProfileEmployeControleur
 */
public class ProfileEmployeControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	EmployeeDao edao ;
    	String email;
    	String test ="bilal.rezkellah@dauphine.eu";
	
    @Override
    public void init() throws ServletException {
    	
    	edao = new EmployeeDao();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		Employe employe= new Employe();
		email = (String) getServletContext().getAttribute ("email");	
		employe = edao.getEmployeByEmail(test);
		request.setAttribute("employe", employe);
	    request.getRequestDispatcher("profileEmploye.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action!=null) {
		if (action.equals("Enregistrer") ) {
			Employe employe = new Employe();
			EmployeeDao edao = new EmployeeDao();
			Credentials credential = new Credentials();
			
			credential.setEmail(request.getParameter("email"));
			credential.setPassword(request.getParameter("password"));
			
			
			employe.setNom(request.getParameter("nom"));
			employe.setPrenom(request.getParameter("prenom"));
			employe.setCredential(credential);
			employe.setAdresseHabitation(request.getParameter("adresse"));
			employe.setNumeroTel(String.valueOf(request.getParameter("telephone")));
			employe.setUrlPhoto(request.getParameter("photo"));		
			
			edao.updateEmploye(employe, test);
		 }
		} 
		doGet(request, response);
	}

}
