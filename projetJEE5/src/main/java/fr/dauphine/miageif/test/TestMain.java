package fr.dauphine.miageif.test;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Employe;
import fr.dauphine.miageif.bean.Location;
import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.dao.LocationDao;
import fr.dauphine.miageif.dao.PointLocationDao;
import fr.dauphine.miageif.db.MysqlDB;

public class TestMain {

	public static void main(String[] args) throws SQLException, IOException {
		List<Location> locations = new ArrayList<Location>();
		String idCLient="2";
		LocationDao locationDao= new LocationDao();
		locations=locationDao.getLocationByClientId(idCLient);
		System.out.println(locations.get(0).getDateLimitLocation());

	}

}
