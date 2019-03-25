package fr.dauphine.miageif.bean;

/**
 * @author REZKELLAH
 *
 */
public class Reservation {

	private String idReservation;
	private String idClient;
	private Objet objet;
	private String dateReservation;
	private String dateLimitReservation;
	private int NbrJourReservation;

	public String getIdReservation() {
		return idReservation;
	}

	public void setIdReservation(String idReservation) {
		this.idReservation = idReservation;
	}

	public String getIdClient() {
		return idClient;
	}

	public void setIdClient(String idClient) {
		this.idClient = idClient;
	}

	public String getDateReservation() {
		return dateReservation;
	}

	public void setDateReservation(String dateReservation) {
		this.dateReservation = dateReservation;
	}

	public String getDateLimitReservation() {
		return dateLimitReservation;
	}

	public void setDateLimitReservation(String dateLimitReservation) {
		this.dateLimitReservation = dateLimitReservation;
	}

	public int getNbrJourReservation() {
		return NbrJourReservation;
	}

	public void setNbrJourReservation(int nbrJourReservation) {
		NbrJourReservation = nbrJourReservation;
	}

	public Objet getObjet() {
		return objet;
	}

	public void setObjet(Objet objet) {
		this.objet = objet;
	}
}
