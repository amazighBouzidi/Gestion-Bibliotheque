package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.Model.Rayon;

public class RayonDAO {
    private static final String INSERT_RAYON_SQL = "INSERT INTO rayon(code, emplacement) VALUES(?, ?)";
    private static final String SELECT_RAYON_BY_ID = "SELECT id, code, emplacement FROM rayon WHERE id = ?";
    private static final String SELECT_ALL_RAYONS = "SELECT * FROM rayon";
    private static final String DELETE_RAYON_SQL = "DELETE FROM rayon WHERE id = ?";
    private static final String UPDATE_RAYON_SQL = "UPDATE rayon SET code = ?, emplacement = ? WHERE id = ?";

    public RayonDAO() {
    	
    }

    public void insertRayon(Rayon rayon) throws SQLException {
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RAYON_SQL);
            preparedStatement.setString(1, rayon.getCode());
            preparedStatement.setString(2, rayon.getEmplacement());
            preparedStatement.executeUpdate();
            System.out.println("Le rayon a été inséré avec succès");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Échec de l'insertion du rayon");
        }
    }

    public boolean updateRayon(Rayon rayon) throws SQLException {
        boolean rowUpdated = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_RAYON_SQL);
            preparedStatement.setString(1, rayon.getCode());
            preparedStatement.setString(2, rayon.getEmplacement());
            preparedStatement.setInt(3, rayon.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            System.out.println("Le rayon a été mis à jour avec succès");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Échec de la mise à jour du rayon");
        }
        return rowUpdated;
    }

    public Rayon selectRayon(int id) {
        Rayon rayon = null;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RAYON_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String code = rs.getString("code");
                String emplacement = rs.getString("emplacement");
                rayon = new Rayon(id, code, emplacement);
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Échec de la récupération du rayon");
        }
        return rayon;
    }

    public List<Rayon> selectAllRayons() {
        List<Rayon> rayons = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RAYONS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String code = rs.getString("code");
                String emplacement = rs.getString("emplacement");
                rayons.add(new Rayon(id, code, emplacement));
            }
            System.out.println("Tous les rayons ont été récupérés avec succès");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Échec de la récupération de tous les rayons");
        }
        return rayons;
    }

    public boolean deleteRayon(int id) {
        boolean rowDeleted = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RAYON_SQL);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println("Le rayon a été supprimé avec succès");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Échec de la suppression du rayon");
        }
        return rowDeleted;
    }
    
}
