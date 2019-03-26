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
		String idClient= "3";
		String idEmploye = "11";
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "select * "
				+ "from (reservation "
				+ "NATURAL JOIN objet "
				+ "JOIN employe on objet.id_stock= employe.identifiant_pl) "
				+ "WHERE (reservation.id_client = "+idClient+") AND (employe.identifiant="+idEmploye+")";
		try {
			ResultSet rs = db.executeQuery(query);
			Employe emp = null;
			Credentials credential = null;
			

			while (rs.next()) {
							System.out.println(rs.getString(1));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*//ReservationDao resDao = new ReservationDao();
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

*/
		

	}

}
