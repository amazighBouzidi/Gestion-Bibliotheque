package com.Model;

public class Retard {
	private int idRetard;
    private String matriculeLecteur;
    private String codeExemplaire;
    private String datePrevu;
    private String dateReelle;

    public Retard() {
        // Default constructor
    }

    public Retard(int idRetard, String matriculeLecteur, String codeExemplaire, String datePrevu, String dateReelle) {
        this.idRetard = idRetard;
        this.matriculeLecteur = matriculeLecteur;
        this.codeExemplaire = codeExemplaire;
        this.datePrevu = datePrevu;
        this.dateReelle = dateReelle;
    }

	public int getIdRetard() {
		return idRetard;
	}

	public void setIdRetard(int idRetard) {
		this.idRetard = idRetard;
	}

	public String getMatriculeLecteur() {
		return matriculeLecteur;
	}

	public void setMatriculeLecteur(String matriculeLecteur) {
		this.matriculeLecteur = matriculeLecteur;
	}

	public String getCodeExemplaire() {
		return codeExemplaire;
	}

	public void setCodeExemplaire(String codeExemplaire) {
		this.codeExemplaire = codeExemplaire;
	}

	public String getDatePrevu() {
		return datePrevu;
	}

	public void setDatePrevu(String datePrevu) {
		this.datePrevu = datePrevu;
	}

	public String getDateReelle() {
		return dateReelle;
	}

	public void setDateReelle(String dateReelle) {
		this.dateReelle = dateReelle;
	}
}
