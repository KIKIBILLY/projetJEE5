package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import fr.dauphine.miageif.bean.Parametres;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;

public class ParametresDao {

	public Parametres getParametres() throws IOException {
		MysqlDB db = new MysqlDB();
		Configuration conf = new Configuration();
		Parametres p = null;
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from parametres ";
		try {
			ResultSet rs = db.executeQuery(query);			
			while (rs.next()) { 
				p = new Parametres();
			    p.setNDML(rs.getInt(1));
			    p.setNDmL(rs.getInt(2));
			    p.setNMOR(rs.getInt(3));
			    p.setNDMR(rs.getInt(4));
			    p.setNMOL(rs.getInt(5));
			    			    
			}
		return p;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return p;
	}
	
	public void updateParametres(int NDML,int NDmL,int NMOR,int NDMR,int NMOL) {
		try
	    {
	      // create a java mysql database connection
	      String myDriver = "com.mysql.jdbc.Driver";
	      String myUrl = "jdbc:mysql://localhost:3306/locationdb";
	      Class.forName(myDriver);
	      Connection conn = DriverManager.getConnection(myUrl, "root", "");
	      PreparedStatement preparedStmt;
	      
	      String query = "UPDATE parametres SET NDML = ?, NDmmL = ?, NMOR = ?, NDMR = ?, NMOL = ?";
	      preparedStmt = conn.prepareStatement(query);
	      preparedStmt.setInt(1,NDML);
	      preparedStmt.setInt(2,NDmL);
	      preparedStmt.setInt(3,NMOR);
	      preparedStmt.setInt(4,NDMR);
	      preparedStmt.setInt(5,NMOL);
	      

	      // execute the java preparedstatement
	      preparedStmt.executeUpdate();
	      conn.close();
	    }
	    catch (Exception e)
	    {
	      System.err.println("Got an exception! ");
	      System.err.println(e.getMessage());
	    }
		
		
		
	}
}
