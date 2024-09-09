package com.Model;

public class Ouvrage {
	
    private String code;
    private String titre;
    private String auteur;
    private String editeur;
    private int annee;
    private int quantite;
    private String catalogue;
    private String emplacement;

    // Constructeur
    public Ouvrage(String code, String titre, String auteur, String editeur, int annee, int quantite, String catalogue, String emplacement) {
        this.code = code;
        this.titre = titre;
        this.auteur = auteur;
        this.editeur = editeur;
        this.annee = annee;
        this.quantite = quantite;
        this.catalogue = catalogue;
        this.emplacement = emplacement;
    }

    // Getters and Setters
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getAuteur() {
        return auteur;
    }

    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public String getEditeur() {
        return editeur;
    }

    public void setEditeur(String editeur) {
        this.editeur = editeur;
    }

    public int getAnnee() {
        return annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getCatalogue() {
        return catalogue;
    }

    public void setCatalogue(String catalogue) {
        this.catalogue = catalogue;
    }

    public String getEmplacement() {
        return emplacement;
    }

    public void setEmplacement(String emplacement) {
        this.emplacement = emplacement;
    }
}
