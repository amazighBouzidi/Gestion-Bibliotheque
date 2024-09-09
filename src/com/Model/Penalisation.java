package com.Model;

public class Penalisation {
	 private int id;
	    private String matriculeLecteur;
	    private String dateDebut;
	    private String dateFin;
	    private String motif;
  

	    public Penalisation(String matriculeLecteur, String dateDebut, String dateFin, String motif) {
	        this.matriculeLecteur = matriculeLecteur;
	        this.dateDebut = dateDebut;
	        this.dateFin = dateFin;
	        this.motif = motif;
	    }

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getMatriculeLecteur() {
	        return matriculeLecteur;
	    }

	    public void setMatriculeLecteur(String matriculeLecteur) {
	        this.matriculeLecteur = matriculeLecteur;
	    }

	    public String getDateDebut() {
	        return dateDebut;
	    }

	    public void setDateDebut(String dateDebut) {
	        this.dateDebut = dateDebut;
	    }

	    public String getDateFin() {
	        return dateFin;
	    }

	    public void setDateFin(String dateFin) {
	        this.dateFin = dateFin;
	    }

	    public String getMotif() {
	        return motif;
	    }

	    public void setMotif(String motif) {
	        this.motif = motif;
	    }
}
