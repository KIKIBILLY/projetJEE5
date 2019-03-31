package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import fr.dauphine.miageif.bean.Location;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;

public class LocationDao {
	public void addLocation(String idReservation) throws IOException {
		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ReservationDao rDao = new ReservationDao();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		// Getting current date
		Calendar cal = Calendar.getInstance();
		// Displaying current date in the desired format
		String currentDate = sdf.format(cal.getTime());
		// Number of Days to add
		cal.add(Calendar.DAY_OF_MONTH, rDao.getReservationId(idReservation).getNbrJourReservation());
		// Date after adding the days to the current date
		String newDate = sdf.format(cal.getTime());
		String query = "INSERT INTO `location`(`id_reservation`, `date_limite_location`, "
				+ "`date_location`) VALUES ('" + idReservation +"','" + newDate + "','" + currentDate +  "')";
		try {
			db.executeQuery(query);
			db.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Location> getLocationByClientId(String idClient) throws IOException {

		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		ReservationDao reservationDao= new ReservationDao();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		Location location = new Location();
		String query = "select * from reservation JOIN location on (reservation.id_reservation = location.id_reservation ) where (reservation.id_client =" + idClient+")";
		List<Location> locations = new ArrayList<Location>();
		ResultSet rs;
		try {
			rs = db.executeQuery(query);
			while (rs.next()) {
				location.setIdLocation(String.valueOf(rs.getInt(7)));
				location.setDateLocation(rs.getString(8));
				location.setReservation(reservationDao.getReservationId(rs.getString(9)));
				location.setDateLimitLocation(rs.getString(10));
				locations.add(location);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return locations;
	}
	
	
	
	public Location getLocationId(String idLocation) throws IOException {
		ReservationDao reservationDao= new ReservationDao();
		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String query = "select * from location where id_location =" + idLocation;
		Location location=new Location();
		
		ResultSet rs;
		try {
			rs = db.executeQuery(query);
			while (rs.next()) {
				location.setIdLocation(String.valueOf(rs.getInt(1)));
				location.setDateLocation(rs.getString(2));
				location.setReservation(reservationDao.getReservationId(rs.getString(9)));
				location.setDateLimitLocation(rs.getString(4));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return location;
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
