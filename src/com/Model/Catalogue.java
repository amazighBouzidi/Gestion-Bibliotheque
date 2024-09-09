package com.Model;

public class Catalogue {
    private int id;
    private String nomC;

    public Catalogue(String nomC) {
        this.nomC = nomC;
    }

    public Catalogue(int id, String nomC) {
        this.id = id;
        this.nomC = nomC;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomC() {
        return nomC;
    }

    public void setNomC(String nomC) {
        this.nomC = nomC;
    }
}
