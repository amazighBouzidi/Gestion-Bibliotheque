package com.Model;

public class Exemplaire {
    private String reference;
    private static String emplacement;
    private String disponibilite;

    public Exemplaire() {
        // Constructeur par défaut
    }

    public Exemplaire(String reference, String emplacement, String disponibilite) {
        this.reference = reference;
        this.emplacement = emplacement;
        this.disponibilite = disponibilite;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public static String getEmplacement() {
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
}
