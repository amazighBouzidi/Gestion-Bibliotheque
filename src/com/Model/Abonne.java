package com.Model;

import java.util.Date;

public class Abonne {
    private String matricule;
    private String matriculeO;
    private String nom;
    private String prenom;
    private String adresse;
    private String telephone;
    private String faculte;
    private String type;
    private String sommeForfaitaire;
    private String cotisation;
    private String dateAjout;

    public Abonne(String matricule,String nom, String prenom, String adresse, String telephone, String faculte, String type,
    		String sommeForfaitaire, String cotisation, String dateAjout) {
        super();
        this.matricule = matricule;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.telephone = telephone;
        this.faculte = faculte;
        this.type = type;
        this.sommeForfaitaire = sommeForfaitaire;
        this.cotisation = cotisation;
        this.dateAjout = dateAjout;
    }

    public Abonne(String matriculeO, String matriculeN, String nom, String prenom, String adresse, String telephone, String faculte,
            String type, String sommeForfaitaire, String cotisation, String dateAjout) {
        super();
        this.matriculeO = matriculeO;
        this.matricule = matriculeN;
        this.nom = nom;
        this.prenom = prenom;
        this.adresse = adresse;
        this.telephone = telephone;
        this.faculte = faculte;
        this.type = type;
        this.sommeForfaitaire = sommeForfaitaire;
        this.cotisation = cotisation;
        this.dateAjout = dateAjout;
    }
    
    public String getMatriculeO() {
        return matriculeO;
    }

    public void setMatriculeO(String matriculeO) {
        this.matriculeO = matriculeO;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getFaculte() {
        return faculte;
    }

    public void setFaculte(String faculte) {
        this.faculte = faculte;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSommeForfaitaire() {
        return sommeForfaitaire;
    }

    public void setSommeForfaitaire(String sommeForfaitaire) {
        this.sommeForfaitaire = sommeForfaitaire;
    }

    public String getCotisation() {
        return cotisation;
    }

    public void setCotisation(String cotisation) {
        this.cotisation = cotisation;
    }

    public String getDateAjout() {
        return dateAjout;
    }

    public void setDateAjout(String dateAjout) {
        this.dateAjout = dateAjout;
    }
}
