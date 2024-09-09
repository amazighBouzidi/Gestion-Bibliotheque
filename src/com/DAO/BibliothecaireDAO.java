package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.Model.Bibliothecaire;

public class BibliothecaireDAO {
	private static final String INSERT_BIBLIOTHECAIRE_SQL = "INSERT INTO bibliothecaire(nom, prenom, adresse, telephone, username, password) VALUES(?, ?, ?, ?, ?, ?)";
    private static final String SELECT_BIBLIOTHECAIRE_BY_ID = "SELECT id, nom, prenom, adresse, telephone, username, password FROM bibliothecaire WHERE id = ?";
    private static final String SELECT_ALL_BIBLIOTHECAIRES = "SELECT * FROM bibliothecaire";
    private static final String DELETE_BIBLIOTHECAIRE_SQL = "DELETE FROM bibliothecaire WHERE id = ?";
    private static final String UPDATE_BIBLIOTHECAIRE_SQL = "UPDATE bibliothecaire SET nom = ?, prenom = ?, adresse = ?, telephone = ?, username = ?, password = ? WHERE id = ?";

    public BibliothecaireDAO() {
    	
    }

    // INSERT BIBLIOTHECAIRE METHOD
    public void insertBibliothecaire(Bibliothecaire bibliothecaire) throws SQLException {
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BIBLIOTHECAIRE_SQL);
            preparedStatement.setString(1, bibliothecaire.getNom());
            preparedStatement.setString(2, bibliothecaire.getPrenom());
            preparedStatement.setString(3, bibliothecaire.getAdresse());
            preparedStatement.setString(4, bibliothecaire.getTelephone());
            preparedStatement.setString(5, bibliothecaire.getUsername());
            preparedStatement.setString(6, bibliothecaire.getPassword());
            preparedStatement.executeUpdate();
            System.out.println("The BIBLIOTHECAIRE Has Been Inserted Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The BIBLIOTHECAIRE Insertion Failed ");
        }
    }

    // UPDATE BIBLIOTHECAIRE METHOD
    public boolean updateBibliothecaire(Bibliothecaire bibliothecaire) throws SQLException {
        boolean rowUpdated = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BIBLIOTHECAIRE_SQL);
            preparedStatement.setString(1, bibliothecaire.getNom());
            preparedStatement.setString(2, bibliothecaire.getPrenom());
            preparedStatement.setString(3, bibliothecaire.getAdresse());
            preparedStatement.setString(4, bibliothecaire.getTelephone());
            preparedStatement.setString(5, bibliothecaire.getUsername());
            preparedStatement.setString(6, bibliothecaire.getPassword());
            preparedStatement.setInt(7, bibliothecaire.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            System.out.println("The BIBLIOTHECAIRE Has Been Updated Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The BIBLIOTHECAIRE Modification Failed ");
        }

        return rowUpdated;
    }

    // SELECT BIBLIOTHECAIRE BY ID METHOD
    public Bibliothecaire selectBibliothecaire(int id) {
        Bibliothecaire bibliothecaire = null;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BIBLIOTHECAIRE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nom = rs.getString("nom");
                String prenom = rs.getString("prenom");
                String adresse = rs.getString("adresse");
                String telephone = rs.getString("telephone");
                String username = rs.getString("username");
                String password = rs.getString("password");
                bibliothecaire = new Bibliothecaire(id, nom, prenom, adresse, telephone, username, password);
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The BIBLIOTHECAIRE Selection Failed ");
        }

        return bibliothecaire;
    }

    // SELECT ALL BIBLIOTHECAIRES METHOD
    public List<Bibliothecaire> selectAllBibliothecaires() {
        List<Bibliothecaire> bibliothecaires = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BIBLIOTHECAIRES);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nom = rs.getString("nom");
                String prenom = rs.getString("prenom");
                String adresse = rs.getString("adresse");
                String telephone = rs.getString("telephone");
                String username = rs.getString("username");
                String password = rs.getString("password");
                bibliothecaires.add(new Bibliothecaire(id, nom, prenom, adresse, telephone, username, password));
            }
            System.out.println("ALL BIBLIOTHECAIRES Selection Succeeded ");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL BIBLIOTHECAIRES Selection Failed ");
        }

        return bibliothecaires;
    }

    // DELETE BIBLIOTHECAIRE METHOD
    public boolean deleteBibliothecaire(int id) {
        boolean rowDeleted = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BIBLIOTHECAIRE_SQL);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println("The Bibliothecaire Has Been Deleted");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Failed to delete the BIBLIOTHECAIRE ");
        }

        return rowDeleted;
    }
    
 // SELECT ALL BIBLIOTHECAIRES METHOD
    public int selectAllBibliothecairesLength() {
        int length = 0;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BIBLIOTHECAIRES);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                length++;
            }
            System.out.println("ALL BIBLIOTHECAIRES Selection Succeeded ");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL BIBLIOTHECAIRES Selection Failed ");
        }

        return length;
    }
}
