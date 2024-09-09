package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DB.DBConnect;
import com.Model.Login;

public class LoginDAO {
	 private static final String CHECK_GERANT_QUERY = "SELECT * FROM gerant WHERE username = ? AND password = ?";
	    private static final String CHECK_BIBLIOTHECAIRE_QUERY = "SELECT * FROM bibliothecaire WHERE username = ? AND password = ?";

	    public LoginDAO() {
	        
	    }

	    // Check if a Gerant exists with the given username and password
	    public boolean checkGerantIfExists(Login login) {
	        boolean userExists = false;
	        try {
	            Connection connection = DBConnect.getConn();
	            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_GERANT_QUERY);
	            preparedStatement.setString(1, login.getUsername());
	            preparedStatement.setString(2, login.getPassword());
	            ResultSet rs = preparedStatement.executeQuery();
	            userExists = rs.next(); // true if a row is returned, false otherwise
	        } catch (Exception e) {
	            System.err.println(e);
	            System.err.println("Error checking Gerant existence");
	        }

	        return userExists;
	    }

	    // Check if a Bibliothecaire exists with the given username and password
	    public boolean checkBibliothecaireIfExists(Login login) {
	        boolean userExists = false;
	        try {
	            Connection connection = DBConnect.getConn();
	            PreparedStatement preparedStatement = connection.prepareStatement(CHECK_BIBLIOTHECAIRE_QUERY);
	            preparedStatement.setString(1, login.getUsername());
	            preparedStatement.setString(2, login.getPassword());
	            ResultSet rs = preparedStatement.executeQuery();
	            userExists = rs.next(); // true if a row is returned, false otherwise
	        } catch (Exception e) {
	            System.err.println(e);
	            System.err.println("Error checking Bibliothecaire existence");
	        }

	        return userExists;
	    }
}
