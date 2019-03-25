package fr.dauphine.miageif.bean;

public class Employe extends Utilisateur{

	
	private String identifiantPL;
	private PointLocation pl;
	
	public PointLocation getPl() {
		return pl;
	}
	public void setPl(PointLocation pl) {
		this.pl = pl;
	}
	public String getIdentifiantPL() {
		return identifiantPL;
	}
	public void setIdentifiantPL(String identifiantPL) {
		this.identifiantPL = identifiantPL;
	}
	
	
}
