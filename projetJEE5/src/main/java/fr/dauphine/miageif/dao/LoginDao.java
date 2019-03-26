package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;


import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Profile;
import fr.dauphine.miageif.bean.Utilisateur;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;

/**
 * @author BOURIHANE
 *
 */
public class LoginDao {
	MysqlDB db = new MysqlDB();
	Configuration conf = new Configuration();

	 
	 public Utilisateur login(String email, String password) throws IOException  {
		Utilisateur utilisateur = new Utilisateur();
		Credentials credential = new Credentials();
		
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur WHERE (utilisateur.email='"+email+"') AND (utilisateur.password='"+password+"')";
		try {
			
			ResultSet rs = db.executeQuery(query);
			
			if (rs.next()) {
	
				String identifiant = rs.getString(1);
				String emaiL = rs.getString(2);
				String passworD = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				String urlphoto= rs.getString(8);
				
				
				utilisateur.setIdentifiant(identifiant);
				credential.setEmail(emaiL);
				credential.setPassword(passworD);
				utilisateur.setCredential(credential);				
				utilisateur.setNom(nom);
				utilisateur.setPrenom(prenom);
				utilisateur.setNumeroTel(numtel);
				utilisateur.setAdresseHabitation(adresse);
				utilisateur.setUrlPhoto(urlphoto);
				
			}else {utilisateur=null;}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return utilisateur;
		
	}
	 
	 public Profile getProfile(Utilisateur utilisateur) throws IOException  {
			Profile profil = null;
			
			try {
				db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String query = "Select * from client WHERE (client.identifiant_utilisateur='"+utilisateur.getIdentifiant()+"')";

			try {
				
				ResultSet rs = db.executeQuery(query);
								
				if (rs.next()) {
					profil= Profile.client;
				}else {
					String query2 = "Select * from employe WHERE (employe.identifiant_utilisateur='"+utilisateur.getIdentifiant()+"')";
					ResultSet rs2 = db.executeQuery(query2);
					if (rs2.next()) {
						profil= Profile.employe;
					}else {
						profil= Profile.administrateur;
					}
					
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.close();
			return profil;
			
		}
	 
	 
	 public String register(Utilisateur utilisateur) throws IOException {
		 String msg = null ;
		 if (utilisateur != null) {
		 try {
				db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		 
			String query = "INSERT INTO utilisateur VALUES('"+utilisateur.getIdentifiant()+"','"+utilisateur.getCredential().getEmail()+"','"+utilisateur.getCredential().getPassword()+"','"+utilisateur.getNom()+"','"+utilisateur.getPrenom()+"','"+utilisateur.getNumeroTel()+"','"+utilisateur.getAdresseHabitation()+"','"+utilisateur.getUrlPhoto()+"')";
			try {
				
				 db.executeQuery(query);
				 msg = "Votre compte a ete ajoute";
				
				
			} catch (SQLException e) {
			msg = "Votre email existe deja merci de reeassayer";
			e.printStackTrace();
			}
			db.close();
			
		 } else {
			   System.out.println("DB server down.....");
			  }
		 
		 System.out.println("msg:" + msg);
		  return msg;
		  
		 
	 }
	
	
}
