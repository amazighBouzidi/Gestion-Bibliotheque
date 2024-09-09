<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Administrateur Page Management</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="../../allcomponents/allcss.jsp" %>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jcomb.css">
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.jpg);"></a>
	        <ul class="list-unstyled components mb-5">
	        	<li>
	              <a href="<%=request.getContextPath()%>/showHome">Acceuil</a>
	          	</li>
	          	<li class="">
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer les Rayons</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">
	                <li>
	                    <a href="<%=request.getContextPath()%>/AjouterRayon">
    						Ajouter Un Rayon
						</a>
	                </li>
	                <li>
	                    <a href="<%=request.getContextPath()%>/listeRayon">
							Liste Des Rayons
						</a>
	                </li>
	            </ul>
	          </li>
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Catalogues</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="<%=request.getContextPath()%>/AjouterCatlogue">
						Ajouter Catalogue
					</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/listeCatalogue">
                    	Liste Des Catalogue
                    </a>
                </li>
              </ul>
	          </li>
	          <li>
	              <a href="#pageouvrage" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Ouvrages</a>
	              <ul class="collapse list-unstyled" id="pageouvrage">
	                <li>
	                    <a href="<%=request.getContextPath()%>/AjouterOuvrage">
							Ajouter Une Ouvrage
						</a>
	                </li>
	                <li>
	                    <a href="<%=request.getContextPath()%>/listeOuvrage">
							Liste Des Ouvrages
						</a>
	                </li>
	              </ul>
	          </li>
	          <li>
	              <a href="#pageemprunt" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Emprunts</a>
	              <ul class="collapse list-unstyled" id="pageemprunt">
	                <li>
	                    <a href="<%=request.getContextPath()%>/AjouterEmprunt">
							Ajouter Une Emprunt
						</a>
	                </li>
	                <li>
	                    <a href="<%=request.getContextPath()%>/listeEmprunt">
							Liste Des Emprunts
						</a>
	                </li>
	              </ul>
	          </li>
	          <li>
	              <a href="#pageres" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Restitutions</a>
	              <ul class="collapse list-unstyled" id="pageres">
	                <li>
	                    <a href="<%=request.getContextPath()%>/AjouterRestitution">
							Ajouter Une Restitution
						</a>
	                </li>
	                <li>
	                    <a href="<%=request.getContextPath()%>/listeRestitution">
							Liste Des Restitution
						</a>
	                </li>
	              </ul>
	          </li>
	        </ul>

	        <div class="footer">
	        	<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	        </div>

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Portfolio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>

            <!-- Form to add a new ouvrage -->
            <h2 class="text-center">Ajouter un Nouvel Ouvrage</h2>
            <div class="container-fluid" style="margin-top: 20px;">			    
                <form id="addOuvrageForm" class="row g-3 needs-validation" action="<%=request.getContextPath()%>/insertOuvrage" method="post" novalidate>
                    <!-- Code -->
                    <div class="col-md-6" style="margin-top: 20px;">
                        <label for="validationCustomCode" class="form-label">Code</label>
                        <input type="text" class="form-control" id="validationCustomCode" name="code" required>
                        <div class="invalid-feedback">
                            Veuillez fournir un code valide.
                        </div>
                    </div>
                    <!-- Titre -->
                    <div class="col-md-6" style="margin-top: 20px;">
                        <label for="validationCustomTitre" class="form-label">Titre</label>
                        <input type="text" class="form-control" id="validationCustomTitre" name="titre" required>
                        <div class="invalid-feedback">
                            Veuillez fournir un titre valide.
                        </div>
                    </div>
                    <!-- Auteur -->
                    <div class="col-md-6" style="margin-top: 20px;">
                        <label for="validationCustomAuteur" class="form-label">Auteur</label>
                        <input type="text" class="form-control" id="validationCustomAuteur" name="auteur" required>
                        <div class="invalid-feedback">
                            Veuillez fournir un auteur valide.
                        </div>
                    </div>
                    <!-- Editeur -->
                    <div class="col-md-6" style="margin-top: 20px;">
                        <label for="validationCustomEditeur" class="form-label">Editeur</label>
                        <input type="text" class="form-control" id="validationCustomEditeur" name="editeur" required>
                        <div class="invalid-feedback">
                            Veuillez fournir un éditeur valide.
                        </div>
                    </div>
                    <!-- Année -->
                    <div class="col-md-6" style="margin-top: 20px;">
                        <label for="validationCustomAnnee" class="form-label">Année</label>
                        <input type="text" class="form-control" id="validationCustomAnnee" name="annee" required>
                        <div class="invalid-feedback">
        Veuillez fournir une année valide (format : YYYY).
                        </div>
                    </div>
                    <!-- Quantité -->
                    <div class="col-md-6" style="margin-top: 20px;">
                        <label for="validationCustomAnnee" class="form-label">Quantité</label>
                        <input type="text" class="form-control" id="validationCustomQuantite" name="quantite" required>
                        <div class="invalid-feedback">
                            Veuillez fournir une quantité valide.
                        </div>
                    </div>
                     <label for="catalogue">Catalogue:</label>
                     
        <select id="catalogue" name="catalogue" class="form-select">
           
            <c:forEach var="catalogue" items="${listeCatalogues}">
                <option value="${catalogue.nomC}">${catalogue.nomC}</option>
            </c:forEach>
        </select>
         <label for="rayon">Rayon:</label>
        <select id="rayon" name="rayon" class="form-select">
           
            <c:forEach var="rayon" items="${listeRayons}">
                <option value="${rayon.emplacement}">${rayon.emplacement}</option>
            </c:forEach>
        </select>

       
                    <!-- Autres champs à ajouter selon vos besoins -->

                    <!-- Ajouter Ouvrage -->
                    <div class="col-md-12" style="margin-top: 5%;">
                        <button class="btn btn-primary col-12" type="submit">Ajouter Ouvrage</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

		

<!-- Votre script de validation de formulaire -->
<script>
  $(document).ready(function() {
    // Fetch the form for adding a new bibliothecaire
    const addOuvrageForm = $('#addOuvrageForm');

    // Prevent submission and apply custom Bootstrap validation styles
    addOuvrageForm.on('submit', function(event) {
   
      const yearValue = $('#validationCustomAnnee').val();

      
      const yearPattern = /^\d{4}$/;

      
      if (!yearPattern.test(yearValue)) {
        // Afficher un message d'erreur personnalis�
        $('#validationCustomAnnee').removeClass('is-valid').addClass('is-invalid');
        $('#validationCustomAnnee').next('.invalid-feedback').text('Veuillez fournir une ann�e valide au format YYYY.');
        event.preventDefault();
        event.stopPropagation();
      } else {
        $('#validationCustomAnnee').removeClass('is-invalid').addClass('is-valid');
      }

      if (!addOuvrageForm[0].checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }

      addOuvrageForm.addClass('was-validated');
    });
  });
</script>

   <script src="js/main.js"></script>
   <% String error = request.getParameter("error");
       if (error != null && error.equals("existingOuvrage")) { %>
        <script type="text/javascript">
            alert('L\'ouvrage existe déjà. Veuillez saisir un code différent.');
        </script>
    <% } %>
    <script src="js/sideBar.js"></script>
</body>
</html>
