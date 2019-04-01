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
import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.dao.AdministrateurDao;
import fr.dauphine.miageif.dao.ClientDao;
import fr.dauphine.miageif.dao.EmployeeDao;
import fr.dauphine.miageif.dao.PointLocationDao;
import fr.dauphine.miageif.dao.UtilisateurDao;

/**
 * Servlet implementation class AdminControleur
 */
public class AdminControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClientDao cdao;
	EmployeeDao edao;
	AdministrateurDao adao;
	UtilisateurDao udao;
	PointLocationDao pldao;
	
	
	
	@Override
	public void init() throws ServletException {
		
		cdao = new ClientDao();
		edao = new EmployeeDao();
		adao = new AdministrateurDao();
		pldao = new PointLocationDao();
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
		
		String action = request.getParameter("action");
		Employe employe = new Employe();
		Credentials credential = new Credentials();
		PointLocation point = new PointLocation();
		
		if(action!=null) {
		if (action.equals("Ajouter") ) {
			
			point = pldao.getPLById(request.getParameter("idPl"));
			System.out.println("==================>"+request.getParameter("idPl"));
			credential.setEmail(request.getParameter("email"));
			credential.setPassword(request.getParameter("password"));
			
			employe.setNom(request.getParameter("nom"));
			employe.setPrenom(request.getParameter("prenom"));
			employe.setCredential(credential);
			employe.setAdresseHabitation(request.getParameter("adresse"));
			employe.setNumeroTel(String.valueOf(request.getParameter("telephone")));
			employe.setPl(point);
			employe.setIdentifiantPL(point.getIdPL());
			
			
			employe.setUrlPhoto(request.getParameter("photo"));
			edao.addEmploye(employe);
			
			
		   }else if (action.equals("Supprimer")) {
				String role = request.getParameter("role");
				System.out.println(role);
				int id = Integer.parseInt(request.getParameter("id"));
				if(role.equals("employe")) {
				  edao.deleteEmploye(id);
				}else if (role.equals("admin")) {
				  adao.deleteAdmin(id);
				}else {
				  cdao.deleteClient(id);	
				}
				
		   }	
		}
		
		request.setAttribute("clients", cdao.getAllListClient());
		request.setAttribute("emps", edao.getAllListEmploye());
		request.setAttribute("admins", adao.getAllListAdministrateur());
		request.getRequestDispatcher("compteAdminListeUtilisateurs.jsp").forward(request, response);
	}

}
