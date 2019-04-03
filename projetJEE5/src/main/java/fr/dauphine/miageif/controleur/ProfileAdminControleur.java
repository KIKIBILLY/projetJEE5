package fr.dauphine.miageif.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.miageif.bean.Administrateur;
import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Employe;
import fr.dauphine.miageif.dao.AdministrateurDao;
import fr.dauphine.miageif.dao.EmployeeDao;

/**
 * Servlet implementation class ProfileAdmin
 */
public class ProfileAdminControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AdministrateurDao adao;
	String email;
	String test ;
   
	@Override
	public void init() throws ServletException {
		adao = new AdministrateurDao();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		test =(String) session.getAttribute("email");
		email = (String) getServletContext().getAttribute ("email");
		Administrateur admin = new Administrateur();
		admin = adao.getAdminByEmail(test);
		request.setAttribute("admin", admin);
		
		request.getRequestDispatcher("profileAdmin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
String action = request.getParameter("action");
		
		if(action!=null) {
		if (action.equals("Enregistrer") ) {
			Administrateur admin = new Administrateur();
			Credentials credential = new Credentials();
			
			credential.setEmail(request.getParameter("email"));
			credential.setPassword(request.getParameter("password"));
			
			
			admin.setNom(request.getParameter("nom"));
			admin.setPrenom(request.getParameter("prenom"));
			admin.setCredential(credential);
			admin.setAdresseHabitation(request.getParameter("adresse"));
			admin.setNumeroTel(String.valueOf(request.getParameter("telephone")));
			admin.setUrlPhoto(request.getParameter("photo"));		
			
			adao.updateAdmin(admin, test);
		 }
		} 
		doGet(request, response);
	}

}
