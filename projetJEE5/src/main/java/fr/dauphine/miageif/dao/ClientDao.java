package fr.dauphine.miageif.dao;
/**
 * @author BOURIHANE
 *
 */
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import fr.dauphine.miageif.bean.Client;
import fr.dauphine.miageif.bean.Credentials;
import fr.dauphine.miageif.config.Configuration;
import fr.dauphine.miageif.db.MysqlDB;

public class ClientDao {
	MysqlDB db = new MysqlDB();
	Configuration conf = new Configuration();

	
	
	
	public Client getClient (String id) throws IOException  {
		Client client = new Client();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String query = "Select * from utilisateur JOIN client on utilisateur.identifiant= client.identifiant_utilisateur WHERE (utilisateur.identifiant= "+ id+")";
		try {
			
			ResultSet rs = db.executeQuery(query);
			
			Credentials credential = null;
			while (rs.next()) {
				credential = new Credentials();
				
				String identifiant = String.valueOf(rs.getInt(1));
				String email = rs.getString(2);
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				String urlphoto= rs.getString(8);
				
				
				client.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				client.setCredential(credential);				
				client.setNom(nom);
				client.setPrenom(prenom);
				client.setNumeroTel(numtel);
				client.setAdresseHabitation(adresse);
				client.setUrlPhoto(urlphoto);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return client;
	}
	
	
	
	public List<Client> getAllListClient() throws IOException {
		List<Client> clients = new ArrayList<Client>();
		
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur JOIN client on utilisateur.identifiant= client.identifiant_utilisateur";
		try {
			ResultSet rs = db.executeQuery(query);
			Client client = null;
			Credentials credential = null;
			while (rs.next()) {
				client = new Client();
				credential = new Credentials();
				String identifiant = String.valueOf(rs.getInt(1));
				String email = rs.getString(2);
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				
				client.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				client.setCredential(credential);				
				client.setNom(nom);
				client.setPrenom(prenom);
				client.setNumeroTel(numtel);
				client.setAdresseHabitation(adresse);
				
				clients.add(client);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return clients;
	}
}
