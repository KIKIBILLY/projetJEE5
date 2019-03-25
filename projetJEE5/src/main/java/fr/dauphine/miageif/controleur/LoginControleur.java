package fr.dauphine.miageif.controleur;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fr.dauphine.miageif.bean.Profile;
import fr.dauphine.miageif.bean.Utilisateur;
import fr.dauphine.miageif.dao.LoginDao;

/**
 * Servlet implementation class LoginController
 */



public class LoginControleur extends HttpServlet {
 private static final long serialVersionUID = 1L;


 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 	request.getRequestDispatcher("login.jsp").forward(request, response);
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  HttpSession session = request.getSession();

  
  String page = "login.jsp";
  if(email.trim().length() >= 0 && email != null &&
    password.trim().length() >= 0 && password != null) {
	  Utilisateur utilisateur=null;
	  LoginDao logindao = new LoginDao();
	  utilisateur = logindao.login(email, password);
	  Profile profil= logindao.getProfile(utilisateur);
   
   if(utilisateur!= null) {
    request.setAttribute("email", email);
    request.setAttribute("msg", "Login Success.....");
    session.setAttribute("identifiant", utilisateur.getIdentifiant());
    session.setAttribute("nom", utilisateur.getNom());
    session.setAttribute("prenom", utilisateur.getPrenom());
    session.setAttribute("photo", utilisateur.getUrlPhoto());

    
    if (profil==Profile.employe) {
        response.sendRedirect("ListeClient");
        session.setAttribute("profil", profil);
    	
    }else if(profil==Profile.client){
    	response.sendRedirect("magasin");
        session.setAttribute("profil", profil);
    }else {
    	response.sendRedirect("Admin");
        session.setAttribute("profil", profil);
    }
    
   } else {
    request.setAttribute("msg", "Nom d'utilisateur/Mot de passe incorrect !!!");
   }
  } else {

   request.setAttribute("msg", "Introduisez un username/password...");
  }
 }
}