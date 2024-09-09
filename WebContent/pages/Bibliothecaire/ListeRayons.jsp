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
	 
	  <script>
        function searchTable() {
            // Récupérer la valeur de recherche
            var input = document.getElementById("searchInput");
            var filter = input.value.toUpperCase();

            // Sélectionner le corps du tableau
            var tableBody = document.getElementById("rayonTableBody");
            var rows = tableBody.getElementsByTagName("tr");

            // Parcourir toutes les lignes et cacher celles qui ne correspondent pas à la recherche
            for (var i = 0; i < rows.length; i++) {
                var columns = rows[i].getElementsByTagName("td");
                var found = false;

                // Parcourir les colonnes de chaque ligne
                for (var j = 0; j < columns.length - 1; j++) { // Ignorer la dernière colonne (actions)
                    var column = columns[j];
                    if (column) {
                        var txtValue = column.textContent || column.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            found = true;
                            break;
                        }
                    }
                }

                // Afficher ou masquer la ligne en fonction du résultat de la recherche
                if (found) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
    </script>


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
	                    <a href="<%=request.getContextPath()%>/listeRayons">
							Liste Des Rayons
						</a>
	                </li>
	            </ul>
	          </li>
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Gérer Les Catalogues</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="<%=request.getContextPath()%>/AjouterCatalogue">
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

        	<h2 class="text-center">Liste des Rayons</h2>
        	<div class="container-fluid">
        		<!-- Search Field -->
		        <div class="mb-3">
		            <input type="text" id="searchInput" class="form-control" placeholder="Rechercher...">
		        </div>
		         <div class="table-responsive">
		            <table class="table table-bordered">
		                <thead class="thead-dark">
		                    <tr>
		        <th>Code</th>
                <th>Emplacement</th>
               
		                    </tr>
		                </thead>
		                <tbody id="rayonTableBody">
		                    <c:forEach var="rayon" items="${listeRayons}">
		                        <tr>
		                           <td>${rayon.code}</td>
                    <td>${rayon.emplacement}</td>
                   
		                            <td>
		                                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateModal${rayon.code}">
		                                    Modifier
		                                </button>
		                                <!-- Button to trigger the delete confirmation modal -->
								        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal${rayon.code}">
								            Supprimer
								        </button>
		                            </td>
		                        </tr>
		                        </c:forEach>
		                        <!-- Modals outside the loop -->
<c:forEach var="rayon" items="${listeRayons}">
    <!-- Update Modal -->
    
    <div class="modal fade" id="updateModal${rayon.code}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">Modifier rayon</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Update form -->
                <form action="<%=request.getContextPath()%>/updateRayon" method="post">
                    <input type="hidden" name="code" value="${rayon.code}">
                    
                    <!--emplacement -->
                    <div class="form-group">
                        <label for="emplacement">Emplacement:</label>
                        <input type="text" name="emplacement" value="${rayon.emplacement}" class="form-control" required>
                    </div>
                    
                  
                    
                    <button type="submit" class="btn btn-primary">Enregistrer</button>
                </form>
                <!-- End Update form -->
            </div>
        </div>
    </div>    </div>

   <!-- Delete Modal -->
    
    <div class="modal fade" id="deleteModal${rayon.code}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Supprimer rayon</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Voulez-vous vraiment supprimer le rayon  "${rayon.emplacement}" ?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                    <a href="<%=request.getContextPath()%>/deleteRayon?code=${rayon.code}" class="btn btn-danger">Supprimer</a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
   <script>
        // Attacher un événement de saisie à la barre de recherche
        document.getElementById("searchInput").addEventListener("input", searchTable);
    </script>
    <script src="js/main.js"></script>
  </body>
</html>