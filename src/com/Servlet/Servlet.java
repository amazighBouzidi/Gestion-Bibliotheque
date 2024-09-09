package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.AbonneDAO;
import com.DAO.BibliothecaireDAO;
import com.DAO.CatalogueDAO;
import com.DAO.EmpruntDAO;
import com.DAO.ExamplaireDAO;
import com.DAO.ExemplaireDAO;
import com.DAO.LoginDAO;
import com.DAO.OuvrageDAO;
import com.DAO.PenalisationDAO;
import com.DAO.RayonDAO;
import com.DAO.RestitutionDAO;
import com.DAO.RetardDAO;
import com.Model.Abonne;
import com.Model.Bibliothecaire;
import com.Model.Catalogue;
import com.Model.Emprunt;
import com.Model.Examplaire;
import com.Model.Exemplaire;
import com.Model.Login;
import com.Model.Ouvrage;
import com.Model.Penalisation;
import com.Model.Rayon;
import com.Model.Restitution;
import com.Model.Retard;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

/**
 * Servlet implementation class BibliothecaireServlet
 */
@WebServlet("/")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BibliothecaireDAO bibliothecaireDAO; 
	private AbonneDAO abonneDAO;
	private RetardDAO retardDAO;
	private LoginDAO loginDAO;
	private PenalisationDAO penalisationDAO;
	private OuvrageDAO ouvrageDAO;
    private RayonDAO rayonDAO;
    private CatalogueDAO catalogueDAO;
    private ExemplaireDAO exemplaireDAO;
    private RestitutionDAO restitutionsDAO;
	private ExamplaireDAO examplaireDAO;
	private EmpruntDAO empruntDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
        bibliothecaireDAO = new BibliothecaireDAO();
        abonneDAO = new AbonneDAO();
        retardDAO = new RetardDAO();
        loginDAO = new LoginDAO();
        penalisationDAO = new PenalisationDAO();
        ouvrageDAO = new OuvrageDAO();
        catalogueDAO = new CatalogueDAO();
        rayonDAO = new RayonDAO();
        exemplaireDAO = new ExemplaireDAO();
        restitutionsDAO = new RestitutionDAO();
        examplaireDAO = new ExamplaireDAO();
        empruntDAO = new EmpruntDAO();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action  = request.getServletPath();
		switch (action) {
			case "/AjouterBibliothecaire":
				showNewFormBibliothecaire(request, response);
				break;
			case "/insertBibliothecaire":	
				try {
					insertUser(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "/deleteBibliothecaire":	
				deleteUser(request, response);
				break;			
			case "/updateBibliothecaire":	
				try {
					updateUser(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;	
			case "/listeBibliothecaire":
				listUser(request, response);
				break;
			case "/AjouterAbonne":
				showNewFormAbonne(request, response);
				break;
			case "/insertAbonne":	
				try {
					insertUserAbonne(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "/deleteAbonne":	
				deleteUserAbonne(request, response);
				break;
			case "/updateAbonne":	
				try {
					updateUserABonne(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;	
			case "/listeAbonne":
				listUserAbonne(request, response);
				break;
			case "/AjouterPenalisation":
				showNewFormPenalisation(request, response);
				break;
			case "/insertPenalisation":	
				try {
					insertNewPenalisation(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (java.text.ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "/listePenalisation":
				listUserPenalisation(request, response);
				break;
			case "/showHome":
				showHome(request, response);
				break;
			case "/showHomeBibliothecaire":
				showHome(request, response);
				break;
			case "/checkLogin":
				checkLogin(request, response);
				break;
			case "/AjouterOuvrage":
                showNewFormOuvrage(request, response);
                break;
            case "/insertOuvrage":
                try {
                    insertOuvrage(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/listeOuvrage":
                listOuvrage(request, response);
                break;
          
            case "/updateOuvrage":
            	try {
                    updateOuvrage(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					}
                break;
            case "/deleteOuvrage":
                deleteOuvrage(request, response);
                break;
            case "/AjouterRayon":
                showNewFormRayon(request, response);
                break;
            case "/insertRayon":
                try {
                    insertRayon(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/AjouterRestitution":
                showRestitutionPage(request, response);
                break;
            case "/insertRestitution":
                try {
                    insertRestitution(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "/deleteRestitution":
                deleteRestitution(request, response);
                break;

            case "/updateRestitution":
			try {
				updateRestitution(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
                break;

            case "/listeRestitution":
                listRestitutions(request, response);
                break;
            case "/AjouterCatlogue":
				showNewFormCatalogue(request, response);
				break;
			case "/listeCatalogue":	
				listCatalogue(request, response);
				break;
			case "/updateCatalogue":
				try {
					updateCatalogue(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "/deleteCatalogue":
				deleteCatalogue(request, response);
				break;
			case "/insertCatalogue":	
				try {
					insertCatalogue(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "/AjouterEmprunt":
				try {
					showNewFormEmprunt(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "/insertEmprunt":
				try {
					insertEmprunt(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "/listeEmprunt":
				listEmprunt(request, response);
				break;
			case "/ProlongerEmprunt":
				try {
					ProlongerEmprunt(request, response);
				} catch (java.text.ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			case "/listeRayon":
				listRayon(request, response);
				break;
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void listRayon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// In your UserServlet's listUser method or where you fetch the users:
		List<Rayon> listeRayons = rayonDAO.selectAllRayons();
		request.setAttribute("listeRayons", listeRayons);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/ListeRayons.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showNewFormBibliothecaire(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/administrateur/AjouterBibliothecaire.jsp");
		request.setAttribute("bibliothecaire", null);
		dispatcher.forward(request, response);
	}
	
	private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int numberAbonnee = abonneDAO.selectAllAbonnesLength();
		int numberBibliothecaire = bibliothecaireDAO.selectAllBibliothecairesLength();
		int numberPenalisation = penalisationDAO.getAllPenalisationLength();
		request.setAttribute("numberPenalisation", numberPenalisation);
		int numberRetard = retardDAO.selectAllRetardsLength();
		request.setAttribute("numberRetard", numberRetard);
		request.setAttribute("numberAbonnee", numberAbonnee);
		request.setAttribute("numberBibliothecaire", numberBibliothecaire);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Administrateur.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showHomeBibliothecaire(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Bibliothecaire.jsp");
		dispatcher.forward(request, response);
	}
	
	private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Login login = new Login(username, password);
		if(loginDAO.checkGerantIfExists(login)){
			int numberAbonnee = abonneDAO.selectAllAbonnesLength();
			int numberBibliothecaire = bibliothecaireDAO.selectAllBibliothecairesLength();
			int numberPenalisation = penalisationDAO.getAllPenalisationLength();
			int numberRetard = retardDAO.selectAllRetardsLength();
			request.setAttribute("numberRetard", numberRetard);
			request.setAttribute("numberPenalisation", numberPenalisation);
			request.setAttribute("numberAbonnee", numberAbonnee);
			request.setAttribute("numberBibliothecaire", numberBibliothecaire);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Administrateur.jsp");
			dispatcher.forward(request, response);
		}else if(loginDAO.checkBibliothecaireIfExists(login)){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Bibliothecaire.jsp");
			dispatcher.forward(request, response);
		}else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			String errorMessage = "Nom D'utilisateur ou Mot De Passe Incorrecte";
			request.setAttribute("errorMessage", errorMessage);
			dispatcher.forward(request, response);
		}
	}
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String adresse = request.getParameter("adresse");
		String telephone = request.getParameter("telephone");
		String username = request.getParameter("username");
		String password= request.getParameter("password");
		
		Bibliothecaire user = new Bibliothecaire(nom, prenom, adresse, telephone, username, password);
		bibliothecaireDAO.insertBibliothecaire(user);
		response.sendRedirect("listeBibliothecaire?insertSuccess=true");
	}
	
	private void insertNewPenalisation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, java.text.ParseException {
		String matricule = request.getParameter("matriculeLecteur");
		String inputDate = request.getParameter("dateP");

		// Format input date from 'dd/mm/yyyy' to 'yyyy-mm-dd'
		String formattedDate = formatDate(inputDate);

		Penalisation model = new Penalisation(matricule, java.time.LocalDate.now() + "", formattedDate, "retard");
		penalisationDAO.modifierPenalisation(model);

		response.sendRedirect("listePenalisation");
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		bibliothecaireDAO.deleteBibliothecaire(id);
		response.sendRedirect("liste?deleteSuccess=true");
	}
	
	// Method to format date from 'dd/mm/yyyy' to 'yyyy-mm-dd'
	private String formatDate(String inputDate) throws java.text.ParseException {
	    try {
	        SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
	        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = inputFormat.parse(inputDate);
	        return outputFormat.format(date);
	    } catch (ParseException e) {
	        // Handle the exception or log it
	        e.printStackTrace();
	        return inputDate; // Return original date in case of parsing error
	    }
	}
	
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String adresse = request.getParameter("adresse");
		String telephone = request.getParameter("telephone");
		String username = request.getParameter("username");
		String password= request.getParameter("password");
		
		Bibliothecaire user = new Bibliothecaire(id, nom, prenom, adresse, telephone, username, password);
		bibliothecaireDAO.updateBibliothecaire(user);
		response.sendRedirect("listeBibliothecaire?updateSuccess=true");
	}
	
	private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// In your UserServlet's listUser method or where you fetch the users:
		List<Bibliothecaire> listBibliothecaire = bibliothecaireDAO.selectAllBibliothecaires();
		request.setAttribute("listBibliothecaire", listBibliothecaire);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/administrateur/ListeBibliothecaires.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showNewFormAbonne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/administrateur/AjouterAbonne.jsp");
		request.setAttribute("abonne", null);
		dispatcher.forward(request, response);
		
		// Add the following lines for logging or printing
	    System.out.println("Redirecting to AjouterAbonne...");
	    System.out.println("Request URI: " + request.getRequestURI());
	    System.out.println("Request URL: " + request.getRequestURL());
	    System.out.println("Context Path: " + request.getContextPath());
	}
	
	private void insertUserAbonne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
	    String matricule = request.getParameter("matricule");
	    String nom = request.getParameter("nom");
	    String prenom = request.getParameter("prenom");
	    String adresse = request.getParameter("adresse");
	    String telephone = request.getParameter("telephone");
	    String faculte = request.getParameter("faculte");
	    String type = request.getParameter("type");
	    String sommeForfaitaire = "nonconerné";
	    String cotisation = "nonconerné";

	    // Check the type to determine the appropriate values for sommeForfaitaire and cotisation
	    if ("Etudiant Interne".equals(type)) {
	        sommeForfaitaire = (request.getParameter("sommeForfaitaire") != null && request.getParameter("sommeForfaitaire").equals("true")) ? "oui" : "non";
	    } else if ("Etudiant Externe".equals(type)) {
	        cotisation = (request.getParameter("cotisation") != null && request.getParameter("cotisation").equals("true")) ? "oui" : "non";
	    }

	    Abonne user = new Abonne(matricule, nom, prenom, adresse, telephone, faculte, type, sommeForfaitaire, cotisation, "" + java.time.LocalDate.now());
	    System.out.println("Somme Forfataire: "+sommeForfaitaire);
	    System.out.println("Cotisation: "+cotisation);
	    abonneDAO.insertAbonne(user);
	    
	    Penalisation model = new Penalisation(matricule, null, null, "");
	    penalisationDAO.initialiserPenalisation(model);
	    
	    response.sendRedirect(request.getContextPath() + "/listeAbonne?insertSuccess=true");
	}
	
	private void deleteUserAbonne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String matricule = request.getParameter("matricule");
		abonneDAO.deleteAbonne(matricule);
		response.sendRedirect("listeAbonne?deleteSuccess=true");
	}
	
	
	private void updateUserABonne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String matriculeO = request.getParameter("matriculeO");
		String matriculeN = request.getParameter("matriculeN");
		String nom = request.getParameter("nom");
	    String prenom = request.getParameter("prenom");
	    String adresse = request.getParameter("adresse");
	    String telephone = request.getParameter("telephone");
	    String faculte = request.getParameter("faculte");
	    String type = request.getParameter("type");
	    String sommeForfaitaire = "nonconerné";
	    String cotisation = "nonconerné";

	    // Check the type to determine the appropriate values for sommeForfaitaire and cotisation
	    if ("Etudiant Interne".equals(type)) {
	        sommeForfaitaire = (request.getParameter("sommeForfaitaire") != null && request.getParameter("sommeForfaitaire").equals("true")) ? "oui" : "non";
	    } else if ("Etudiant Externe".equals(type)) {
	        cotisation = (request.getParameter("cotisation") != null && request.getParameter("cotisation").equals("true")) ? "oui" : "non";
	    }
	    
		Abonne user = new Abonne(matriculeO, matriculeN, nom, prenom, adresse, telephone, faculte, type, sommeForfaitaire, cotisation, "" + java.time.LocalDate.now());
		abonneDAO.updateAbonne(user);
		response.sendRedirect("listeAbonne");
	}
	
	private void listUserAbonne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// In your UserServlet's listUser method or where you fetch the users:
		List<Abonne> listAbonne = abonneDAO.selectAllAbonnes();
		request.setAttribute("listAbonnee", listAbonne);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/administrateur/ListeAbonnes.jsp");
		dispatcher.forward(request, response);
	}
	
	private void showNewFormPenalisation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Retard> retardsList = retardDAO.selectAllRetards();
		request.setAttribute("retardsList", retardsList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/administrateur/AjouterPenalisation.jsp");
		request.setAttribute("penalisateur", null);
		dispatcher.forward(request, response);
	}
	
	private void listUserPenalisation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/administrateur/ListePenalisation.jsp");
		List<Penalisation> penalisationsList = penalisationDAO.getAllPenalisation();
		request.setAttribute("penalisationsList", penalisationsList);
		dispatcher.forward(request, response);
	}
	
	private void showNewFormOuvrage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Catalogue> catalogueliste = catalogueDAO.selectAllCatalogues();
    	List<Rayon> rayonliste = rayonDAO.selectAllRayons();
    	

    	RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/AjouterOuvrage.jsp");
        request.setAttribute("ouvrage", null);
        request.setAttribute("listeCatalogues", catalogueliste);
        request.setAttribute("listeRayons",rayonliste);

        dispatcher.forward(request, response);
    }

    private void insertOuvrage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String code = request.getParameter("code");
        String titre = request.getParameter("titre");
        String auteur = request.getParameter("auteur");
        String editeur = request.getParameter("editeur");
        int annee = Integer.parseInt(request.getParameter("annee"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        String catalogue = request.getParameter("catalogue");
        String emplacement = request.getParameter("rayon");

        Ouvrage existingOuvrage = ouvrageDAO.selectOuvrageByCode(code);
        
        if (existingOuvrage != null) {
        
           	List<Catalogue> catalogueliste = catalogueDAO.selectAllCatalogues();
        	List<Rayon> rayonliste = rayonDAO.selectAllRayons();
            request.setAttribute("listeCatalogues", catalogueliste);
            request.setAttribute("listeRayons",rayonliste);
          response.sendRedirect(request.getContextPath() + "/AjouterOuvrage?error=existingOuvrage");
        } else {
            Ouvrage ouvrage = new Ouvrage(code, titre, auteur, editeur, annee, quantite, catalogue, emplacement);

            ouvrageDAO.insertOuvrage(ouvrage);
            response.sendRedirect(request.getContextPath() + "/listeOuvrage");

            for (int i = 1; i <= quantite; i++) {
                Exemplaire exemplaire = new Exemplaire(code + "/" + i, emplacement, "disponible");
                exemplaireDAO.insertExemplaire(exemplaire);
            }
        }
    }

   
    private void updateOuvrage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String code = request.getParameter("code");
        String titre = request.getParameter("titre");
        String auteur = request.getParameter("auteur");
        String editeur = request.getParameter("editeur");
        int annee = Integer.parseInt(request.getParameter("annee"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        String catalogue = request.getParameter("catalogue");
        String emplacement = request.getParameter("rayon");

        Ouvrage ouvrage = new Ouvrage(code, titre, auteur, editeur, annee, quantite, catalogue, emplacement);
        ouvrageDAO.updateOuvrage(ouvrage);
        response.sendRedirect(request.getContextPath() + "/listeOuvrage");
		response.sendRedirect("listeOuvrage?updateSuccess=true");

    }

    private void deleteOuvrage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
      
        try {
            ouvrageDAO.deleteOuvrage(code);
            response.sendRedirect(request.getContextPath() + "/listeOuvrage?deleteSuccess=true");
        } catch (Exception e) {
            e.printStackTrace();
            
        }}
    

    private void listOuvrage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            List<Ouvrage> listeOuvrages = ouvrageDAO.selectAllOuvrages();
            request.setAttribute("listeOuvrages", listeOuvrages);
        	List<Catalogue> catalogueliste = catalogueDAO.selectAllCatalogues();
        	List<Rayon> rayonliste = rayonDAO.selectAllRayons();
            request.setAttribute("listeCatalogues", catalogueliste);
            request.setAttribute("listeRayons",rayonliste);
     
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/ListeOuvrage.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    private void showNewFormRayon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/AjouterRayon.jsp");
		dispatcher.forward(request, response);
    }

    private void insertRayon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String code = request.getParameter("code");
        String emplacement = request.getParameter("emplacement");
        Rayon rayon = new Rayon(code, emplacement);
        rayonDAO.insertRayon(rayon);
		response.sendRedirect("?insertSuccess=true");;

    }
    
    private void showRestitutionPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/Restitution.jsp");
        dispatcher.forward(request, response);
    }

    private void insertRestitution(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String dateRestitutionStr = request.getParameter("daterestitution");
        String matriculeLecteur = request.getParameter("matriculelecteur");
        String codeExemplaire = request.getParameter("codeexamplaire");

        java.sql.Date dateRestitution = null;
        try {
            if (dateRestitutionStr != null && !dateRestitutionStr.isEmpty()) {
                dateRestitution = java.sql.Date.valueOf(dateRestitutionStr);
            } else {
               
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            
        }

        Restitution restitution = new Restitution(0, dateRestitution, matriculeLecteur, codeExemplaire);
        RestitutionDAO restitutionDAO = new RestitutionDAO(); 
        restitutionDAO.insertRestitution(restitution); 
     
        List<Restitution> listRestitutions = restitutionDAO.selectAllRestitutions();
        request.setAttribute("listRestitution", listRestitutions);
        
        request.getRequestDispatcher("/pages/Bibliothecaire/ListeRestitutions.jsp")
               .forward(request, response);
        request.setAttribute("insertionSuccess", true);
        
    }
    
    private void deleteRestitution(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String dateRestitutionStr = request.getParameter("daterestitution");
        String matriculeLecteur = request.getParameter("matriculelecteur");
        String codeExemplaire = request.getParameter("codeexamplaire");
        restitutionsDAO.deleteRestitution(id);
        response.sendRedirect("listeRestitution?deleteSuccess=true");
    }

    private void updateRestitution(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String dateRestitutionStr = request.getParameter("daterestitution");
        String matriculeLecteur = request.getParameter("matriculelecteur");
        String codeExemplaire = request.getParameter("codeexamplaire");
        
        java.sql.Date dateRestitution = null;
        try {
            if (dateRestitutionStr != null && !dateRestitutionStr.isEmpty()) {
                dateRestitution = java.sql.Date.valueOf(dateRestitutionStr);
            } else {
                
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
           
        }

        Restitution restitution = new Restitution(id, dateRestitution, matriculeLecteur, codeExemplaire);
        restitutionsDAO.updateRestitution(restitution);
        response.sendRedirect("listeRestitution?updateSuccess=true");
    }

    private void listRestitutions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        List<Restitution> listRestitutions = restitutionsDAO.selectAllRestitutions();
        
        
        request.setAttribute("listRestitution", listRestitutions);
        
        
        request.setAttribute("insertionSuccess", true);
        
        // Rediriger vers la page ListeRestitutions.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/ListeRestitutions.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showNewFormCatalogue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/AjouterCatalogue.jsp");
	    request.setAttribute("catalogue", null);
	    dispatcher.forward(request, response);
	}

	private void insertCatalogue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
	    String nomC = request.getParameter("nomC");

	    Catalogue catalogue = new Catalogue(nomC);
	    catalogueDAO.insertCatalogue(catalogue);
	    response.sendRedirect("listeCatalogue?insertSuccess=true");
	}

	private void deleteCatalogue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    catalogueDAO.deleteCatalogue(id);
	    response.sendRedirect("listeCatalogue?deleteSuccess=true");
	}

	private void updateCatalogue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
	    int id = Integer.parseInt(request.getParameter("id"));
	    String nomC = request.getParameter("nomC");

	    Catalogue catalogue = new Catalogue(id, nomC);
	    catalogueDAO.updateCatalogue(catalogue);
	    response.sendRedirect("listeCatalogue?updateSuccess=true");
	}

	private void listCatalogue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<Catalogue> listCatalogue = catalogueDAO.selectAllCatalogues();
	    request.setAttribute("listCatalogue", listCatalogue);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/ListeCatalogues.jsp");
	    dispatcher.forward(request, response);
	}
	
	private void showNewFormEmprunt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List<Abonne> listAbonne = abonneDAO.listeLecteurEmpruntTableView();
		List<Examplaire> listExamplaire = examplaireDAO.getAllExamplaires();
		request.setAttribute("listAbonnee", listAbonne);
		request.setAttribute("listExamplaire", listExamplaire);
		
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/AjouterEmprunt.jsp");
	    dispatcher.forward(request, response);
	}
	
	private void insertEmprunt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		// Retrieve added ouvrages and matriculelecteur from the request
		String matriculeLecteur = request.getParameter("matricule");
	    String addedOuvrages = request.getParameter("addedOuvrages");

	    // Split the addedOuvrages string into an array or process it as needed
	    String[] addedOuvragesArray = addedOuvrages.split(",");
	    int maxadded = addedOuvragesArray.length;
	    System.out.println("added ouvrages: "+addedOuvrages);
	    System.out.println("added ouvrages Array: "+addedOuvragesArray[0]);
	    
	    if(empruntDAO.isMatriculelecteurPenalized(matriculeLecteur)){
	    	// Retrieve the penalized until date from your DAO or wherever it's stored
	        Date penalizedUntilDate = empruntDAO.getPenalizedUntilDate(matriculeLecteur);

	        // Format the date as a string (you may need to adjust the format based on your requirements)
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        String penalizedUntilDateString = dateFormat.format(penalizedUntilDate);

	        // Set the message with the penalized until date
	        String errorMessage = "The user is penalized until " + penalizedUntilDateString + ".";
	        request.setAttribute("errorLecteur", errorMessage);

	        RequestDispatcher dispatcher = request.getRequestDispatcher("AjouterEmprunt");
	        dispatcher.forward(request, response);
	    }else{
	    	if(empruntDAO.getMaxAllowedEmprunts(matriculeLecteur) == 3){
	    		request.setAttribute("maxBookLecteur", "the user already emprunted 3 book he is not allowed to take more than that");
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("AjouterEmprunt");
		        dispatcher.forward(request, response);
		        System.out.println("hello here");
	    	}else if ((empruntDAO.getMaxAllowedEmprunts(matriculeLecteur) == 2 && empruntDAO.getMaxAllowedEmprunts(matriculeLecteur) < maxadded) || (empruntDAO.getMaxAllowedEmprunts(matriculeLecteur) == 2 && empruntDAO.getMaxAllowedEmprunts(matriculeLecteur) == maxadded)){
	    		int qunt = empruntDAO.getMaxAllowedEmprunts(matriculeLecteur);
	    		request.setAttribute("maxBookLecteur", "the user already emprunted "+empruntDAO.getMaxAllowedEmprunts(matriculeLecteur)+" Book so he is allowed to take only 1");
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("AjouterEmprunt");
		        dispatcher.forward(request, response);
		        System.out.println("hello here 2");
	    	}else if((empruntDAO.getMaxAllowedEmprunts(matriculeLecteur) == 1 && maxadded == 3)){
	    		int qunt = empruntDAO.getMaxAllowedEmprunts(matriculeLecteur);
	    		request.setAttribute("maxBookLecteur", "the user already emprunted "+empruntDAO.getMaxAllowedEmprunts(matriculeLecteur)+" Book so he is allowed to take only 2");
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("AjouterEmprunt");
		        dispatcher.forward(request, response);
		        System.out.println("hello here 3");
	    	}else{
	    		System.out.println("the user didnt take any book");
	    		for (int i = 0; i < addedOuvragesArray.length; i++) {
					Emprunt model = new Emprunt(java.time.LocalDate.now()+"", java.time.LocalTime.now()+"", ""+java.time.LocalDate.now().plusWeeks(3), "non", "non", matriculeLecteur, addedOuvragesArray[i]);
					empruntDAO.insertEmprunt(model);
				}
	    	}
	    }
	}
	
	private void listEmprunt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// In your UserServlet's listEmprunt method or where you fetch the users:
		List<Emprunt> listEmprunt = empruntDAO.selectAllEmprunts();
		request.setAttribute("listEmprunt", listEmprunt);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/ListeEmprunts.jsp");
		dispatcher.forward(request, response);
	}
	
	private void ProlongerEmprunt(HttpServletRequest request, HttpServletResponse response) throws java.text.ParseException, ServletException, IOException {
		String dateretour = request.getParameter("dateretour");	
		int idemprunt = Integer.parseInt(request.getParameter("idemprunt"));
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        // Parse the input string into a LocalDate object
		LocalDate date =  LocalDate.parse(dateretour, formatter);
        empruntDAO.prolongerEmprunt(idemprunt, date.plusWeeks(2)+"");
        
        List<Emprunt> listEmprunt = empruntDAO.selectAllEmprunts();
		request.setAttribute("listEmprunt", listEmprunt);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/Bibliothecaire/ListeEmprunts.jsp");
		dispatcher.forward(request, response);
	}
		 
}
