package fr.dauphine.miageif.controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.miageif.bean.Location;
import fr.dauphine.miageif.bean.Objet;
import fr.dauphine.miageif.bean.Parametres;
import fr.dauphine.miageif.bean.Reservation;
import fr.dauphine.miageif.dao.LocationDao;
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
		
		HttpSession session = request.getSession();
		String idClient = (String) session.getAttribute("id_client");
		String act = request.getParameter("act");
		String idPL = request.getParameter("pointLocation");
		String categorie = request.getParameter("categorie");
		double prixMin = 10;
		double prixMax = 999;
		ReservationDao resDao = new ReservationDao();
		LocationDao locationDao= new LocationDao();
		
		List<Reservation>  reservations = new ArrayList<Reservation>();
		List<Location>  locations= new ArrayList<Location>();
		int nbReservation = 0;	
		int nbLocation= 0;
		
		if (idClient!= null){
			reservations = resDao.getReservationByClientId(idClient);
			locations = locationDao.getLocationByClientId(idClient);
			nbReservation = reservations.size();
			nbLocation=  locations.size();
		}
		ObjetDao objetDao= new ObjetDao();
		List<Objet> objets1 = new ArrayList<Objet>();
		List<Objet> objets2 = new ArrayList<Objet>();
		objets1 = objetDao.getAllListObjet();
		if (act != null ){
			if (act.equals("rechercheParCategorie")){
			for (int i = 0; i<objets1.size();i++){
				if(objets1.get(i).getCategorie().equals(categorie) || categorie.equals("Tout")){
					objets2.add(objets1.get(i));
				}
			}
		} else if (act.equals("rechercheParPL")){
			for (int i = 0; i<objets1.size();i++){
				if(String.valueOf(objets1.get(i).getIdPL()).equals(idPL) || idPL.equals("Tout")){
					objets2.add(objets1.get(i));
				}
			}
		} else if (act.equals("rechercheParPrix")){
		    prixMin = Double.parseDouble(request.getParameter("min"));
		    prixMax = Double.parseDouble(request.getParameter("max"));
			for (int i = 0; i<objets1.size();i++){
				if( objets1.get(i).getFp().getpxlj() >= prixMin && objets1.get(i).getFp().getpxlj() <= prixMax ){
					objets2.add(objets1.get(i));
				}
			}
		}
		} else{
			objets2 = objets1;
		}
		PointLocationDao plDao = new PointLocationDao();
		ParametresDao pmDao = new ParametresDao();
		Parametres pm = new Parametres();
		pm = pmDao.getParametres();
		request.setAttribute("pm", pm);
		request.setAttribute("nbReservation",nbReservation);
		request.setAttribute("nbLocation", nbLocation);
		request.setAttribute("prixMin",prixMin);
		request.setAttribute("prixMax",prixMax);
		request.setAttribute("reservations",reservations);
		request.setAttribute("locations",locations );
		request.setAttribute("pls",plDao.getListPointlocation());
		request.setAttribute("objets", objets2);
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
