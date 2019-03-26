package fr.dauphine.miageif.controleur;

/**
 * @author BOURIHANE
 *
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Utilisateur;
import fr.dauphine.miageif.dao.LoginDao;

public class EnregistrementControleur extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnregistrementControleur() {
    	
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  response.sendRedirect("loginRegistration.jsp");
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  String msg = "La confirmation du mot de passe est fausse !";
  String page = "loginRegistration.jsp";
 
  if(request.getParameter("password").equals(request.getParameter("confPassword"))){
   Utilisateur user = new Utilisateur();
   Credentials credentials = new Credentials();
   user.setNom(request.getParameter("nom"));
   user.setPrenom(request.getParameter("prenom"));
   credentials.setEmail(request.getParameter("email"));
   credentials.setPassword(request.getParameter("password"));
   user.setCredential(credentials);
   user.setNumeroTel(request.getParameter("numtel"));
   user.setUrlPhoto(request.getParameter("urlphoto"));
   user.setAdresseHabitation(request.getParameter("adresse"));
   
   LoginDao loginDao = new LoginDao();
   msg = loginDao.register(user);
   page = "login.jsp";
  } 
  request.setAttribute("msg2", msg);
  request.getRequestDispatcher(page).include(request, response);
 }

}