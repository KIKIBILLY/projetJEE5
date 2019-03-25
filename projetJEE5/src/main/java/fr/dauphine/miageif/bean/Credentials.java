package fr.dauphine.miageif.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name= "credential")
public class Credentials {

	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name= "id_credential")
private int identifiant;



@Column(name= "email")
private String email;

@Column(name= "password")
private String password;

@OneToOne
@JoinColumn(name="id_utilisateur")
private Utilisateur user;


public int getIdentifiant() {
	return identifiant;
}


public void setIdentifiant(int identifiant) {
	this.identifiant = identifiant;
}




public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}




}
