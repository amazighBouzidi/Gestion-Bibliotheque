package com.DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.DBConnect;
import com.Model.Emprunt;
import com.Model.Restitution;

public class RestitutionDAO {
    private static final String INSERT_RESTITUTION_SQL = "INSERT INTO restitutions (daterestitution, matriculelecteur, codeexamplaire) VALUES (?, ?, ?)";
    private static final String SELECT_RESTITUTION_BY_ID = "SELECT id, daterestitution, matriculelecteur, codeexamplaire FROM restitutions WHERE id = ?";
    private static final String SELECT_ALL_RESTITUTIONS = "SELECT * FROM restitutions";
    private static final String DELETE_RESTITUTION_SQL = "DELETE FROM restitutions WHERE id = ?";
    
   private static final String UPDATE_RESTITUTION_SQL = "UPDATE restitutions SET daterestitution = ?, matriculelecteur = ?, codeexamplaire = ? WHERE id = ?";
   private static final String INSERT_Retard_SQL = "INSERT INTO retard (matriculelecteur, codeexamplaire, datePrevu, datereelle) VALUES (?, ?, ?, ?)";
private static java.sql.Date datePrevue;
private static java.sql.Date dateReelle;

    public RestitutionDAO() {
    }

    public static void insertRestitution(Restitution restitution) {
        Connection connection = null;
        PreparedStatement preparedStatementRetard = null;
        PreparedStatement preparedStatementRestitution = null;

        try {
            connection = DBConnect.getConn();
            connection.setAutoCommit(false);

            if (connection != null) {
                java.sql.Date dateRestitution = restitution.getDaterestitution();
                java.sql.Date dateRetour = getDateRetourByMatriculelecteur(restitution.getMatriculelecteur());

                if (dateRestitution != null && dateRetour != null) {
                    long diffInMillis = dateRestitution.getTime() - dateRetour.getTime();
                    long diffInWeeks = diffInMillis / (1000 * 60 * 60 * 24 * 7);

                    System.out.println("Valeur de diffInWeeks : " + diffInWeeks);

                    if (diffInWeeks > 3) {
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(dateRetour);

                        java.sql.Date datePrevue = new java.sql.Date(calendar.getTime().getTime());
                        java.sql.Date dateReelle = new java.sql.Date(System.currentTimeMillis());

                        String INSERT_Retard_SQL = "INSERT INTO retard (matriculelecteur, codeexamplaire, datePrevu, datereelle) VALUES (?, ?, ?, ?)";
                        preparedStatementRetard = connection.prepareStatement(INSERT_Retard_SQL);
                        preparedStatementRetard.setString(1, restitution.getMatriculelecteur());
                        preparedStatementRetard.setString(2, restitution.getCodeexamplaire());
                        preparedStatementRetard.setDate(3, datePrevue);
                        preparedStatementRetard.setDate(4, dateReelle);
                        preparedStatementRetard.executeUpdate();
                    } else {
                        String INSERT_RESTITUTION_SQL = "INSERT INTO restitutions (daterestitution, matriculelecteur, codeexamplaire) VALUES (?, ?, ?)";
                        preparedStatementRestitution = connection.prepareStatement(INSERT_RESTITUTION_SQL);
                        preparedStatementRestitution.setDate(1, dateRestitution);
                        preparedStatementRestitution.setString(2, restitution.getMatriculelecteur());
                        preparedStatementRestitution.setString(3, restitution.getCodeexamplaire());
                        preparedStatementRestitution.executeUpdate();
                    }

                    connection.commit();
                } else {
                    System.out.println("Une des dates est null.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Gérer les exceptions SQL ici
        } finally {
            try {
                if (preparedStatementRestitution != null) {
                    preparedStatementRestitution.close();
                }
                if (preparedStatementRetard != null) {
                    preparedStatementRetard.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Gérer les exceptions lors de la fermeture des ressources
            }
        }
    }


	public boolean updateRestitution(Restitution restitution) {
        boolean rowUpdated = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_RESTITUTION_SQL);
            preparedStatement.setDate(1, restitution.getDaterestitution());
            preparedStatement.setString(2, restitution.getMatriculelecteur());
            preparedStatement.setString(3, restitution.getCodeexamplaire());
            preparedStatement.setInt(4, restitution.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            System.out.println("La restitution a été mise à jour avec succès");
        } catch (SQLException e) {
            System.err.println(e);
            System.err.println("La modification de la restitution a échoué");
        }
        return rowUpdated;
    }

    public Restitution selectRestitution(int id) {
        Restitution restitution = null;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESTITUTION_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                java.sql.Date dateRestitution = rs.getDate("daterestitution");
                String matriculeLecteur = rs.getString("matriculelecteur");
                String codeExemplaire = rs.getString("codeexamplaire");
                restitution = new Restitution( id,dateRestitution, matriculeLecteur, codeExemplaire);
            }
        } catch (SQLException e) {
            System.err.println(e);
            System.err.println("La sélection de la restitution a échoué");
        }
        return restitution;
    }

    public List<Restitution> selectAllRestitutions() {
        List<Restitution> restitutions = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RESTITUTIONS);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                java.sql.Date dateRestitution = rs.getDate("daterestitution");
                String matriculeLecteur = rs.getString("matriculelecteur");
                String codeExemplaire = rs.getString("codeexamplaire");
                restitutions.add(new Restitution(id,dateRestitution, matriculeLecteur, codeExemplaire));
                
            }
            System.out.println("Sélection de toutes les restitutions réussie");
        } catch (SQLException e) {
            System.err.println(e);
            System.err.println("La sélection de toutes les restitutions a échoué");
        }
        return restitutions;
    }

    public boolean deleteRestitution(int id) {
        boolean rowDeleted = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_RESTITUTION_SQL);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println("La restitution a été supprimée");
        } catch (SQLException e) {
            System.err.println(e);
            System.err.println("La suppression de la restitution a échoué");
        }
        return rowDeleted;
    }
    public static java.sql.Date getDateRetourByMatriculelecteur(String matriculelecteur) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        java.sql.Date dateRetour = null;

        try {
            connection = DBConnect.getConn();
            if (connection != null) {
                String query = "SELECT dateretour FROM emprunts WHERE matriculelecteur = ?";
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, matriculelecteur);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    dateRetour = resultSet.getDate("dateretour");
                }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération de la date de retour : " + e.getMessage());
        } finally {
            // Fermez les ressources (ResultSet, PreparedStatement, Connection)
        }

        return dateRetour;
    }


   
}
