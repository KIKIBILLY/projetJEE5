package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import fr.dauphine.miageif.bean.Client;
import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Reservation;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;
import fr.dauphine.miageif.util.GenerateurID;

/**
 * @author REZKELLAH
 *
 */

public class ReservationDao {

	public String addReservation(String idObjet, String idClient, int dureReservation) throws IOException {
		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ParametresDao pDao = new ParametresDao();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		// Getting current date
		Calendar cal = Calendar.getInstance();
		// Displaying current date in the desired format
		String currentDate = sdf.format(cal.getTime());
		// Number of Days to add
		cal.add(Calendar.DAY_OF_MONTH, pDao.getParametres().getNDMR());
		// Date after adding the days to the current date
		String newDate = sdf.format(cal.getTime());
		String id_reservation = GenerateurID.generate(12);
		String query = "INSERT INTO reservation (id_reservation, id_client, id_objet, date_reservation, date_limite_reservation, "
				+ "nombre_jour_reservation) VALUES ('" + id_reservation + "'," + Integer.parseInt(idClient)
				+ ",'" + idObjet + "','" + currentDate + "','" + newDate + "'," + dureReservation + ")";
		try {
			db.executeQuery(query);
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id_reservation;
	}
	
	public List<Reservation> getReservationByClientId(String idClient) throws IOException {

		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Reservation reservation = new Reservation();
		String query = "select * from reservation where id_client =" + Integer.parseInt(idClient) +" AND  reservation.id_reservation not in (select id_reservation from location)";
		ObjetDao objetDao = new ObjetDao();
		List<Reservation> reservations = new ArrayList<Reservation>();
		ResultSet rs;
		try {
			rs = db.executeQuery(query);
			while (rs.next()) {
				reservation = new Reservation();
				reservation.setIdReservation(rs.getString(1));
				reservation.setIdClient(idClient);
				reservation.setObjet(objetDao.getObjetById(rs.getString(3)));
				reservation.setDateReservation(rs.getString(4));
				reservation.setDateLimitReservation(rs.getString(5));
				reservation.setNbrJourReservation(rs.getInt(6));
				reservations.add(reservation);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return reservations;
	}
	
	
	public List<Reservation> getReservationByClientIdANDPointLocation(String idClient, String idEmploye) throws IOException {

		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Reservation reservation = new Reservation();
		String  query = "select * "
				+ "from (reservation  "
				+ "NATURAL JOIN objet  "
				+ "JOIN employe on objet.id_stock= employe.identifiant_pl)  "
				+ "WHERE (reservation.id_client = "+idClient+") AND (employe.identifiant="+idEmploye+")"
				+" AND  (reservation.id_reservation "
				+ "NOT in (select id_reservation from location))";
		ObjetDao objetDao = new ObjetDao();
		List<Reservation> reservations = new ArrayList<Reservation>();
		ResultSet rs;
		try {
			rs = db.executeQuery(query);
			
			while (rs.next()) {
				
				reservation = new Reservation();
				reservation.setObjet(objetDao.getObjetById(rs.getString(1)));
				reservation.setIdReservation(rs.getString(2));
				reservation.setIdClient(idClient);
				reservation.setDateReservation(rs.getString(4));
				reservation.setDateLimitReservation(rs.getString(5));
				reservation.setNbrJourReservation(rs.getInt(6));
				reservations.add(reservation);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return reservations;
	}
	
	
	public Client getClientDeReservation(String idObjet) throws IOException {

		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Reservation reservation = new Reservation();
		String query = "select * from reservation r join client c on r.id_client=c.identifiant join utilisateur u on u.identifiant=c.identifiant_utilisateur where r.id_objet ='"+idObjet+"'";
		
		Client client = new Client();
		Credentials credential = new Credentials();
		ResultSet rs;
		try {
			rs = db.executeQuery(query);
			while (rs.next()) {
				credential.setEmail(rs.getString(10));
				client.setNom(rs.getString(12));
				client.setPrenom(rs.getString(13));
				client.setAdresseHabitation(rs.getString(15));
				client.setNumeroTel(rs.getString(14));
				client.setCredential(credential);;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return client;
	}
	
	
	public Reservation getReservationId(String idReservation) throws IOException {

		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Reservation reservation = new Reservation();
		String query = "select * from reservation where reservation.id_reservation ='" + idReservation+ "'" ;
		ObjetDao objetDao = new ObjetDao();
		ResultSet rs;
		try {
			rs = db.executeQuery(query);
			while (rs.next()) {
				reservation = new Reservation();
				reservation.setIdReservation(rs.getString(1));
				reservation.setIdClient(rs.getString(2));
				reservation.setObjet(objetDao.getObjetById(rs.getString(3)));
				reservation.setDateReservation(rs.getString(4));
				reservation.setDateLimitReservation(rs.getString(5));
				reservation.setNbrJourReservation(rs.getInt(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return reservation;
	}
	
	public Reservation getReservationById(String idReservation) throws IOException {

		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Reservation reservation = new Reservation();
		String query = "select * from reservation where id_reservation ='" + idReservation +"'";
		ObjetDao objetDao = new ObjetDao();
		ResultSet rs;
		try {
			rs = db.executeQuery(query);
				rs.next();
				reservation = new Reservation();
				reservation.setIdReservation(rs.getString(1));
				reservation.setObjet(objetDao.getObjetById(rs.getString(3)));
				reservation.setDateReservation(rs.getString(4));
				reservation.setDateLimitReservation(rs.getString(5));
				reservation.setNbrJourReservation(rs.getInt(6));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return reservation;
	}
	
	public boolean updateReservation(String id,int nbJour) {
		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String query = "UPDATE reservation SET nombre_jour_reservation = " +  nbJour + " WHERE id_reservation = '" +
						id + "'";
		try {
			db.executeQuery(query);
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	
	public boolean deleteReservation(String id) {
		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String query = "delete from reservation where id_reservation='" + id + "'";
		try {
			db.executeQuery(query);
			return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
}
