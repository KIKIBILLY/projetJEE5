package fr.dauphine.miageif.controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.bean.Client;
import fr.dauphine.miageif.dao.ClientDao;

/**
 * Servlet implementation class ClientControleur
 */
public class ClientControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
     String identifiant;
     ClientDao clientListeDao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientControleur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		clientListeDao = new ClientDao();
		Client client = new Client();
		this.identifiant=request.getParameter("reservation");
		client = clientListeDao.getClient(identifiant);
		request.setAttribute("client",client);		
		this.getServletContext().getRequestDispatcher("/compteEmployeGestionClient.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
