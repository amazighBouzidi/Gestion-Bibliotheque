<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

        <h2 class="text-center">Liste Des Ouvrages</h2>
        <div class="container-fluid">
		    <!-- Search Field -->
		    <div class="mb-3">
                    <input type="text" id="searchInput" class="form-control" placeholder="Rechercher...">
                </div>
                
                <!-- Table to display the list of ouvrages -->
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>Code</th>
                                <th>Titre</th>
                                <th>Auteur</th>
                                <th>Editeur</th>
                                <th>Année</th>
                                <th>Quantité</th>
                                <th>Catalogue</th>
                                <th>Emplacement</th>
                                <th>Actions</th>
                                <!-- Add more columns as needed -->
                            </tr>
                        </thead>
                        <tbody id="ouvrageTableBody">
                            <c:forEach var="ouvrage" items="${listeOuvrages}">
                                <tr>
                                    <td>${ouvrage.code}</td>
                                    <td>${ouvrage.titre}</td>
                                    <td>${ouvrage.auteur}</td>
                                    <td>${ouvrage.editeur}</td>
                                    <td>${ouvrage.annee}</td>
                                    <td>${ouvrage.quantite}</td>
                                    <td>${ouvrage.catalogue}</td>
                                    <td>${ouvrage.emplacement}</td>
                                    <td>
                                        <!-- Update Modal Button -->
                                        <button type="button" class="btn btn-warning btn-sm" onclick="handleModifierClick('${ouvrage.code}')" data-toggle="modal" data-target="#updateModal${ouvrage.code}">
                                            Modifier
                                        </button>
                                        <!-- Delete Modal Button -->
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal${ouvrage.code}">
                                            Supprimer
                                        </button>
                                    </td>
                                </tr>
                                <!-- Update Modal -->
                                <div class="modal fade" id="updateModal${ouvrage.code}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                                    <!-- Update Modal content goes here -->
                                    hello
                                </div>
                                <!-- End Update Modal -->

                                <!-- Delete Modal -->
                                <div class="modal fade" id="deleteModal${ouvrage.code}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                    <!-- Delete Modal content goes here -->
                                </div>
                                <!-- End Delete Modal -->
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
		</div>
		<!-- Update Toast -->
		<div class="toast custom-toast update-toast" role="alert" aria-live="assertive" aria-atomic="true" style="color: white; background-color: green; width: 300px; position: fixed; top: 0; right: 0; margin: 10px; z-index: 1050;">
		    <div class="toast-header">
		        <strong class="me-auto">Update Status</strong>
		        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		    </div>
		    <div class="toast-body">
		        Bibliothecaire updated successfully!
		    </div>
		</div>
		
		<!-- Delete Toast -->
		<div class="toast custom-toast delete-toast" role="alert" aria-live="assertive" aria-atomic="true" style="color: white; background-color: red; width: 300px; position: fixed; top: 0; right: 0; margin: 10px; z-index: 1050;">
		    <div class="toast-header">
		        <strong class="me-auto">Delete Status</strong>
		        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		    </div>
		    <div class="toast-body">
		        Bibliothecaire deleted successfully!
		    </div>
		</div>
		
		<!-- Insert Success Toast -->
		<div class="toast custom-toast insert-toast" role="alert" aria-live="assertive" aria-atomic="true" style="width: 300px; position: fixed; top: 0; right: 0; margin: 10px; z-index: 1050;">
		     <div class="toast-header">
		        <strong class="me-auto">Insert Status</strong>
		        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    		</div>
		    <div class="toast-body">
		        Bibliothecaire added successfully!
		    </div>
		</div>
		<script>
                $(document).ready(function() {
                    // Original table data
                    var originalData = [
                        <c:forEach var="ouvrage" items="${listeOuvrages}" varStatus="loop">
                            {
                                code: '${ouvrage.code}',
                                titre: '${ouvrage.titre}',
                                auteur: '${ouvrage.auteur}',
                                editeur: '${ouvrage.editeur}',
                                annee: '${ouvrage.annee}',
                                quantite: '${ouvrage.quantite}',
                                catalogue: '${ouvrage.catalogue}',
                                rayon: '${ouvrage.emplacement}',
                            },
                        </c:forEach>
                    ];

                    // Initialize the table with the original data
                    updateTable(originalData);

                    // Listen for changes in the search input
                    $('#searchInput').on('input', function() {
                        var searchText = $(this).val().toLowerCase();

                        // Filter the original data based on the search text
                        var filteredData = originalData.filter(function(ouvrage) {
                            return (
                                ouvrage.titre.toLowerCase().includes(searchText) ||
                                ouvrage.auteur.toLowerCase().includes(searchText) ||
                                ouvrage.editeur.toLowerCase().includes(searchText) ||
                                ouvrage.annee.includes(searchText) ||
                                ouvrage.catalogue.toLowerCase().includes(searchText) ||
                                ouvrage.rayon.toLowerCase().includes(searchText)
                                // Add more conditions for other columns as needed
                            );
                        });

                        // Update the table with the filtered data
                        updateTable(filteredData);
                    });

                    // Function to update the table with new data
                    function updateTable(data) {
                        var tableBody = $('#ouvrageTableBody');
                        tableBody.empty();

                        // Append rows to the table based on the data
                        data.forEach(function(ouvrage) {
                            var row = '<tr>' +
                                '<td>' + ouvrage.code + '</td>' +
                                '<td>' + ouvrage.titre + '</td>' +
                                '<td>' + ouvrage.auteur + '</td>' +
                                '<td>' + ouvrage.editeur + '</td>' +
                                '<td>' + ouvrage.annee + '</td>' +
                                '<td>' + ouvrage.quantite + '</td>' +
                                '<td>' + ouvrage.catalogue + '</td>' +
                                '<td>' + ouvrage.rayon + '</td>' +
                                '<td>' +
                                '<button type="button" class="btn btn-warning btn-sm"  data-toggle="modal" data-target="#updateModal' + ouvrage.code + '">Modifier</button>' +
                                '<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal' + ouvrage.code + '">Supprimer</button>' +
                                '</td>' +
                                '</tr>';

                            tableBody.append(row);
                        });
                    }
                });
        </script>
		<script>
			$(document).ready(function() {
			    // Check if the URL contains an update success parameter for catalogue
			    var updateParams = new URLSearchParams(window.location.search);
			    if (updateParams.has('updateSuccess') && updateParams.get('updateSuccess') === 'true') {
			        // Display the Bootstrap toast notification for update
			        var updateToast = $('.update-toast');
			        updateToast.toast('show');
			        // Close the delete toast after 5 seconds
			        setTimeout(function() {
			            deleteToast.toast('hide');
			        }, 500000);
			    }
	
			    // Check if the URL contains a delete success parameter for catalogue
			    var deleteParams = new URLSearchParams(window.location.search);
			    if (deleteParams.has('deleteSuccess') && deleteParams.get('deleteSuccess') === 'true') {
			        // Display the Bootstrap toast notification for delete
			        var deleteToast = $('.delete-toast');
			        deleteToast.toast('show');
	
			        // Close the delete toast after 5 seconds
			        setTimeout(function() {
			            deleteToast.toast('hide');
			        }, 500000);
			    }
	
			    // Check if the URL contains a success parameter for catalogue
			    var urlParams = new URLSearchParams(window.location.search);
			    if (urlParams.has('insertSuccess') && urlParams.get('insertSuccess') === 'true') {
			        // Display the Bootstrap toast notification
			        var toast = $('.insert-toast');
			        toast.toast('show');
			        // Close the delete toast after 5 seconds
			        setTimeout(function() {
			            deleteToast.toast('hide');
			        }, 500000);
			    }
			});
		</script>
		<script>
		    function handleModifierClick(code) {
		        console.log('Modifier button clicked for code:', code);
		        // You can add your logic here to show the modal or perform other actions.
		    }
		</script>
		<script src="js/main.js"></script>
		
</body>
</html>