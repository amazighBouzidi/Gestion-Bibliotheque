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

        	<h2 class="text-center">Liste des Bibliothecaires</h2>
        	<div class="container-fluid">
        		<!-- Search Field -->
		        <div class="mb-3">
		            <input type="text" id="searchInput" class="form-control" placeholder="Rechercher...">
		        </div>
		         <div class="table-responsive">
		            <table class="table table-bordered">
		                <thead class="thead-dark">
		                    <tr>
		                        <th>ID</th>
		                        <th>Nom</th>
		                        <th>Prenom</th>
		                        <th>Adresse</th>
		                        <th>Telephone</th>
		                        <th>Username</th>
		                        <th>Password</th>
		                        <th>Actions</th>
		                    </tr>
		                </thead>
		                <tbody id="bibliothecaireTableBody">
		                    <c:forEach var="bibliothecaire" items="${listBibliothecaire}">
		                        <tr>
		                            <td>${bibliothecaire.id}</td>
		                            <td>${bibliothecaire.nom}</td>
		                            <td>${bibliothecaire.prenom}</td>
		                            <td>${bibliothecaire.adresse}</td>
		                            <td>${bibliothecaire.telephone}</td>
		                            <td>${bibliothecaire.username}</td>
		                            <td>${bibliothecaire.password}</td>
		                            <td>
		                                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateModal${bibliothecaire.id}">
		                                    Modifier
		                                </button>
		                                <!-- Button to trigger the delete confirmation modal -->
								        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal${bibliothecaire.id}">
								            Supprimer
								        </button>
		                            </td>
		                        </tr>
		                         <!-- Update Modal -->
							    <div class="modal fade" id="updateModal${bibliothecaire.id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
							        <div class="modal-dialog" role="document">
							            <div class="modal-content">
							                <div class="modal-header">
							                    <h5 class="modal-title" id="updateModalLabel">Modifier Bibliothecaire</h5>
							                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							                        <span aria-hidden="true">&times;</span>
							                    </button>
							                </div>
							                <div class="modal-body">
							                    <!-- Update form -->
							                    <form action="<%=request.getContextPath()%>/updateBibliothecaire" method="post">
							                        <input type="hidden" name="id" value="${bibliothecaire.id}">
							                        
							                        <!-- Nom -->
							                        <div class="form-group">
							                            <label for="nom">Nom:</label>
							                            <input type="text" name="nom" value="${bibliothecaire.nom}" class="form-control" required>
							                        </div>
							                        
							                        <!-- Prenom -->
							                        <div class="form-group">
							                            <label for="prenom">Prenom:</label>
							                            <input type="text" name="prenom" value="${bibliothecaire.prenom}" class="form-control" required>
							                        </div>
							                        
							                        <!-- Adresse -->
							                        <div class="form-group">
							                            <label for="adresse">Adresse:</label>
							                            <input type="text" name="adresse" value="${bibliothecaire.adresse}" class="form-control" required>
							                        </div>
							                        
							                        <!-- Telephone -->
							                        <div class="form-group">
							                            <label for="telephone">Telephone:</label>
							                            <input type="text" name="telephone" value="${bibliothecaire.telephone}" class="form-control" required>
							                        </div>
							                        
							                        <!-- Username -->
							                        <div class="form-group">
							                            <label for="username">Username:</label>
							                            <input type="text" name="username" value="${bibliothecaire.username}" class="form-control" required>
							                        </div>
							                        
							                        <!-- Password -->
							                        <div class="form-group">
							                            <label for="password">Password:</label>
							                            <input type="password" name="password" value="${bibliothecaire.password}" class="form-control" required>
							                        </div>
							                        
							                        <button type="submit" class="btn btn-primary">Enregistrer</button>
							                    </form>
							                    <!-- End Update form -->
							                </div>
							            </div>
							        </div>
							    </div>
    							<!-- End Update Modal -->	
    							<!-- Delete Confirmation Modal -->
							    <div class="modal fade" id="deleteModal${bibliothecaire.id}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
							        <div class="modal-dialog" role="document">
							            <div class="modal-content">
							                <div class="modal-header">
							                    <h5 class="modal-title" id="deleteModalLabel">Confirmation de Suppression</h5>
							                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							                        <span aria-hidden="true">&times;</span>
							                    </button>
							                </div>
							                <div class="modal-body">
							                    <p>Voulez-vous vraiment supprimer ce bibliothecaire : ${bibliothecaire.nom} ${bibliothecaire.prenom}?</p>
							                </div>
							                <div class="modal-footer">
							                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
							                    <!-- Add the link or form action to delete the bibliothecaire -->
							                    <a href="<%=request.getContextPath()%>/deleteBibliothecaire?id=${bibliothecaire.id}" class="btn btn-danger">Supprimer</a>
							                </div>
							            </div>
							        </div>
							    </div>
							    <!-- End Delete Confirmation Modal -->	
		                    </c:forEach>
		                </tbody>
		            </table>
        		</div>
    		</div>
		</div>
		<script>
        $(document).ready(function() {
            // Original table data
            var originalData = [
				<c:forEach var="bibliothecaire" items="${listBibliothecaire}" varStatus="loop">
					{
					    id: '${bibliothecaire.id}',
					    nom: '${bibliothecaire.nom}',
					    prenom: '${bibliothecaire.prenom}',
					    adresse: '${bibliothecaire.adresse}',
					    telephone: '${bibliothecaire.telephone}',
					    username: '${bibliothecaire.username}',
					    password: '${bibliothecaire.password}'
					},
				</c:forEach>
            ];

            // Initialize the table with the original data
            updateTable(originalData);

            // Listen for changes in the search input
            $('#searchInput').on('input', function() {
                var searchText = $(this).val().toLowerCase();

                // Filter the original data based on the search text
                var filteredData = originalData.filter(function(bibliothecaire) {
                    return (
                        bibliothecaire.nom.toLowerCase().includes(searchText) ||
                        bibliothecaire.prenom.toLowerCase().includes(searchText) ||
                        bibliothecaire.adresse.toLowerCase().includes(searchText) ||
                        bibliothecaire.telephone.toLowerCase().includes(searchText) ||
                        bibliothecaire.username.toLowerCase().includes(searchText) ||
                        bibliothecaire.password.toLowerCase().includes(searchText)
                    );
                });

                // Update the table with the filtered data
                updateTable(filteredData);
            });

            // Function to update the table with new data
            function updateTable(data) {
                var tableBody = $('#bibliothecaireTableBody');
                tableBody.empty();

                // Append rows to the table based on the data
                data.forEach(function(bibliothecaire) {
                    var row = '<tr>';
                    row += '<td>' + bibliothecaire.id + '</td>';
                    row += '<td>' + bibliothecaire.nom + '</td>';
                    row += '<td>' + bibliothecaire.prenom + '</td>';
                    row += '<td>' + bibliothecaire.adresse + '</td>';
                    row += '<td>' + bibliothecaire.telephone + '</td>';
                    row += '<td>' + bibliothecaire.username + '</td>';
                    row += '<td>' + bibliothecaire.password + '</td>';
                    row += '<td>';
                    row += '<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateModal' + bibliothecaire.id + '">Modifier</button>';
                    row += '<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal' + bibliothecaire.id + '">Supprimer</button>';
                    row += '</td>';
                    row += '</tr>';
                    tableBody.append(row);
                });
            }
        });
    </script>
		
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
		
		<!-- JavaScript to show the toasts -->
		<script>
		    $(document).ready(function() {
		        // Check if the URL contains an update success parameter
		        var updateParams = new URLSearchParams(window.location.search);
		        if (updateParams.has('updateSuccess') && updateParams.get('updateSuccess') === 'true') {
		            // Display the Bootstrap toast notification for update
		            var updateToast = $('.update-toast');
		            updateToast.toast('show');
		         // Close the delete toast after 5 seconds
		            setTimeout(function(){
		                deleteToast.toast('hide');
		            }, 500000);
		            
		        }
		
		        // Check if the URL contains a delete success parameter
		        var deleteParams = new URLSearchParams(window.location.search);
		        if (deleteParams.has('deleteSuccess') && deleteParams.get('deleteSuccess') === 'true') {
		            // Display the Bootstrap toast notification for delete
		            var deleteToast = $('.delete-toast');
		            deleteToast.toast('show');
		
		            // Close the delete toast after 5 seconds
		            setTimeout(function(){
		                deleteToast.toast('hide');
		            }, 500000);
		        }
		        
		        // Check if the URL contains a success parameter
		        var urlParams = new URLSearchParams(window.location.search);
		        if (urlParams.has('insertSuccess') && urlParams.get('insertSuccess') === 'true') {
		            // Display the Bootstrap toast notification
		            var toast = $('.insert-toast');
		            toast.toast('show');
		         // Close the delete toast after 5 seconds
		            setTimeout(function(){
		                deleteToast.toast('hide');
		            }, 500000);
		        }
		    });
		</script>

    <script src="js/main.js"></script>
  </body>
</html>