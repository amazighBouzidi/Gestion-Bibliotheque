package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.Model.Examplaire;


public class ExamplaireDAO {
	 private static final String SELECT_ALL_EXEMPLAIRES = "SELECT * FROM ouvrages INNER JOIN examplaires ON SUBSTRING(ouvrages.code, 1, LENGTH(examplaires.reference) - 2) = SUBSTRING(examplaires.reference, 1, LENGTH(examplaires.reference) - 2);";
	    private static final String UPDATE_DISPONIBILITE_BY_REFERENCE = "UPDATE examplaires SET disponibilite = ? WHERE reference = ?";
	    private static final String SELECT_DATE_RETOUR_BY_REFERENCE = "SELECT dateretour FROM emprunts WHERE codeexamplaire = ?";

	    private Connection connection;

	    // Constructor to initialize the connection

	    // Other methods for CRUD operations

	    // Get the list of all Examplaires
	    public List<Examplaire> getAllExamplaires() throws SQLException {
	        List<Examplaire> examplaireList = new ArrayList<>();
	        try{
	        	 Connection connection = DBConnect.getConn();
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EXEMPLAIRES);
	             ResultSet resultSet = preparedStatement.executeQuery();
	        	
	            while (resultSet.next()) {
	                int id  = resultSet.getInt("id");
	                String reference = resultSet.getString("reference");
	                String emplacement = resultSet.getString("emplacement");
	                String disponibilite = resultSet.getString("disponibilite");
	                String date = searchDateRetour(reference);

	                examplaireList.add(new Examplaire(id, reference, emplacement, disponibilite, date));
	            }
	        } catch (Exception e) {
	            System.err.println(e);
	            System.err.println("ALL Examplaire Selection Failed ");
	        }

	        return examplaireList;
	    }

	    // Update the disponibilite of an Examplaire by reference
	    public void updateDisponibiliteByReference(String reference, String newDisponibilite) throws SQLException {
	        try{
	        	Connection connection = DBConnect.getConn();
	        	PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DISPONIBILITE_BY_REFERENCE);
	            preparedStatement.setString(1, newDisponibilite);
	            preparedStatement.setString(2, reference);

	            preparedStatement.executeUpdate();
	        } catch (Exception e) {
	            System.err.println(e);
	            System.err.println("Failed to update examplaire");
	        }
	    }
	    
	    public String searchDateRetour(String reference) throws SQLException {
	        String dateRetour = null;

	        try{
	        	Connection connection = DBConnect.getConn();
	            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DATE_RETOUR_BY_REFERENCE);
	            preparedStatement.setString(1, reference);

	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                if (resultSet.next()) {
	                    dateRetour = resultSet.getDate("dateretour")+"";
	                }
	            }
	        } catch (Exception e) {
	            System.err.println(e);
	            System.err.println("Search Date Retour Failed");
	        }

	        return dateRetour;
	    }
}
