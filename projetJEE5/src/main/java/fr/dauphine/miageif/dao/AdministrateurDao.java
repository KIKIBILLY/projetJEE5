package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.dauphine.miageif.bean.Administrateur;
import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;

public class AdministrateurDao {
	MysqlDB db = new MysqlDB();
	Configuration conf = new Configuration();

	
	
	
	public Administrateur getAdministrateur (String id) throws IOException  {
		Administrateur admin = new Administrateur();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur JOIN administrateur on utilisateur.identifiant= administrateur.identifiant_utilisateur WHERE (utilisateur.identifiant= "+ id+")";
		try {
			
			ResultSet rs = db.executeQuery(query);
			
			Credentials credential = null;
			while (rs.next()) {
				credential = new Credentials();
				
				String identifiant = String.valueOf(rs.getInt(1));
				String email = rs.getString(2);
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				
				admin.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				admin.setCredential(credential);				
				admin.setNom(nom);
				admin.setPrenom(prenom);
				admin.setNumeroTel(numtel);
				admin.setAdresseHabitation(adresse);
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return admin;
	}
	
	
	
	public List<Administrateur> getAllListAdministrateur() throws IOException {
		List<Administrateur> admins = new ArrayList<Administrateur>();
		
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur JOIN administrateur on utilisateur.identifiant= administrateur.identifiant_utilisateur";
		try {
			ResultSet rs = db.executeQuery(query);
			Administrateur admin = null;
			Credentials credential = null;
			while (rs.next()) {
				admin = new Administrateur();
				credential = new Credentials();
				String identifiant = String.valueOf(rs.getInt(1));
				String email = rs.getString(2);
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				
				admin.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				admin.setCredential(credential);				
				admin.setNom(nom);
				admin.setPrenom(prenom);
				admin.setNumeroTel(numtel);
				admin.setAdresseHabitation(adresse);
				
				admins.add(admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return admins;
	}
	public Administrateur getAdminByEmail (String email) throws IOException  {
		Administrateur admin = new Administrateur();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur JOIN administrateur on utilisateur.identifiant= administrateur.identifiant_utilisateur WHERE (utilisateur.email='"+email+"')";
		try {
			
			ResultSet rs = db.executeQuery(query);

			Credentials credential = null;
			while (rs.next()) {
				credential = new Credentials();
				
				String identifiant = String.valueOf(rs.getInt(1));
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				String urlPhoto = rs.getString(8);
				
				admin.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				admin.setCredential(credential);				
				admin.setNom(nom);
				admin.setPrenom(prenom);
				admin.setNumeroTel(numtel);
				admin.setAdresseHabitation(adresse);
				admin.setUrlPhoto(urlPhoto);
				
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return admin;
	}
public void updateAdmin(Administrateur admin, String emailAncien) throws IOException {
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "UPDATE utilisateur SET email = '"+admin.getCredential().getEmail()+"', password = '"+admin.getCredential().getPassword()+"', nom = '"+admin.getNom()+"', prenom = '"+admin.getPrenom()+"', num_tel ='"+admin.getNumeroTel()+"', adresse_habitation = '"+admin.getAdresseHabitation()+"' WHERE email='"+emailAncien+"' ";
		try {
			db.executeQuery(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
	}

public void deleteAdmin(int id) throws IOException {
	MysqlDB db = new MysqlDB();
	Configuration conf = new Configuration();
	
	String query = "DELETE FROM administrateur where identifiant="+id;
	try {
		db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		db.executeQuery(query);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	db.close();
		
	
}
	
	

}
