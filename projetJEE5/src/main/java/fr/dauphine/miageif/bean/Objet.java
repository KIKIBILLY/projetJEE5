package fr.dauphine.miageif.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * @author REZKELLAH
 *
 */
public class Objet {

	private String identifiant;
	private String categorie;
	private List<String> images= new ArrayList<String>();
	private FicheProduit fp;
	private String idPL;

	public String getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

	public FicheProduit getFp() {
		return fp;
	}

	public void setFp(FicheProduit fp) {
		this.fp = fp;
	}

	public List<String> getImages() {
		return images;
	}

	public void setImages(List<String> images) {
		this.images = images;
	}

	public String getIdPL() {
		return idPL;
	}

	public void setIdPL(String idPL) {
		this.idPL = idPL;
	}
	

}
