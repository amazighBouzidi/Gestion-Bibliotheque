package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.Model.Catalogue;

public class CatalogueDAO {
    private static final String INSERT_CATALOGUE_SQL = "INSERT INTO catalogues(nomC) VALUES(?)";
    private static final String SELECT_CATALOGUE_BY_ID = "SELECT id, nomC FROM catalogues WHERE id = ?";
    private static final String SELECT_ALL_CATALOGUES = "SELECT * FROM catalogues";
    private static final String DELETE_CATALOGUE_SQL = "DELETE FROM catalogues WHERE id = ?";
    private static final String UPDATE_CATALOGUE_SQL = "UPDATE catalogues SET nomC = ? WHERE id = ?";

    public CatalogueDAO() {

    }

    // INSERT CATALOGUE METHOD
    public void insertCatalogue(Catalogue catalogue) throws SQLException {
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATALOGUE_SQL);
            preparedStatement.setString(1, catalogue.getNomC());
            preparedStatement.executeUpdate();
            System.out.println("The CATALOGUE Has Been Inserted Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The CATALOGUE Insertion Failed ");
        }
    }

    // UPDATE CATALOGUE METHOD
    public boolean updateCatalogue(Catalogue catalogue) throws SQLException {
        boolean rowUpdated = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CATALOGUE_SQL);
            preparedStatement.setString(1, catalogue.getNomC());
            preparedStatement.setInt(2, catalogue.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            System.out.println("The CATALOGUE Has Been Updated Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The CATALOGUE Modification Failed ");
        }

        return rowUpdated;
    }

    // SELECT CATALOGUE BY ID METHOD
    public Catalogue selectCatalogue(int id) {
        Catalogue catalogue = null;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATALOGUE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nomC = rs.getString("nomC");
                catalogue = new Catalogue(id, nomC);
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The CATALOGUE Selection Failed ");
        }

        return catalogue;
    }

    // SELECT ALL CATALOGUES METHOD
    public List<Catalogue> selectAllCatalogues() {
        List<Catalogue> catalogues = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATALOGUES);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nomC = rs.getString("nomC");
                catalogues.add(new Catalogue(id, nomC));
            }
            System.out.println("ALL CATALOGUES Selection Succeeded ");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL CATALOGUES Selection Failed ");
        }

        return catalogues;
    }

    // DELETE CATALOGUE METHOD
    public boolean deleteCatalogue(int id) {
        boolean rowDeleted = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CATALOGUE_SQL);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println("The Catalogue Has Been Deleted");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Failed to delete the CATALOGUE ");
        }

        return rowDeleted;
    }
}
