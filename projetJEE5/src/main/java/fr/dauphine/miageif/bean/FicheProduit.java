package fr.dauphine.miageif.bean;

/**
 * @author REZKELLAH
 *
 */
public class FicheProduit {
	private String libelle;
	private Double pxlj;// prix de location par jour
	private Double cl; // caution de location
	private Double adj; // amende de depassement journaliere
	private String description; // description technique du projet
	private String defauts; // liste des defauts connu de l'objet

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public Double getpxlj() {
		return pxlj;
	}

	public void setpxlj(Double pxlj) {
		this.pxlj = pxlj;
	}

	public Double getcl() {
		return cl;
	}

	public void setcl(Double cl) {
		this.cl = cl;
	}

	public Double getadj() {
		return adj;
	}

	public void setadj(Double adj) {
		this.adj = adj;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDefauts() {
		return defauts;
	}

	public void setDefauts(String defauts) {
		this.defauts = defauts;
	}
}
