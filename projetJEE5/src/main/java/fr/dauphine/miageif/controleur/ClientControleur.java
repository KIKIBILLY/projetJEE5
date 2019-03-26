package fr.dauphine.miageif.controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.miageif.bean.Client;
import fr.dauphine.miageif.bean.Employe;
import fr.dauphine.miageif.bean.Reservation;
import fr.dauphine.miageif.bean.Utilisateur;
import fr.dauphine.miageif.dao.ClientDao;
import fr.dauphine.miageif.dao.EmployeeDao;
import fr.dauphine.miageif.dao.ReservationDao;

/**
 * @author BOURIHANE
 *
 */
/**
 * Servlet implementation class ClientControleur
 */
public class ClientControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
     String identifiant;
     String identifiant_utilisateur;
     ClientDao clientListeDao;
     EmployeeDao employeDao;
     ReservationDao reservationDao;
     Utilisateur utilisateur;
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
		reservationDao = new ReservationDao();
		clientListeDao = new ClientDao();
		employeDao= new EmployeeDao();
		
		
		Client client = new Client();
		Employe employe= new Employe();
		List<Reservation> reservations = new ArrayList<Reservation>();
		
		
		this.identifiant=request.getParameter("reservation");
		client = clientListeDao.getClient(identifiant);
		
		request.setAttribute("client",client);		
		HttpSession session = request.getSession();
		identifiant_utilisateur=(String) session.getAttribute("identifiant");
		
		employe = employeDao.getEmploye(identifiant_utilisateur);
		reservations = reservationDao.getReservationByClientIdANDPointLocation(identifiant, employe.getIdentifiant());
		System.out.println(employe.getIdentifiant());
		request.setAttribute("reservations", reservations);
		this.getServletContext().getRequestDispatcher("/compteEmployeGestionClient.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
