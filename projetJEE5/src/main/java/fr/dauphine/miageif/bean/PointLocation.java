package fr.dauphine.miageif.bean;

import java.util.List;

/**
 * @author REZKELLAH
 *
 */
public class PointLocation {

	private String idPL;
	private String libelle;
	private String adresse;
	private List<Employe> listEmploye;

	public String getIdPL() {
		return idPL;
	}

	public void setIdPL(String idPL) {
		this.idPL = idPL;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public List<Employe> getListEmploye() {
		return listEmploye;
	}

	public void setListEmploye(List<Employe> listEmploye) {
		this.listEmploye = listEmploye;
	}
}
