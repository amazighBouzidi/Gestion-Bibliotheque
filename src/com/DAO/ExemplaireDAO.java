package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.DB.DBConnect;
import com.Model.Exemplaire;

public class ExemplaireDAO {

    private static final String INSERT_EXEMPLAIRE_SQL = "INSERT INTO examplaires(reference, emplacement, disponibilite) VALUES (?, ?, ?)";
  

    public ExemplaireDAO() {
        // Constructeur par défaut
    }

    public void insertExemplaire(Exemplaire exemplaire) throws SQLException {
        try  {
        	Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EXEMPLAIRE_SQL);
            preparedStatement.setString(1, exemplaire.getReference());
            preparedStatement.setString(2, exemplaire.getEmplacement());
            preparedStatement.setString(3, exemplaire.getDisponibilite());
            preparedStatement.executeUpdate();
            System.out.println("L'exemplaire a été inséré avec succès");
        } catch (SQLException e) {
            System.err.println("Erreur lors de l'insertion de l'exemplaire : " + e.getMessage());
            throw e;
        }
    }

   

   
    // Ajoutez des méthodes pour la mise à jour et la suppression si nécessaire.
}
