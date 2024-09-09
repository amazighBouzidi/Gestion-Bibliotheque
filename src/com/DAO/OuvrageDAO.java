package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.DB.DBConnect;
import com.Model.Exemplaire;
import com.Model.Ouvrage;


public class OuvrageDAO {
 
	private static final String INSERT_OUVRAGE_SQL = "INSERT INTO ouvrages(code, titre, auteur, editeur, annee, quantite, catalogue, emplacement) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String SELECT_OUVRAGE_BY_ID = "SELECT code, titre, auteur, editeur, annee, quantite, catalogue, emplacement FROM ouvrages WHERE code = ?";
	private static final String SELECT_ALL_OUVRAGES = "SELECT * FROM ouvrages";
	private static final String UPDATE_OUVRAGE_SQL = "UPDATE ouvrages SET titre = ?, auteur = ?, editeur = ?, annee = ?, quantite = ?, catalogue = ?, emplacement = ? WHERE code = ?";
    private static final String DELETE_OUVRAGE_SQL = "DELETE FROM ouvrages WHERE code = ?";


    public OuvrageDAO() {
    }
    
    public void insertOuvrage(Ouvrage ouvrage) throws SQLException {
        try  {
        	Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_OUVRAGE_SQL);
            preparedStatement.setString(1, ouvrage.getCode());
            preparedStatement.setString(2, ouvrage.getTitre());
            preparedStatement.setString(3, ouvrage.getAuteur());
            preparedStatement.setString(4, ouvrage.getEditeur());
            preparedStatement.setInt(5, ouvrage.getAnnee());
            preparedStatement.setInt(6, ouvrage.getQuantite());
            preparedStatement.setString(7, ouvrage.getCatalogue());
            preparedStatement.setString(8, ouvrage.getEmplacement());
            preparedStatement.executeUpdate();
            System.out.println("L'ouvrage a été inséré avec succès");
        } catch (SQLException e) {
            System.err.println("Erreur lors de l'insertion de l'ouvrage : " + e.getMessage());
            throw e; // Vous pouvez choisir de relancer l'exception ou de la gérer différemment selon votre logique métier
        }
    }
 
    
    public Ouvrage selectOuvrageByCode(String code) {
        Ouvrage ouvrage = null;
        try 
         {
        	Connection connection = DBConnect.getConn();/* obtenir la connexion à la base de données */
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_OUVRAGE_BY_ID);
            preparedStatement.setString(1, code);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                String titre = rs.getString("titre");
                String auteur = rs.getString("auteur");
                String editeur = rs.getString("editeur");
                int annee = rs.getInt("annee");
                int quantite = rs.getInt("quantite");
                String catalogue = rs.getString("catalogue");
                String emplacement = rs.getString("emplacement");

                ouvrage = new Ouvrage(code, titre, auteur, editeur, annee, quantite, catalogue, emplacement);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // À adapter selon votre gestion d'erreurs
        }
        return ouvrage;
    }

    
    
    private void updateExemplairesQuantite(Connection connection, String codeOuvrage, int nouvelleQuantite,  String emplacement) throws SQLException {
        // Obtenir le nombre actuel d'exemplaires pour cet ouvrage
        String SELECT_EXEMPLAIRES_COUNT_SQL = "SELECT COUNT(*) AS count FROM examplaires WHERE reference LIKE ?";
        PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_EXEMPLAIRES_COUNT_SQL);
        preparedStatementCount.setString(1, codeOuvrage + "/%");
        ResultSet resultSetCount = preparedStatementCount.executeQuery();
        resultSetCount.next();
        int quantiteActuelle = resultSetCount.getInt("count");

        // Comparer la quantité actuelle avec la nouvelle quantité souhaitée
        int differenceQuantite = nouvelleQuantite - quantiteActuelle;
        
        
     // Afficher les valeurs pour le suivi du débogage
        System.out.println("Code de l'ouvrage : " + codeOuvrage);
        System.out.println("Nouvelle quantite d'ouvrage : " + nouvelleQuantite);
        System.out.println("Quantite actuelle d'exemplaires : " + quantiteActuelle);
        System.out.println("Difference de quantite : " + differenceQuantite);

        if (differenceQuantite > 0) {
            // Ajouter des exemplaires supplémentaires
            for (int i = 1; i <= differenceQuantite; i++) {
                String nouvelExemplaireReference = codeOuvrage + "/" + (quantiteActuelle + i);
                String INSERT_EXEMPLAIRE_SQL = "INSERT INTO examplaires(reference, emplacement, disponibilite) VALUES (?, ?, ?)";
                PreparedStatement preparedStatementInsert = connection.prepareStatement(INSERT_EXEMPLAIRE_SQL);
                preparedStatementInsert.setString(1, nouvelExemplaireReference);
				preparedStatementInsert.setString(2,emplacement );
                preparedStatementInsert.setString(3, "disponible");
                preparedStatementInsert.executeUpdate();
            }
        } else if (differenceQuantite < 0) {
            // Supprimer les exemplaires en excès
            String DELETE_EXEMPLAIRES_SQL = "DELETE FROM examplaires WHERE reference LIKE ? LIMIT ?";
            PreparedStatement preparedStatementDelete = connection.prepareStatement(DELETE_EXEMPLAIRES_SQL);
            preparedStatementDelete.setString(1, codeOuvrage + "/%");
            preparedStatementDelete.setInt(2, Math.abs(differenceQuantite));
            preparedStatementDelete.executeUpdate();
        }
    }


    public boolean updateOuvrage(Ouvrage ouvrage) throws SQLException {
        boolean rowUpdated = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_OUVRAGE_SQL);
            preparedStatement.setString(1, ouvrage.getTitre());
            preparedStatement.setString(2, ouvrage.getAuteur());
            preparedStatement.setString(3, ouvrage.getEditeur());
            preparedStatement.setInt(4, ouvrage.getAnnee());
            preparedStatement.setInt(5, ouvrage.getQuantite());
            preparedStatement.setString(6, ouvrage.getCatalogue());
            preparedStatement.setString(7, ouvrage.getEmplacement());
            preparedStatement.setString(8, ouvrage.getCode());
            
         // Mettre à jour la quantité d'exemplaires liés à cet ouvrage
            updateExemplairesQuantite(connection, ouvrage.getCode(), ouvrage.getQuantite(), ouvrage.getEmplacement());
            
            rowUpdated = preparedStatement.executeUpdate() > 0;
            System.out.println("L'ouvrage a été mis à jour avec succès");
        } catch (SQLException e) {
            System.err.println("La mise à jour de l'ouvrage a échoué : " + e.getMessage());
        }
        return rowUpdated;
    }
    
    
    
    
   
    public boolean deleteOuvrage(String code) {
        boolean rowDeleted = false;
        try {
            Connection connection = DBConnect.getConn();
            // Supprimer les exemplaires liés à cet ouvrage
            String DELETE_EXEMPLAIRES_SQL = "DELETE FROM examplaires WHERE reference LIKE ?";
            PreparedStatement preparedStatementExemplaires = connection.prepareStatement(DELETE_EXEMPLAIRES_SQL);
            preparedStatementExemplaires.setString(1, code + "/%");
            preparedStatementExemplaires.executeUpdate();
            
            // Supprimer l'ouvrage lui-même
            PreparedStatement preparedStatementOuvrage = connection.prepareStatement(DELETE_OUVRAGE_SQL);
            preparedStatementOuvrage.setString(1, code);
            rowDeleted = preparedStatementOuvrage.executeUpdate() > 0;
            
            System.out.println("L'ouvrage et ses exemplaires ont été supprimés avec succès");
        } catch (SQLException e) {
            System.err.println("La suppression de l'ouvrage a échoué : " + e.getMessage());
        }
        return rowDeleted;
    }
    public List<Ouvrage> selectAllOuvrages() throws SQLException {
        List<Ouvrage> ouvrages = new ArrayList<>();
        try {
        	Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_OUVRAGES);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String code = resultSet.getString("code");
                String titre = resultSet.getString("titre");
                String auteur = resultSet.getString("auteur");
                String editeur = resultSet.getString("editeur");
                int annee = resultSet.getInt("annee");
                int quantite = resultSet.getInt("quantite");
                String catalogue = resultSet.getString("catalogue");
                String emplacement = resultSet.getString("emplacement");
                ouvrages.add(new Ouvrage(code, titre, auteur, editeur, annee, quantite, catalogue, emplacement));
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Échec de la récupération des ouvrages");
        }
        return ouvrages;
    }
}
