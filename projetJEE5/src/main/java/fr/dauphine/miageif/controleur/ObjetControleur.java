package fr.dauphine.miageif.controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.bean.Objet;
import fr.dauphine.miageif.bean.Parametres;
import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.dao.ObjetDao;
import fr.dauphine.miageif.dao.ParametresDao;
import fr.dauphine.miageif.dao.PointLocationDao;

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
		pl = plDao.getPLById(objet.getIdPL());

		ParametresDao pmDao = new ParametresDao();
		Parametres pm = new Parametres();
		pm = pmDao.getParametres();
		request.setAttribute("pm", pm);
		request.setAttribute("objet", objet);
		request.setAttribute("pl", pl);
		this.getServletContext().getRequestDispatcher("/product.jsp").forward(request, response);
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
