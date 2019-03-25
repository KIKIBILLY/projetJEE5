package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import fr.dauphine.miageif.bean.Reservation;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;
import fr.dauphine.miageif.util.GenerateurID;

/**
 * @author REZKELLAH
 *
 */

public class ReservationDao {

	public void addReservation(String idObjet, String idClient, int dureReservation) throws IOException {
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
		String query = "INSERT INTO `reservation`(`id_reservation`, `id_client`, `id_objet`, `date_reservation`, `date_limite_reservation`, "
				+ "`nombre_jour_reservation`) VALUES ('" + GenerateurID.generate(12) + "'," + Integer.parseInt(idClient)
				+ ",'" + idObjet + "','" + currentDate + "','" + newDate + "'," + dureReservation + ")";
		try {
			db.executeQuery(query);
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
		String query = "select * from reservation where id_client =" + Integer.parseInt(idClient);
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