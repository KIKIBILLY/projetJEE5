package fr.dauphine.miageif.bean;


public class Location {
	private String idLocation;
	private String dateLimitLocation;
	private Reservation reservation;
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	private String dateLocation;


	public String getDateLimitLocation() {
		return dateLimitLocation;
	}
	public void setDateLimitLocation(String dateLimitLocation) {
		this.dateLimitLocation = dateLimitLocation;
	}
	public String getIdLocation() {
		return idLocation;
	}
	public void setIdLocation(String idLocation) {
		this.idLocation = idLocation;
	}
	
	public String getDateLocation() {
		return dateLocation;
	}
	public void setDateLocation(String dateLocation) {
		this.dateLocation = dateLocation;
	}

}
