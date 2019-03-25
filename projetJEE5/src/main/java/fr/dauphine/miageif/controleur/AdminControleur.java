package fr.dauphine.miageif.controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.dao.AdministrateurDao;
import fr.dauphine.miageif.dao.ClientDao;
import fr.dauphine.miageif.dao.EmployeeDao;

/**
 * Servlet implementation class AdminControleur
 */
public class AdminControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClientDao cdao;
	EmployeeDao edao;
	AdministrateurDao adao;
	
	@Override
	public void init() throws ServletException {
		
		cdao = new ClientDao();
		edao = new EmployeeDao();
		adao = new AdministrateurDao();
	}
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("clients", cdao.getAllListClient());
		request.setAttribute("emps", edao.getAllListEmploye());
		request.setAttribute("admins", adao.getAllListAdministrateur());
		request.getRequestDispatcher("compteAdminListeUtilisateurs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
