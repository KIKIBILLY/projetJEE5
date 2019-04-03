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
import fr.dauphine.miageif.bean.Objet;
import fr.dauphine.miageif.bean.Parametres;
import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.bean.Reservation;
import fr.dauphine.miageif.dao.ObjetDao;
import fr.dauphine.miageif.dao.ParametresDao;
import fr.dauphine.miageif.dao.PointLocationDao;
import fr.dauphine.miageif.dao.ReservationDao;

/**
 * Servlet implementation class ObjetControleur
 */
/**
 * @author REZKELLAH
 *
 */
public class ObjetControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ObjetControleur() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		Objet objet = new Objet();
		ObjetDao objetDao = new ObjetDao();
		objet = objetDao.getObjetById(id);
		PointLocation pl = new PointLocation();
		PointLocationDao plDao = new PointLocationDao();
		ParametresDao pmDao = new ParametresDao();
		
		
		HttpSession session = request.getSession();
		String idClient = (String) session.getAttribute("id_client");
		ReservationDao resDao = new ReservationDao();
		List<Reservation>  reservations = new ArrayList<Reservation>();
		
		int nbReservation = 0;	
		if (idClient!= null){
			reservations = resDao.getReservationByClientId(idClient);
			nbReservation = reservations.size();
		}
		
		
		ReservationDao reservation = new ReservationDao();
		pl = plDao.getPLById(objet.getIdPL());

		boolean reserve = false;
		
		
		
		Parametres pm = new Parametres();
		pm = pmDao.getParametres();
		
		
		request.setAttribute("pm", pm);
		request.setAttribute("objet", objet);
		request.setAttribute("pl", pl);
		request.setAttribute("id_produit",id);
		request.setAttribute("nbReservation",nbReservation);
		request.setAttribute("reserve", reserve);
		
		
		String action = request.getParameter("action");
		if(action!=null) {
        if (action.equals("visualiser") ) {
			try {
				
				Client client= new Client ();
				client = reservation.getClientDeReservation(id);
				request.setAttribute("client", client);
				this.getServletContext().getRequestDispatcher("/listeProduitReserves.jsp").forward(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			
		 } else this.getServletContext().getRequestDispatcher("/product.jsp").forward(request, response);
        }else this.getServletContext().getRequestDispatcher("/product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
