package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.Model.Penalisation;

public class PenalisationDAO {
	private static final String INSERT_PENALISATION_QUERY = "INSERT INTO penalisations(matriculelecteur, dateDebut, dateFin, motif) VALUES (?, NULL, NULL, ?)";
    private static final String UPDATE_PENALISATION_QUERY = "UPDATE penalisations SET dateDebut=?, dateFin=?, motif=? WHERE matriculelecteur LIKE ?";
    private static final String DELETE_RETARD_QUERY = "DELETE FROM retard WHERE matriculelecteur LIKE ?";

    public PenalisationDAO() {

    }

    // Initialize Penalisation
    public void initialiserPenalisation(Penalisation model) {
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PENALISATION_QUERY);
            preparedStatement.setString(1, model.getMatriculeLecteur());
            preparedStatement.setString(2, model.getMotif());
            preparedStatement.executeUpdate();
            System.out.println("Initialize penalisation");
        } catch (Exception e) {
            System.out.println("Failed to initialize penalisation");
            System.out.println(e.getMessage());
            System.out.println(e.getCause());
        }
    }

    // Modify Penalisation
    public void modifierPenalisation(Penalisation model) {
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PENALISATION_QUERY);
            preparedStatement.setString(1, model.getDateDebut());
            preparedStatement.setString(2, model.getDateFin());
            preparedStatement.setString(3, model.getMotif());
            preparedStatement.setString(4, model.getMatriculeLecteur());
            preparedStatement.executeUpdate();
            System.out.println("Succeed to update the Penalisation");

            // Delete the associated retard
            PreparedStatement deleteRetardStatement = connection.prepareStatement(DELETE_RETARD_QUERY);
            deleteRetardStatement.setString(1, model.getMatriculeLecteur());
            deleteRetardStatement.executeUpdate();
            System.out.println("Succeed to delete the retard");

        } catch (Exception e) {
            System.out.println("Failed to update the Penalisation");
            System.out.println(e.getMessage());
            System.out.println(e.getCause());
        }
    }
    
    // Get all Penalisations
    public List<Penalisation> getAllPenalisation() {
        List<Penalisation> penalisations = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConn();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM penalisations WHERE dateDebut IS NOT NULL");

            while (resultSet.next()) {
                String matriculeLecteur = resultSet.getString("matriculelecteur");
                String dateDebut = resultSet.getString("dateDebut");
                String dateFin = resultSet.getString("dateFin");
                String motif = resultSet.getString("motif");

                Penalisation penalisation = new Penalisation(matriculeLecteur, dateDebut, dateFin, motif);
                penalisations.add(penalisation);
            }

        } catch (Exception e) {
            System.out.println("Failed to get all penalisations");
            System.out.println(e.getMessage());
            System.out.println(e.getCause());
        }

        return penalisations;
    }
    
 // Get all Penalisations
    public int getAllPenalisationLength() {
        int length = 0;
        try {
            Connection connection = DBConnect.getConn();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM penalisations WHERE dateDebut IS NOT NULL");

            while (resultSet.next()) {
                length++;
            }

        } catch (Exception e) {
            System.out.println("Failed to get all penalisations");
            System.out.println(e.getMessage());
            System.out.println(e.getCause());
        }

        return length;
    }
}
