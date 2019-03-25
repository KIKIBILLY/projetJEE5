package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.dauphine.miageif.bean.PointLocation;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;

/**
 * @author REZKELLAH
 *
 */
public class PointLocationDao {
	MysqlDB db = new MysqlDB();
	Configuration conf = new Configuration();

	/**
	 * @param id
	 * @return
	 * @throws IOException
	 */
	public PointLocation getPLById(String id) throws IOException {
		PointLocation pl = new PointLocation();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from point_location where identifiant =" + Integer.parseInt(id);
		System.out.println(query);
		try {
			ResultSet rs = db.executeQuery(query);
			rs.next();
			pl.setIdPL(String.valueOf(rs.getInt(1)));
			pl.setLibelle(rs.getString(2));
			pl.setAdresse(rs.getString(3));

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return pl;
	}

	public List<PointLocation> getListPointlocation() throws IOException {
		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		List<PointLocation> pls = new ArrayList<PointLocation>();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from point_location";
		try {
			ResultSet rs = db.executeQuery(query);
			PointLocation pl = null;
			while (rs.next()) {
				pl = new PointLocation();
				pl.setIdPL(String.valueOf(rs.getInt(1)));
				pl.setLibelle(rs.getString(2));
				pl.setAdresse(rs.getString(3));
				pls.add(pl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return pls;
	}
	public void deletePointLocation(int id) throws IOException {
		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		
		String query = "DELETE FROM point_location where identifiant="+id;
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
