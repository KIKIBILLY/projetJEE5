package fr.dauphine.miageif.controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.bean.Parametres;
import fr.dauphine.miageif.bean.Reservation;
import fr.dauphine.miageif.dao.ObjetDao;
import fr.dauphine.miageif.dao.ParametresDao;
import fr.dauphine.miageif.dao.PointLocationDao;
import fr.dauphine.miageif.dao.ReservationDao;

/**
 * Servlet implementation class ListProduit
 */
/**
 * @author REZKELLAH
 *
 */
public class MagasinControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagasinControleur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idClient = "3";
		
		ReservationDao resDao = new ReservationDao();
		List<Reservation>  reservations = new ArrayList<Reservation>();
		int nbReservation = 0;	
		if (idClient!= null){
			reservations = resDao.getReservationByClientId(idClient);
			nbReservation = reservations.size();
		}
		ObjetDao objetDao= new ObjetDao();
		PointLocationDao plDao = new PointLocationDao();
		ParametresDao pmDao = new ParametresDao();
		Parametres pm = new Parametres();
		pm = pmDao.getParametres();
		request.setAttribute("pm", pm);
		request.setAttribute("nbReservation",nbReservation);
		request.setAttribute("reservations",reservations);
		request.setAttribute("pls",plDao.getListPointlocation());
		request.setAttribute("objets", objetDao.getAllListObjet());
		this.getServletContext().getRequestDispatcher("/store.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id_reservation");
		ReservationDao resDao = new ReservationDao();
		resDao.deleteReservation(id);
		doGet(request, response);
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
