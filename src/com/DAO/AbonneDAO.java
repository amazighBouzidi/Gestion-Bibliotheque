package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.Model.Abonne;

public class AbonneDAO {
    private static final String INSERT_ABONNE_SQL = "INSERT INTO abonnee(matricule,nom, prenom, adresse, telephone, faculte, type, sommeforfataire, cotisation, dateajout) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ABONNE_BY_MATRICULE = "SELECT matricule, nom, prenom, adresse, telephone, faculte, type, sommeforfataire, cotisation, dateajout FROM abonnee WHERE matricule = ?";
    private static final String SELECT_ALL_ABONNES = "SELECT * FROM abonnee";
    private static final String DELETE_ABONNE_SQL = "DELETE FROM abonnee WHERE matricule = ?";
    private static final String UPDATE_ABONNE_SQL = "UPDATE abonnee SET matricule = ?, nom = ?, prenom = ?, adresse = ?, telephone = ?, faculte = ?, type = ?, sommeforfataire = ?, cotisation = ?, dateajout = ? WHERE matricule = ?";
    private static final String selectAllAbonnesQuery = "SELECT * FROM abonnee WHERE matricule NOT IN (SELECT matriculelecteur FROM emprunts WHERE regler = 'non' GROUP BY matriculelecteur HAVING COUNT(*) >= 3)";

    public AbonneDAO() {
        
    }

    // INSERT ABONNE METHOD
    public void insertAbonne(Abonne abonne) throws SQLException {
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ABONNE_SQL);
            preparedStatement.setString(1, abonne.getMatricule());
            preparedStatement.setString(2, abonne.getNom());
            preparedStatement.setString(3, abonne.getPrenom());
            preparedStatement.setString(4, abonne.getAdresse());
            preparedStatement.setString(5, abonne.getTelephone());
            preparedStatement.setString(6, abonne.getFaculte());
            preparedStatement.setString(7, abonne.getType());
            preparedStatement.setString(8, abonne.getSommeForfaitaire());
            preparedStatement.setString(9, abonne.getCotisation());
            preparedStatement.setString(10, abonne.getDateAjout());
            preparedStatement.executeUpdate();
            System.out.println("The ABONNE Has Been Inserted Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The ABONNE Insertion Failed ");
        }
    }

    // UPDATE ABONNE METHOD
    public boolean updateAbonne(Abonne abonne) throws SQLException {
        boolean rowUpdated = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ABONNE_SQL);
            preparedStatement.setString(1, abonne.getMatricule());
            preparedStatement.setString(2, abonne.getNom());
            preparedStatement.setString(3, abonne.getPrenom());
            preparedStatement.setString(4, abonne.getAdresse());
            preparedStatement.setString(5, abonne.getTelephone());
            preparedStatement.setString(6, abonne.getFaculte());
            preparedStatement.setString(7, abonne.getType());
            preparedStatement.setString(8, abonne.getSommeForfaitaire());
            preparedStatement.setString(9, abonne.getCotisation());
            preparedStatement.setString(10, abonne.getDateAjout());
            preparedStatement.setString(11, abonne.getMatriculeO());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            System.out.println("The ABONNE Has Been Updated Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The ABONNE Modification Failed ");
        }

        return rowUpdated;
    }

    // SELECT ABONNE BY MATRICULE METHOD
    public Abonne selectAbonneByMatricule(String matricule) {
        Abonne abonne = null;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ABONNE_BY_MATRICULE);
            preparedStatement.setString(1, matricule);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String nom = rs.getString("nom");
                String prenom = rs.getString("prenom");
                String adresse = rs.getString("adresse");
                String telephone = rs.getString("telephone");
                String faculte = rs.getString("faculte");
                String type = rs.getString("type");
                String sommeForfaitaire = rs.getString("sommeforfataire");
                String cotisation = rs.getString("cotisation");
                String dateAjout = rs.getString("dateajout");
                abonne = new Abonne(matricule, nom, prenom, adresse, telephone, faculte, type, sommeForfaitaire, cotisation, dateAjout);
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The ABONNE Selection Failed ");
        }

        return abonne;
    }

    // SELECT ALL ABONNES METHOD
    public List<Abonne> selectAllAbonnes() {
        List<Abonne> abonnes = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ABONNES);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String matricule = rs.getString("matricule");
                String nom = rs.getString("nom");
                String prenom = rs.getString("prenom");
                String adresse = rs.getString("adresse");
                String telephone = rs.getString("telephone");
                String faculte = rs.getString("faculte");
                String type = rs.getString("type");
                String sommeForfaitaire = rs.getString("sommeforfataire");
                String cotisation = rs.getString("cotisation");
                String dateAjout = rs.getString("dateajout");
                abonnes.add(new Abonne(matricule, nom, prenom, adresse, telephone, faculte, type, sommeForfaitaire, cotisation, dateAjout));
            }
            System.out.println("ALL ABONNES Selection Succeeded ");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL ABONNES Selection Failed ");
        }

        return abonnes;
    }

    // DELETE ABONNE METHOD
    public boolean deleteAbonne(String matricule) {
        boolean rowDeleted = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ABONNE_SQL);
            preparedStatement.setString(1, matricule);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println("The Abonne Has Been Deleted");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Failed to delete the ABONNE ");
        }

        return rowDeleted;
    }
    
 // SELECT ALL ABONNES METHOD (listeLecteurEmpruntTableView)
    public List<Abonne> listeLecteurEmpruntTableView() {
        List<Abonne> abonnes = new ArrayList<>();
        try {

            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(selectAllAbonnesQuery);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String matricule = rs.getString("matricule");
                String nom = rs.getString("nom");
                String prenom = rs.getString("prenom");
                String adresse = rs.getString("adresse");
                String telephone = rs.getString("telephone");
                String faculte = rs.getString("faculte");
                String type = rs.getString("type");
                String sommeForfaitaire = rs.getString("sommeforfataire");
                String cotisation = rs.getString("cotisation");
                String dateAjout = rs.getString("dateajout");
                abonnes.add(new Abonne(matricule, nom, prenom, adresse, telephone, faculte, type, sommeForfaitaire, cotisation, dateAjout));
            }
            System.out.println("ALL ABONNES (listeLecteurEmpruntTableView) Selection Succeeded ");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL ABONNES (listeLecteurEmpruntTableView) Selection Failed ");
        }

        return abonnes;
    }
    
    // SELECT ALL ABONNES METHOD Length
    public int selectAllAbonnesLength() {
        int Length = 0;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ABONNES);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Length++;
            }
            System.out.println("ALL ABONNES Selection Succeeded ");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL ABONNES Selection Failed ");
        }

        return Length;
    }
}
