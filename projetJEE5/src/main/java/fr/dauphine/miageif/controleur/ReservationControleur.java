package fr.dauphine.miageif.controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.miageif.bean.Objet;
import fr.dauphine.miageif.bean.Parametres;
import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.bean.Reservation;
import fr.dauphine.miageif.dao.ObjetDao;
import fr.dauphine.miageif.dao.ParametresDao;
import fr.dauphine.miageif.dao.PointLocationDao;
import fr.dauphine.miageif.dao.ReservationDao;

/**
 * Servlet implementation class ReservationControleur
 */
public class ReservationControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationControleur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id_client = (String) session.getAttribute("id_client");
		String act = request.getParameter("act");
		String id_reservation = request.getParameter("id_reservation");
		ReservationDao resDao = new ReservationDao();
		if (act != null) {
		if (act.equals("supprimer")){
			resDao.deleteReservation(id_reservation);
		}else if(act.equals("afficheReservation")){
		PointLocation pl = new PointLocation();
		PointLocationDao plDao = new PointLocationDao();
		ParametresDao pmDao = new ParametresDao();
		Parametres pm = new Parametres();
		Reservation reservation = new Reservation();
		reservation = resDao.getReservationById(id_reservation);
		pm = pmDao.getParametres();
		request.setAttribute("pm", pm);
		pl = plDao.getPLById(reservation.getObjet().getIdPL());
		request.setAttribute("reservation",reservation);
		request.setAttribute("pl", pl);
		this.getServletContext().getRequestDispatcher("/modifierReservation.jsp").forward(request, response);
		}
		}
		if ( (act != null && act.equals("supprimer")) || act == null ){
		List<Reservation>  reservations = new ArrayList<Reservation>();
		reservations = resDao.getReservationByClientId(id_client);
		request.setAttribute("reservations",reservations);
		this.getServletContext().getRequestDispatcher("/gestionReservationsClient.jsp").forward(request, response);
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String act = request.getParameter("act");
		int nbrJour = Integer.parseInt(request.getParameter("nbrJour"));
		String id_reservation = request.getParameter("id_reservation");
		String id_produit = request.getParameter("id_produit");
		String id_client = (String) session.getAttribute("id_client");
		if (act != null && act.equals("modifier")){
			
			ReservationDao resDao = new ReservationDao();
			resDao.updateReservation(id_reservation,nbrJour);
			List<Reservation>  reservations = new ArrayList<Reservation>();
			reservations = resDao.getReservationByClientId(id_client);
			request.setAttribute("reservations",reservations);
			this.getServletContext().getRequestDispatcher("/gestionReservationsClient.jsp").forward(request, response);
		}else{
		Objet objet = new Objet();
		ObjetDao objetDao = new ObjetDao();
		objet = objetDao.getObjetById(id_produit);
		PointLocation pl = new PointLocation();
		PointLocationDao plDao = new PointLocationDao();
		pl = plDao.getPLById(objet.getIdPL());
		boolean reserve = true;
		ParametresDao pmDao = new ParametresDao();
		Parametres pm = new Parametres();
		pm = pmDao.getParametres();
		request.setAttribute("pm", pm);
		request.setAttribute("objet", objet);
		request.setAttribute("pl", pl);
		request.setAttribute("reserve", reserve);
		ReservationDao resDao = new ReservationDao();
		List<Reservation>  reservations = new ArrayList<Reservation>();
		int nbReservation = 0;	
		if (id_client!= null){
			reservations = resDao.getReservationByClientId(id_client);
			nbReservation = reservations.size();
		}
		id_reservation = resDao.addReservation(id_produit,id_client,nbrJour);
		request.setAttribute("numReservation",id_reservation);
		request.setAttribute("nbReservation",nbReservation);
		this.getServletContext().getRequestDispatcher("/product.jsp").forward(request, response);
	}
	}

}
