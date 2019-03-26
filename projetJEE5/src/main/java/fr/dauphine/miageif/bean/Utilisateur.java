package fr.dauphine.miageif.bean;

/**
 * @author BOURIHANE
 *
 */
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="utilisateur")
public class Utilisateur {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name= "identifiant")
private String identifiant;

@Column(name="adresse_habitation")
private String adresseHabitation;

@Column(name="num_tel")
private String numeroTel;


@Column(name="nom")
private String nom;


@Column(name="prenom")
private String prenom;


@OneToOne(mappedBy = "user")
private Credentials credential;


@Column(name="url_photo")
private String urlPhoto;

public String getUrlPhoto() {
	return urlPhoto;
}
public void setUrlPhoto(String urlPhoto) {
	this.urlPhoto = urlPhoto;
}
public String getAdresseHabitation() {
	return adresseHabitation;
}
public void setAdresseHabitation(String adresseHabitation) {
	this.adresseHabitation = adresseHabitation;
}
public String getNumeroTel() {
	return numeroTel;
}
public void setNumeroTel(String numeroTel) {
	this.numeroTel = numeroTel;
}
public String getIdentifiant() {
	return identifiant;
}
public void setIdentifiant(String identifiant) {
	this.identifiant = identifiant;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getPrenom() {
	return prenom;
}
public void setPrenom(String prenom) {
	this.prenom = prenom;
}
public Credentials getCredential() {
	return credential;
}
public void setCredential(Credentials credential) {
	this.credential = credential;
}


}
