package fr.dauphine.miageif.dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.bean.Utilisateur;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;
/**
 * @author BOURIHANE
 *
 */
public class UtilisateurDao {
	MysqlDB db = new MysqlDB();
	Configuration conf = new Configuration();

	
	
	public Utilisateur getUtilisateur (String email) throws IOException  {
		Utilisateur utilisateur = new Utilisateur();
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String query = "Select * from utilisateur WHERE (utilisateur.email= "+ email+")";
		try {
			
			ResultSet rs = db.executeQuery(query);
			Credentials credential = null;
			while (rs.next()) {
				credential = new Credentials();				
				String identifiant = rs.getString(1);
				String emaiL = rs.getString(2);
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				String urlphoto= rs.getString(8);
				
				
				utilisateur.setIdentifiant(identifiant);
				credential.setEmail(emaiL);
				credential.setPassword(password);
				utilisateur.setCredential(credential);				
				utilisateur.setNom(nom);
				utilisateur.setPrenom(prenom);
				utilisateur.setNumeroTel(numtel);
				utilisateur.setAdresseHabitation(adresse);
				utilisateur.setUrlPhoto(urlphoto);
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return utilisateur;
	}
	
	
	
}
