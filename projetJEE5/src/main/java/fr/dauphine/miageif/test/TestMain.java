package fr.dauphine.miageif.test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Employe;
import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.dao.PointLocationDao;
import fr.dauphine.miageif.db.MysqlDB;

public class TestMain {

	public static void main(String[] args) throws SQLException, IOException {
		MysqlDB db= new MysqlDB();
		Configuration conf = new Configuration();
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
				String identifiant = String.valueOf(rs.getInt(1));
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
		//ReservationDao resDao = new ReservationDao();
		//System.out.println(resDao.getReservationByClientId("3").get(0).getObjet().getImages().get(0));
		//System.out.println(GenerateurID.generate(12));
		/*MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from annonce";
		try {
			ResultSet rs = db.executeQuery(query);
			String[] produit = new String[5];

			while (rs.next()) { 
			    produit[0]= rs.getString(1);
			    produit[1]= rs.getString(2);
			    produit[2]= rs.getString(3);
			    produit[3]= rs.getString(4);
			    produit[4]= rs.getString(5);
			}
			System.out.println(produit[2]);


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/

	}

}
