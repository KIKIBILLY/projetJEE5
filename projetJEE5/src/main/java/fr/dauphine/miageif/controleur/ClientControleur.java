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
import fr.dauphine.miageif.bean.Location;
import fr.dauphine.miageif.bean.Reservation;
import fr.dauphine.miageif.bean.Utilisateur;
import fr.dauphine.miageif.dao.ClientDao;
import fr.dauphine.miageif.dao.EmployeeDao;
import fr.dauphine.miageif.dao.LocationDao;
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
	LocationDao locationDao;
	Utilisateur utilisateur;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ClientControleur() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reservationDao = new ReservationDao();
		clientListeDao = new ClientDao();
		employeDao = new EmployeeDao();
		locationDao = new LocationDao();

		Client client = new Client();
		Employe employe = new Employe();
		List<Reservation> reservations = new ArrayList<Reservation>();
		List<Location> locations = new ArrayList<Location>();

		
		// suprimer une reservation
		String action = request.getParameter("action");
		if (action != null) {
			if (action.equals("Supprimer")) {
				try {
					String id = request.getParameter("idReservation");
					reservationDao.deleteReservation(id);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

		
		this.identifiant = request.getParameter("identifiant");
		client = clientListeDao.getClient(identifiant);

		request.setAttribute("client", client);
		HttpSession session = request.getSession();
		identifiant_utilisateur = (String) session.getAttribute("identifiant");

		employe = employeDao.getEmploye(identifiant_utilisateur);

		reservations = reservationDao.getReservationByClientIdANDPointLocation(client.getIdentifiant(),employe.getIdentifiant());
		locations=locationDao.getLocationByClientId(client.getIdentifiant());
		
		request.setAttribute("locations", locations);
		request.setAttribute("reservations", reservations);
		request.setAttribute("identifiant", identifiant);

		this.getServletContext().getRequestDispatcher("/compteEmployeGestionClient.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] valeurs = new String[0];
		valeurs = request.getParameterValues("check");
		reservationDao = new ReservationDao();
		locationDao = new LocationDao();

		if (valeurs != null) {
			for (int i = 0; i < valeurs.length; i++) {
				locationDao.addLocation(valeurs[i]);
			}
		}
		response.sendRedirect("ClientControleur?identifiant=" + this.identifiant);

	}

}
