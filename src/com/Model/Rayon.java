package com.Model;

public class Rayon {
    private int id;
    private String code;
    private String emplacement;

    public Rayon(int id, String code, String emplacement) {
        this.id = id;
        this.code = code;
        this.emplacement = emplacement;
    }

    public Rayon(String code, String emplacement) {
    	
        this.code = code;
        this.emplacement = emplacement;
	}
    

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getEmplacement() {
        return emplacement;
    }

    public void setEmplacement(String emplacement) {
        this.emplacement = emplacement;
    }
}
