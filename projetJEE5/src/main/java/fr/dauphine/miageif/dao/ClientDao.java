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
		
		String query = "Select * from utilisateur JOIN client on utilisateur.identifiant= client.identifiant_utilisateur WHERE (client.identifiant= "+ id+")";
		try {
			
			ResultSet rs = db.executeQuery(query);
			
			Credentials credential = null;
			while (rs.next()) {
				credential = new Credentials();
				
				String identifiant = String.valueOf(rs.getInt(9));
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
	
	
	public Client getClientByUserId (String id) throws IOException  {
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
				
				String identifiant = String.valueOf(rs.getInt(9));
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
				String identifiant = String.valueOf(rs.getInt(9));
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
	
	
	public Client getClientByEmail (String email) throws IOException  {
		Client client = new Client();
		PointLocationDao pls = new PointLocationDao();
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur JOIN client on utilisateur.identifiant= client.identifiant_utilisateur WHERE (utilisateur.email='"+email+"')";
		try {
			
			ResultSet rs = db.executeQuery(query);

			Credentials credential = null;
			while (rs.next()) {
				credential = new Credentials();
				
				String identifiant = String.valueOf(rs.getInt(1));
				String password = rs.getString(3);
				String nom = rs.getString(4);
				String prenom = rs.getString(5);
				String numtel = rs.getString(6);
				String adresse = rs.getString(7);
				String urlPhoto = rs.getString(8);
				
				client.setIdentifiant(identifiant);
				credential.setEmail(email);
				credential.setPassword(password);
				client.setCredential(credential);				
				client.setNom(nom);
				client.setPrenom(prenom);
				client.setNumeroTel(numtel);
				client.setAdresseHabitation(adresse);
				client.setUrlPhoto(urlPhoto);
				
				
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return client;
	}

public boolean possedeLocation (String email) throws IOException  {
		
		boolean possede = false; 
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "Select * from utilisateur u JOIN client c on u.identifiant = c.identifiant_utilisateur JOIN reservation r on c.identifiant = r.id_client JOIN location l on r.id_reservation=l.id_reservation WHERE u.email='"+email+"'";
		try {
			
			ResultSet rs = db.executeQuery(query);
			while (rs.next()) {				
				possede = true;			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return possede;
	}

public void updateClient(Client client, String emailAncien) throws IOException {
		
		try {
			db.open(conf.dbHost, conf.dbPort, conf.dbName, conf.dbAdminLogin, conf.dbAdminPwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "UPDATE utilisateur SET email = '"+client.getCredential().getEmail()+"', password = '"+client.getCredential().getPassword()+"', nom = '"+client.getNom()+"', prenom = '"+client.getPrenom()+"', num_tel ='"+client.getNumeroTel()+"', adresse_habitation = '"+client.getAdresseHabitation()+"' WHERE email='"+emailAncien+"' ";
		try {
			db.executeQuery(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
	}
public void deleteClient(int id) throws IOException {
	MysqlDB db = new MysqlDB();
	Configuration conf = new Configuration();
	
	String query = "DELETE FROM client where identifiant="+id;
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
