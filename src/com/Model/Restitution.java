package com.Model;

import java.sql.Date;

public class Restitution {
   
    private Date daterestitution;
    private String matriculelecteur;
    private String codeexamplaire;
    private int id;

    public Restitution(int id, Date daterestitution, String matriculelecteur, String codeexamplaire) {
        this.id = id;
        this.daterestitution = daterestitution;
        this.matriculelecteur = matriculelecteur;
        this.codeexamplaire = codeexamplaire;
    }

   

	public Date getDaterestitution() {
        return this.daterestitution;
    }

    public void setDaterestitution(Date daterestitution) {
        this.daterestitution = daterestitution;
    }

    public String getMatriculelecteur() {
        return this.matriculelecteur;
    }

    public void setMatriculelecteur(String matriculelecteur) {
        this.matriculelecteur = matriculelecteur;
    }

    public String getCodeexamplaire() {
        return this.codeexamplaire;
    }

    public void setCodeexamplaire(String codeexamplaire) {
        this.codeexamplaire = codeexamplaire;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }



	public int getIdEmprunt() {
		
		return 0;
	}
}
