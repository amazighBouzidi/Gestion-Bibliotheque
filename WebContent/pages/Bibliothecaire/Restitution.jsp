<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Administrateur Page Management</title>
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
	              <a href="#pagepen" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Ouvrages</a>
	              <ul class="collapse list-unstyled" id="pagepen">
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
	              <a href="#pagemrpunt" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Emprunts</a>
	              <ul class="collapse list-unstyled" id="pagemrpunt">
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

      <!-- Page Content  -->
<div id="content" class="container-fluid">
    <h2 class="text-center">Formulaire de Restitution</h2>
    <div class="container-fluid" style="margin-top: 20px;">
        <form id="restitutionForm" class="row g-3 needs-validation" action="<%=request.getContextPath()%>/insertRestitution" method="post" novalidate>
           
            </div>
            <div class="col-md-6" style="margin-top: 20px;">
                <label for="validationCustomDateRestitution" class="form-label">Date de Restitution</label>
                <input type="text" class="form-control" id="validationCustomDateRestitution" name="daterestitution" required>
                <div class="invalid-feedback">
                    Veuillez fournir une date de restitution valide.
                </div>
            </div>
            <div class="col-md-6" style="margin-top: 20px;">
                <label for="validationCustomMatricule" class="form-label">Matricule de l'Emprunteur</label>
                <input type="text" class="form-control" id="validationCustomMatricule" name="matriculelecteur" required>
                <div class="invalid-feedback">
                    Veuillez fournir un matricule valide.
                </div>
            </div>
            <div class="col-md-6" style="margin-top: 20px;">
                <label for="validationCustomCodeExemplaire" class="form-label">Code d'Exemplaire</label>
                <input type="text" class="form-control" id="validationCustomCodeExemplaire" name="codeexamplaire" required>
                <div class="invalid-feedback">
                    Veuillez fournir un code d'exemplaire valide.
                </div>
            </div>
            <div class="col-md-12" style="margin-top: 5%;">
                <button class="btn btn-primary col-12" type="submit">Valider la Restitution</button>
            </div>
          
        </form>
        <!-- Message d'insertion réussie -->
        <c:if test="${requestScope.insertionSuccess}">
            <div class="alert alert-success">
                Insertion réussie!
            </div>
        </c:if>
    </div>
</div>
<script src="js/sideBar.js"></script>
<script>
    $(document).ready(function() {
        // Fetch the restitution form
        const restitutionForm = $('#restitutionForm');

        // Prevent submission and apply custom Bootstrap validation styles
        restitutionForm.on('submit', function(event) {
            if (!restitutionForm[0].checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }

            restitutionForm.addClass('was-validated');
        });
    });
</script>


    <script src="js/main.js"></script>
  </body>
</html>