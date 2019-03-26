package fr.dauphine.miageif.controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.bean.Client;
import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.dao.ClientDao;

/**
 * @author BOURIHANE
 *
 */
/**
 * Servlet implementation class GestionClientControleur
 */
@WebServlet("/ListeClient")
public class ListeClientControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeClientControleur() {
        super();
        // TODO Auto-generated constructor stub
    }
    
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ClientDao clientListeDao;
		clientListeDao = new ClientDao();
		List<Client> clients = new ArrayList<Client>();
		clients = clientListeDao.getAllListClient();
		request.setAttribute("clients", clients);
		this.getServletContext().getRequestDispatcher("/compteEmployeListeClient.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
	
	}

}
