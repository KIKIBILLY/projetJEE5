package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fr.dauphine.miageif.bean.EtatObjet;
import fr.dauphine.miageif.bean.FicheProduit;
import fr.dauphine.miageif.bean.Objet;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;
import fr.dauphine.miageif.util.GenerateurID;

/**
 * @author REZKELLAH
 *
 */
public class ObjetDao {
	MysqlDB db = new MysqlDB();
	MysqlDB db2 = new MysqlDB();
	Configuration conf = new Configuration();

	public List<Objet> getAllListObjet() throws IOException {
		List<Objet> objets = new ArrayList<Objet>();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
			db2.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from objet where id_objet not in (select id_objet from reservation)";// ajouter union location
		try {
			ResultSet rs = db.executeQuery(query);
			Objet objet = null;
			FicheProduit fp = null;
			while (rs.next()) {
				objet = new Objet();
				fp = new FicheProduit();
				objet.setIdentifiant(rs.getString(1));
				objet.setCategorie(rs.getString(2));
				objet.setIdPL(String.valueOf(rs.getInt(9)));
				fp.setLibelle(rs.getString(3));
				fp.setDescription(rs.getString(4));
				fp.setpxlj(rs.getDouble(5));
				fp.setcl(rs.getDouble(6));
				fp.setadj(rs.getDouble(7));
				fp.setDefauts(rs.getString(8));
				objet.setFp(fp);
				ResultSet rs2 = db2.executeQuery(
						"select url_image from image_objet as i,objet as o where i.id_objet=o.id_objet and i.id_objet='"
								+ objet.getIdentifiant() + "'");
				while (rs2.next()) {
					objet.getImages().add(rs2.getString(1));
				}
				objets.add(objet);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return objets;
	}

	/**
	 * @param id
	 * @return
	 * @throws IOException
	 */
	public Objet getObjetById(String id) throws IOException {
		Objet objet = new Objet();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
			db2.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from objet where id_objet ='" + id + "'";
		try {
			ResultSet rs = db.executeQuery(query);
			FicheProduit fp = null;
			rs.next();
			objet = new Objet();
			fp = new FicheProduit();
			objet.setIdentifiant(rs.getString(1));
			objet.setCategorie(rs.getString(2));
			fp.setLibelle(rs.getString(3));
			fp.setDescription(rs.getString(4));
			fp.setpxlj(rs.getDouble(5));
			fp.setcl(rs.getDouble(6));
			fp.setadj(rs.getDouble(7));
			fp.setDefauts(rs.getString(8));
			objet.setIdPL(String.valueOf(rs.getInt(9)));
			objet.setFp(fp);
			ResultSet rs2 = db2.executeQuery(
					"select url_image from image_objet as i,objet as o where i.id_objet=o.id_objet and i.id_objet='"
							+ objet.getIdentifiant() + "'");
			while (rs2.next()) {
				objet.getImages().add(rs2.getString(1));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return objet;
	}
	public List<Objet> getListObjetPl(String email) throws IOException {
		List<Objet> objets = new ArrayList<Objet>();
		EmployeeDao edao = new EmployeeDao();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
			db2.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String idPl = edao.getEmployeByEmail(email).getPl().getIdPL();
		
		String query="Select * from objet WHERE (id_point de location="+idPl+") and (id_objet not in (select id_objet from reservation))";
		try {
			ResultSet rs = db.executeQuery(query);
			Objet objet = null;
			FicheProduit fp = null;
			while (rs.next()) {
				objet = new Objet();
				fp = new FicheProduit();
				objet.setIdentifiant(rs.getString(1));
				objet.setCategorie(rs.getString(2));
				objet.setIdPL(String.valueOf(rs.getInt(9)));
				fp.setLibelle(rs.getString(3));
				fp.setDescription(rs.getString(4));
				fp.setpxlj(rs.getDouble(5));
				fp.setcl(rs.getDouble(6));
				fp.setadj(rs.getDouble(7));
				fp.setDefauts(rs.getString(8));
				objet.setFp(fp);
				ResultSet rs2 = db2.executeQuery(
						"select url_image from image_objet as i,objet as o where i.id_objet=o.id_objet and i.id_objet='"
								+ objet.getIdentifiant() + "'");
				while (rs2.next()) {
					objet.getImages().add(rs2.getString(1));
				}
				objets.add(objet);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return objets;
	}
	//insertion d'un objet dans la table 
		public void insertObjet(Objet objet) throws IOException {
			try {
				db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
				db2.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			GenerateurID gid = new GenerateurID();
			
			String id_objet = gid.generate(12);
			String cat_objet = objet.getCategorie();
			String lib_objet = objet.getFp().getLibelle();
			String desc_objet = objet.getFp().getDescription();
			double px_objet = objet.getFp().getpxlj();
			double cl_objet = objet.getFp().getcl();
			double adj_objet = objet.getFp().getadj();
			String def_objet = objet.getFp().getDefauts();

			System.out.println("===============<"+ objet.getIdPL());
			int id_stock_objet = Integer.parseInt(objet.getIdPL());
			String url_image = objet.getImages().get(objet.getImages().size() - 1);
			
			
			String query1 = "INSERT INTO objet (id_objet, categorie,libelle, description, pxlj, cl, adj, defauts, id_stock) "
					+ "VALUES ('"+id_objet+"', '"+cat_objet+"', '"+lib_objet+"', '"+desc_objet+"',"+px_objet+","+cl_objet+","+adj_objet+",'"+def_objet+"',"+id_stock_objet+")";
			
			String query2 = "INSERT INTO image_objet (id_objet, url_image) "
					+ "VALUES ('"+id_objet+"', '"+url_image+"')";
							
			
			
			try {
				db.executeQuery(query1);
				db.executeQuery(query2);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.close();
		}
		
		public void updateObjet(Objet obj) throws IOException {
			
			try {
				db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String query = "UPDATE objet SET libelle = '"+obj.getFp().getLibelle()+"', description = '"+obj.getFp().getDescription()+"', pxlj ="+obj.getFp().getpxlj()+", cl = "+obj.getFp().getcl()+", adj ="+obj.getFp().getadj()+", defauts = '"+obj.getFp().getDefauts()+"' WHERE id_objet='"+obj.getIdentifiant()+"' ";
			try {
				System.out.println("Je suis entrain d'execter la requete");
				db.executeQuery(query);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.close();
		}
		public List<Objet> getListObjetPl(String email, EtatObjet etat) throws IOException {
			List<Objet> objets = new ArrayList<Objet>();
			EmployeeDao edao = new EmployeeDao();
			try {
				db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
				db2.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int idPl = Integer.parseInt(edao.getEmployeByEmail(email).getPl().getIdPL());
			
			String query;
			
			if (etat==EtatObjet.reserve){
					query="Select * from objet WHERE (id_stock="+idPl+") and (id_objet in (select id_objet from reservation)) and (id_objet not in (select r.id_objet from reservation r join location l on r.id_reservation = l.id_reservation))";
			}else {
				if(etat==EtatObjet.loue) {
					query="Select * from objet WHERE (id_stock="+idPl+") and (id_objet in (select r.id_objet from reservation r join location l on r.id_reservation=l.id_reservation))";
				}else {
					query="Select * from objet WHERE (id_stock="+idPl+") and (id_objet not in (select id_objet from reservation))";
				}
			}
			try {
				ResultSet rs = db.executeQuery(query);
				Objet objet = null;
				FicheProduit fp = null;
				while (rs.next()) {
					objet = new Objet();
					fp = new FicheProduit();
					objet.setIdentifiant(rs.getString(1));
					objet.setCategorie(rs.getString(2));
					objet.setIdPL(String.valueOf(rs.getInt(9)));
					fp.setLibelle(rs.getString(3));
					fp.setDescription(rs.getString(4));
					fp.setpxlj(rs.getDouble(5));
					fp.setcl(rs.getDouble(6));
					fp.setadj(rs.getDouble(7));
					fp.setDefauts(rs.getString(8));
					objet.setFp(fp);
					ResultSet rs2 = db2.executeQuery(
							"select url_image from image_objet as i,objet as o where i.id_objet=o.id_objet and i.id_objet='"
									+ objet.getIdentifiant() + "'");
					while (rs2.next()) {
						objet.getImages().add(rs2.getString(1));
					}
					objets.add(objet);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    db.close();
			return objets;
		}
}
