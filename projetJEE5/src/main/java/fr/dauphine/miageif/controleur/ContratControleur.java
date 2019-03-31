package fr.dauphine.miageif.controleur;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.bean.Client;
import fr.dauphine.miageif.bean.Location;
import fr.dauphine.miageif.dao.ClientDao;
import fr.dauphine.miageif.dao.LocationDao;

/**
 * Servlet implementation class ContratControleur
 */
public class ContratControleur extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Location> locations = new ArrayList<Location>();
	LocationDao locationDao= new LocationDao() ;
	ClientDao clientDao= new ClientDao();
	Client client= new Client();
	String identifiant;
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContratControleur() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.identifiant = request.getParameter("identifiant");
		locations=locationDao.getLocationByClientId(identifiant);
		client= clientDao.getClient(identifiant);
		
		 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	     Date date = new Date();

	     request.setAttribute("date", dateFormat.format(date));
		request.setAttribute("locations", locations);
		request.setAttribute("client", client);
		
		this.getServletContext().getRequestDispatcher("/contratClient.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//locations= (List<Location>) request.getAttribute("locations") ;
		doGet(request, response);
	}

}
