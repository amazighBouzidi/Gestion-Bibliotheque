package com.Model;

public class Examplaire {
	private int id;
    private String reference;
    private String emplacement;
    private String disponibilite;
    private String dateR;
    
    public Examplaire(String reference, String emplacement, String disponibilite, String date) {
		super();
		this.id = id;
		this.reference = reference;
		this.emplacement = emplacement;
		this.disponibilite = disponibilite;
		this.dateR = date;
	}
    
	public Examplaire(int id, String reference, String emplacement, String disponibilite, String date) {
		super();
		this.id = id;
		this.reference = reference;
		this.emplacement = emplacement;
		this.disponibilite = disponibilite;
		this.dateR = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public String getEmplacement() {
		return emplacement;
	}

	public void setEmplacement(String emplacement) {
		this.emplacement = emplacement;
	}

	public String getDisponibilite() {
		return disponibilite;
	}

	public void setDisponibilite(String disponibilite) {
		this.disponibilite = disponibilite;
	}

	public String getDateR() {
		return dateR;
	}

	public void setDateR(String dateR) {
		this.dateR = dateR;
	}
    
	
    
}
