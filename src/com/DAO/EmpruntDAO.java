package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.DB.DBConnect;
import com.Model.Emprunt;

public class EmpruntDAO {
    private static final String INSERT_EMPRUNT_SQL = "INSERT INTO emprunts(dateemprunt, heureemprunt, dateretour, prolonge, regler, matriculelecteur, codeexamplaire) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_EMPRUNT_BY_ID = "SELECT idemprunt, dateemprunt, heureemprunt, dateretour, prolonge, regler, matriculelecteur, codeexamplaire FROM emprunt WHERE idemprunt = ?";
    private static final String SELECT_ALL_EMPRUNTS = "SELECT * FROM emprunts";
    private static final String DELETE_EMPRUNT_SQL = "DELETE FROM emprunt WHERE idemprunt = ?";
    private static final String UPDATE_EMPRUNT_SQL = "UPDATE emprunt SET dateemprunt = ?, heureemprunt = ?, dateretour = ?, prolonge = ?, regler = ?, matriculelecteur = ?, codeexamplaire = ? WHERE idemprunt = ?";

    public EmpruntDAO() {
    }

    // INSERT EMPRUNT METHOD
    public void insertEmprunt(Emprunt emprunt) throws SQLException {
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPRUNT_SQL);
            preparedStatement.setString(1, emprunt.getDateemprunt());
            preparedStatement.setString(2, emprunt.getHeureemprunt());
            preparedStatement.setString(3, emprunt.getDateretour());
            preparedStatement.setString(4, emprunt.getProlonge());
            preparedStatement.setString(5, emprunt.getRegler());
            preparedStatement.setString(6, emprunt.getMatriculelecteur());
            preparedStatement.setString(7, emprunt.getCodeexamplaire());
            preparedStatement.executeUpdate();
            
         // Update examplaires table
            String updateExamplairesSQL = "UPDATE examplaires SET disponibilite = 'non-disponible' WHERE reference = ?";
            PreparedStatement preparedStatement2 = connection.prepareStatement(updateExamplairesSQL);
            preparedStatement2.setString(1, emprunt.getCodeexamplaire());
            preparedStatement2.executeUpdate();

            System.out.println("The EMPRUNT Has Been Inserted Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The EMPRUNT Insertion Failed ");
        }
    }

    // UPDATE EMPRUNT METHOD
    public boolean updateEmprunt(Emprunt emprunt) throws SQLException {
        boolean rowUpdated = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPRUNT_SQL);
            preparedStatement.setString(1, emprunt.getDateemprunt());
            preparedStatement.setString(2, emprunt.getHeureemprunt());
            preparedStatement.setString(3, emprunt.getDateretour());
            preparedStatement.setString(4, emprunt.getProlonge());
            preparedStatement.setString(5, emprunt.getRegler());
            preparedStatement.setString(6, emprunt.getMatriculelecteur());
            preparedStatement.setString(7, emprunt.getCodeexamplaire());
            preparedStatement.setInt(8, emprunt.getIdemprunt());
            rowUpdated = preparedStatement.executeUpdate() > 0;
            System.out.println("The EMPRUNT Has Been Updated Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The EMPRUNT Modification Failed ");
        }

        return rowUpdated;
    }

    // SELECT EMPRUNT BY ID METHOD
    public Emprunt selectEmprunt(int id) {
        Emprunt emprunt = null;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPRUNT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String dateemprunt = rs.getString("dateemprunt");
                String heureemprunt = rs.getString("heureemprunt");
                String dateretour = rs.getString("dateretour");
                String prolonge = rs.getString("prolonge");
                String regler = rs.getString("regler");
                String matriculelecteur = rs.getString("matriculelecteur");
                String codeexamplaire = rs.getString("codeexamplaire");
                emprunt = new Emprunt(id, dateemprunt, heureemprunt, dateretour, prolonge, regler, matriculelecteur, codeexamplaire);
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The EMPRUNT Selection Failed ");
        }

        return emprunt;
    }

    // SELECT ALL EMPRUNTS METHOD
    public List<Emprunt> selectAllEmprunts() {
        List<Emprunt> emprunts = new ArrayList<>();
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPRUNTS);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("idemprunt");
                String dateemprunt = rs.getDate("dateemprunt")+"";
                String heureemprunt = rs.getString("heureemprunt");
                String dateretour = rs.getDate("dateretour")+"";
                String prolonge = rs.getString("prolonge");
                String regler = rs.getString("regler");
                String matriculelecteur = rs.getString("matriculelecteur");
                String codeexamplaire = rs.getString("codeexamplaire");
                emprunts.add(new Emprunt(id, dateemprunt, heureemprunt, dateretour, prolonge, regler, matriculelecteur, codeexamplaire));
            }
            System.out.println("ALL EMPRUNTS Selection Succeeded ");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("ALL EMPRUNTS Selection Failed ");
        }

        return emprunts;
    }

    // DELETE EMPRUNT METHOD
    public boolean deleteEmprunt(int id) {
        boolean rowDeleted = false;
        try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPRUNT_SQL);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
            System.out.println("The EMPRUNT Has Been Deleted");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("Failed to delete the EMPRUNT ");
        }

        return rowDeleted;
    }
    
    // Method to check if a matriculelecteur is penalized
    public boolean isMatriculelecteurPenalized(String matriculeLecteur) {
    	boolean test = false;
    	try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM penalisations WHERE matriculelecteur = ?");
            preparedStatement.setString(1, matriculeLecteur);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                if(rs.getDate("dateDebut") != null && rs.getDate("dateFin") != null){
                	test = true;
                }
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The EMPRUNT Selection Failed ");
        }
        return test;
    }

	public Date getPenalizedUntilDate(String matriculeLecteur) {
		Date date = null;
		try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM penalisations WHERE matriculelecteur = ?");
            preparedStatement.setString(1, matriculeLecteur);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               date = rs.getDate("dateFin");
               break;
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The EMPRUNT Selection Failed ");
        }
		return date;
	}
	
	// Method to get the maximum allowed emprunts based on regler attribute
	public int getMaxAllowedEmprunts(String matriculeLecteur) {
		int qunt = 0;
		try {
            Connection connection = DBConnect.getConn();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM emprunts WHERE matriculelecteur  = ? AND regler =?");
            preparedStatement.setString(1, matriculeLecteur);
            preparedStatement.setString(2, "non");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
               qunt++;
            }
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The EMPRUNT Selection Failed ");
        }
	    return qunt;
	}
	
	public void prolongerEmprunt(int idemprunt, String dateretour) {
		try {
            Connection connection = DBConnect.getConn();
            String updateQuery = "UPDATE emprunts SET prolonge = ?, dateretour = ? WHERE idemprunt = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
            // Execute the update query
            preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, "oui");
            preparedStatement.setString(2, dateretour);
            preparedStatement.setInt(3, idemprunt);
            preparedStatement.executeUpdate() ;
            System.out.println("The EMPRUNT Has Been Updated Successfully");
        } catch (Exception e) {
            System.err.println(e);
            System.err.println("The EMPRUNT Modification Failed ");
        }
	}
}
