package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.Model.Retard;

public class RetardDAO {
	
	public RetardDAO() {
        
    }

    private static final String SELECT_ALL_RETARDS = "SELECT * FROM retard";
    private static final String DELETE_RETARD = "DELETE FROM retard WHERE idretard = ?";

    // SELECT ALL RETARDS METHOD
    public List<Retard> selectAllRetards() {
        List<Retard> retards = new ArrayList<>();
        try {
        	Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RETARDS);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int idRetard = resultSet.getInt("idretard");
                String matriculeLecteur = resultSet.getString("matriculelecteur");
                String codeExemplaire = resultSet.getString("codeexamplaire");
                String datePrevu = resultSet.getString("dateprevu");
                String dateReelle = resultSet.getString("datereelle");

                Retard retard = new Retard(idRetard, matriculeLecteur, codeExemplaire, datePrevu, dateReelle);
                retards.add(retard);
            }
            System.out.println("ALL RETARDS Selection Succeeded");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL RETARDS Selection Failed");
        }

        return retards;
    }

    // DELETE RETARD METHOD
    public boolean deleteRetard(int idRetard) {
        boolean rowDeleted = false;
        try {
        	Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RETARD);
            preparedStatement.setInt(1, idRetard);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println("The Retard Has Been Deleted");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Failed to delete the RETARD");
        }

        return rowDeleted;
    }
    
    public int selectAllRetardsLength() {
        int length = 0;
        try {
        	Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RETARDS);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                length++;
            }
            System.out.println("ALL RETARDS Selection Succeeded");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL RETARDS Selection Failed");
        }

        return length;
    }
}
