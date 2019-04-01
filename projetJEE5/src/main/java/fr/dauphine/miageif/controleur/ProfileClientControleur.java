package fr.dauphine.miageif.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.miageif.bean.Client;
import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Employe;
import fr.dauphine.miageif.dao.ClientDao;
import fr.dauphine.miageif.dao.EmployeeDao;

/**
 * Servlet implementation class ProfileClientControleur
 */
public class ProfileClientControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ClientDao cdao ;
	String email;
	String test ="mehdi.brahimi@dauphine.eu";
	@Override
	public void init() throws ServletException {
		
		cdao = new ClientDao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Client clientActuel = new Client();
        String action = request.getParameter("action");
		
		if(action!=null) {
		if (action.equals("Enregistrer") ) {
			Client client = new Client();
			Credentials credential = new Credentials();
			
			credential.setEmail(request.getParameter("email"));
			credential.setPassword(request.getParameter("password"));
			
			
			client.setNom(request.getParameter("nom"));
			client.setPrenom(request.getParameter("prenom"));
			client.setCredential(credential);
			client.setAdresseHabitation(request.getParameter("adresse"));
			client.setNumeroTel(String.valueOf(request.getParameter("telephone")));
			client.setUrlPhoto(request.getParameter("photo"));		
			cdao.updateClient(client, test);
		 } else if (action.equals("Supprimer")) {
			
			 if(cdao.possedeLocation(test)) {
				 request.setAttribute("locataire", true);
				
			} else {
				cdao.deleteClient(Integer.parseInt(cdao.getClientByEmail(test).getIdentifiant())); 
				response.sendRedirect("login");  
			}
			 
		 }
		}
		
		email = (String) getServletContext().getAttribute ("email");	
		clientActuel = cdao.getClientByEmail(test);
		request.setAttribute("client", clientActuel);
	    request.getRequestDispatcher("profileClient.jsp").forward(request, response);
		
	}

}
