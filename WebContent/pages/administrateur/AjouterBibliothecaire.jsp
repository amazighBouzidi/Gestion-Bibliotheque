<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<meta charset="utf-8">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="../../allcomponents/allcss.jsp" %>
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
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
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer les abonnés</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">
	                <li>
	                    <a href="<%=request.getContextPath()%>/AjouterAbonne">
							Ajouter Un Abonné
						</a>
	                </li>
	                <li>
	                    <a href="<%=request.getContextPath()%>/listeAbonne">
							Liste Des Abonnés
						</a>
	                </li>
	            </ul>
	          </li>
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Bibliothecaires</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="<%=request.getContextPath()%>/AjouterBibliothecaire">
						Ajouter Bibliothecaire
					</a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/listeBibliothecaire">
						Liste Des Bibliothecaires
					</a>
                </li>
              </ul>
	          </li>
	          <li>
	              <a href="#pagepen" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Pénalisations</a>
	              <ul class="collapse list-unstyled" id="pagepen">
	                <li>
	                    <a href="<%=request.getContextPath()%>/AjouterPenalisation">
							Ajouter Une Pénalisation
						</a>
	                </li>
	                <li>
	                    <a href="<%=request.getContextPath()%>/listePenalisation">
							Liste Des Pénalisations
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

        	<h2 class="text-center">Ajouter un Nouveau Bibliothecaire</h2>
        	<div class="container-fluid" style="margin-top: 20px;">			    
			    <form id="addBibliothecaireForm" class="row g-3 needs-validation" action="<%=request.getContextPath()%>/insertBibliothecaire" method="post" novalidate>
				  <div class="col-md-6" style="margin-top: 20px;">
				    <label for="validationCustomNom" class="form-label">Nom</label>
				    <input type="text" class="form-control" id="validationCustomNom" name="nom" required>
				    <div class="invalid-feedback">
				      Veuillez fournir un nom valide.
				    </div>
				  </div>
				  <div class="col-md-6" style="margin-top: 20px;">
				    <label for="validationCustomPrenom" class="form-label">Prenom</label>
				    <input type="text" class="form-control" id="validationCustomPrenom" name="prenom" required>
				    <div class="invalid-feedback">
				      Veuillez fournir un prénom valide.
				    </div>
				  </div>
				
				  <div class="col-md-6" style="margin-top: 20px;">
				    <!-- Add a new row for Adresse -->
				    <label for="validationCustomAdresse" class="form-label">Adresse</label>
				    <input type="text" class="form-control" id="validationCustomAdresse" name="adresse" required>
				    <div class="invalid-feedback">
				      Veuillez fournir une adresse valide.
				    </div>
				  </div>
				
				  <div class="col-md-6" style="margin-top: 20px;">
				    <!-- Add a new row for Telephone -->
				    <label for="validationCustomTelephone" class="form-label">Telephone</label>
				    <input type="text" class="form-control" id="validationCustomTelephone" name="telephone" required>
				    <div class="invalid-feedback">
				      Veuillez fournir un numéro de téléphone valide.
				    </div>
				  </div>
				  <div class="col-md-6" style="margin-top: 20px;">
				    <!-- Add a new row for Username -->
				    <label for="validationCustomUsername" class="form-label">Username</label>
				    <input type="text" class="form-control" id="validationCustomUsername" name="username" required>
				    <div class="invalid-feedback">
				      Veuillez choisir un nom d'utilisateur.
				    </div>
				  </div>
				
				  <div class="col-md-6" style="margin-top: 20px;">
				    <!-- Add a new row for Password -->
				    <label for="validationCustomPassword" class="form-label">Password</label>
				    <input type="password" class="form-control" id="validationCustomPassword" name="password" required>
				    <div class="invalid-feedback">
				      Veuillez fournir un mot de passe valide.
				    </div>
				  </div>
				
				  <div class="col-md-12" style="margin-top: 5%;">
				    <!-- Add a new row for the "Ajouter Bibliothecaire" button -->
				    <button class="btn btn-primary col-12" type="submit">Ajouter Bibliothecaire</button>
				  </div>
				</form>
			</div>
		</div>
		<script src="js/sideBar.js"></script>
		<script>
		  $(document).ready(function() {
		    // Fetch the form for adding a new bibliothecaire
		    const addBibliothecaireForm = $('#addBibliothecaireForm');
		
		    // Prevent submission and apply custom Bootstrap validation styles
		    addBibliothecaireForm.on('submit', function(event) {
		      if (!addBibliothecaireForm[0].checkValidity()) {
		        event.preventDefault();
		        event.stopPropagation();
		      }
		
		      addBibliothecaireForm.addClass('was-validated');
		    });
		  });
		</script>

    <script src="js/main.js"></script>
  </body>
</html>