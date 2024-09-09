package com.Model;

public class Emprunt {
    private int idemprunt;
    private String dateemprunt;
    private String heureemprunt;
    private String dateretour;
    private String prolonge;
    private String regler;
    private String matriculelecteur;
    private String codeexamplaire;

    public Emprunt(int idemprunt, String dateemprunt, String heureemprunt, String dateretour, String prolonge, String regler, String matriculelecteur, String codeexamplaire) {
        this.idemprunt = idemprunt;
        this.dateemprunt = dateemprunt;
        this.heureemprunt = heureemprunt;
        this.dateretour = dateretour;
        this.prolonge = prolonge;
        this.regler = regler;
        this.matriculelecteur = matriculelecteur;
        this.codeexamplaire = codeexamplaire;
    }
    
    public Emprunt(String dateemprunt, String heureemprunt, String dateretour, String prolonge, String regler, String matriculelecteur, String codeexamplaire) {
        this.idemprunt = idemprunt;
        this.dateemprunt = dateemprunt;
        this.heureemprunt = heureemprunt;
        this.dateretour = dateretour;
        this.prolonge = prolonge;
        this.regler = regler;
        this.matriculelecteur = matriculelecteur;
        this.codeexamplaire = codeexamplaire;
    }

    public int getIdemprunt() {
        return idemprunt;
    }

    public void setIdemprunt(int idemprunt) {
        this.idemprunt = idemprunt;
    }

    public String getDateemprunt() {
        return dateemprunt;
    }

    public void setDateemprunt(String dateemprunt) {
        this.dateemprunt = dateemprunt;
    }

    public String getHeureemprunt() {
        return heureemprunt;
    }

    public void setHeureemprunt(String heureemprunt) {
        this.heureemprunt = heureemprunt;
    }

    public String getDateretour() {
        return dateretour;
    }

    public void setDateretour(String dateretour) {
        this.dateretour = dateretour;
    }

    public String getProlonge() {
        return prolonge;
    }

    public void setProlonge(String prolonge) {
        this.prolonge = prolonge;
    }

    public String getRegler() {
        return regler;
    }

    public void setRegler(String regler) {
        this.regler = regler;
    }

    public String getMatriculelecteur() {
        return matriculelecteur;
    }

    public void setMatriculelecteur(String matriculelecteur) {
        this.matriculelecteur = matriculelecteur;
    }

    public String getCodeexamplaire() {
        return codeexamplaire;
    }

    public void setCodeexamplaire(String codeexamplaire) {
        this.codeexamplaire = codeexamplaire;
    }
}
