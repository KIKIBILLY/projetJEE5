package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Employe;
import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;

public class EmployeeDao {

	MysqlDB db = new MysqlDB();
	Configuration conf = new Configuration();

	
	
	
	public Employe getEmploye (String id) throws IOException  {
		Employe emp = new Employe();
		PointLocationDao pls = new PointLocationDao();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String query = "Select * from utilisateur JOIN employe on utilisateur.identifiant= employe.identifiant_utilisateur WHERE (utilisateur.identifiant="+ id+")";
		try {
			
			ResultSet rs = db.executeQuery(query);

			Credentials credential = null;
			while (rs.next()) {
				credential = new Credentials();
				
				String identifiant = String.valueOf(rs.getInt(9));
				String email = rs.getString(2);
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				PointLocation pl = pls.getPLById(String.valueOf(rs.getInt(9)));
				
				emp.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				emp.setCredential(credential);				
				emp.setNom(nom);
				emp.setPrenom(prenom);
				emp.setNumeroTel(numtel);
				emp.setAdresseHabitation(adresse);
				emp.setPl(pl);
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return emp;
	}
	
	
	public Employe getEmployeByEmail (String email) throws IOException  {
		Employe emp = new Employe();
		PointLocationDao pls = new PointLocationDao();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur JOIN employe on utilisateur.identifiant= employe.identifiant_utilisateur WHERE (utilisateur.email="+email+")";
		try {
			
			ResultSet rs = db.executeQuery(query);

			Credentials credential = null;
			while (rs.next()) {
				credential = new Credentials();
				
				String identifiant = String.valueOf(rs.getInt(9));
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				PointLocation pl = pls.getPLById(String.valueOf(rs.getInt(10)));
				System.out.println();
				emp.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				emp.setCredential(credential);				
				emp.setNom(nom);
				emp.setPrenom(prenom);
				emp.setNumeroTel(numtel);
				emp.setAdresseHabitation(adresse);
				emp.setPl(pl);
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return emp;
	}
	
	
	public List<Employe> getAllListEmploye() throws IOException {
		List<Employe> emps = new ArrayList<Employe>();
		PointLocationDao pls = new PointLocationDao();
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur JOIN employe on utilisateur.identifiant= employe.identifiant_utilisateur";
		try {
			ResultSet rs = db.executeQuery(query);
			Employe emp = null;
			Credentials credential = null;
			while (rs.next()) {
				emp = new Employe();
				credential = new Credentials();
				String identifiant = String.valueOf(rs.getInt(9));
				String email = rs.getString(2);
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				PointLocation pl = pls.getPLById(String.valueOf(rs.getInt(10)));
				
				emp.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				emp.setCredential(credential);				
				emp.setNom(nom);
				emp.setPrenom(prenom);
				emp.setNumeroTel(numtel);
				emp.setAdresseHabitation(adresse);
				emp.setPl(pl);
				
				
				emps.add(emp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return emps;
	}
}
