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
        
	        <h2 class="text-center">Ajouter Emprunt</h2>
	        <div class="container-fluid" style="margin-top: 20px;">
	            <div class="row justify-content-center">
	                <div class="col-12">
	                    <form id="addEmpruntForm" class="row g-3 needs-validation" action="<%=request.getContextPath()%>/insertEmprunt" method="post" novalidate>
	                        <!-- Add Matricule Abonnee field -->
	                        <div class="col-md-6" style="margin-top: 20px;">
	                            <label for="validationMatricule" class="form-label">Matricule Abonnee</label>
	                            <input type="text" class="form-control" id="validationMatricule" name="matricule" required>
	                            <div class="invalid-feedback">
	                                Veuillez fournir un matricule valide.
	                            </div>
	                        </div>
	
	                        <!-- Add Code Ouvrage field -->
	                        <div class="col-md-6" style="margin-top: 20px;">
	                            <label for="validationCodeOuvrage" class="form-label">Code Ouvrage</label>
	                            <div class="input-group">
	                                 <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#examplaireModal">
							            Select an Ouvrage
							        </button>
	                            </div>      
	                        </div>
	
	                        <!-- Table to display added Code Ouvrages -->
	                        <div class="col-md-12" style="margin-top: 20px;">
	                            <table class="table table-bordered">
	                                <thead>
	                                    <tr>
	                                        <th>Added Code Ouvrages</th>
	                                    </tr>
	                                </thead>
	                                <tbody id="addedCodeOuvragesBody">
	                                    <!-- Table body will be dynamically populated by JS -->
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <!-- Error message for Code Ouvrage -->
							<div class="col-md-12" style="margin-top: 5%;">
							    <div id="codeOuvrageErrorMessage" class="text-danger"></div>
							</div>
							
							 <%-- Check for errorLecteur attribute and display error message --%>
						    <% if (request.getAttribute("errorLecteur") != null) { %>
						        <div style="color: red;">
						            <%= request.getAttribute("errorLecteur") %>
						        </div>
						    <% } %>
						    
						    <%-- Check for maxBookLecteur attribute and display error message --%>
						    <% if (request.getAttribute("maxBookLecteur") != null) { %>
						        <div style="color: red;">
						            <%= request.getAttribute("maxBookLecteur") %>
						        </div>
						    <% } %>
							
							<!-- Hidden input fields for added ouvrages -->
    						<input type="hidden" name="addedOuvrages" id="addedOuvrages" value="">
	                        <!-- Add Emprunt button -->
	                        <div class="col-md-12" style="margin-top: 4%;">
	                            <button class="btn btn-primary col-12" type="submit" onclick="prepareAddedOuvrages()">Add Emprunt</button>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
       </div>
       <!-- Modal for selecting Examplaire -->
		<div class="modal fade" id="examplaireModal" tabindex="-1" role="dialog" aria-labelledby="examplaireModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-xl" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="examplaireModalLabel">Select an Examplaire</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body">
		                <!-- Display the list of examplaires in a table -->
		                <table class="table table-bordered">
		                    <thead>
		                        <tr>
		                            <th>ID</th>
		                            <th>Reference</th>
		                            <th>Emplacement</th>
		                            <th>Disponibilite</th>
		                            <th>Action</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                        <c:forEach var="examplaire" items="${listExamplaire}">
		                            <tr>
		                                <td>${examplaire.id}</td>
		                                <td>${examplaire.reference}</td>
		                                <td>${examplaire.emplacement}</td>
		                                <td>${examplaire.disponibilite}</td>
		                                <td>
		                                    <c:choose>
										        <c:when test="${examplaire.disponibilite eq 'non-disponible'}">
										            <span class="text-danger">Book available: ${examplaire.dateR}</span>
										        </c:when>
										        <c:otherwise>
										            <button type="button" class="btn btn-primary" onclick="addExamplaire(${examplaire.id}, '${examplaire.reference}', '${examplaire.emplacement}', '${examplaire.disponibilite}')">
										                Add Examplaire
										            </button>
										        </c:otherwise>
										    </c:choose>
		                                </td>
		                            </tr>
		                            
		                        </c:forEach>
		                    </tbody>
		                </table>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		            </div>
		        </div>
		    </div>
		</div> 	
	    <script>
		    // Function to add Examplaire to the table
		    function addExamplaire(id, reference, emplacement, disponibilite) {
		        var addedCodeOuvragesBody = document.getElementById('addedCodeOuvragesBody');
		        var errorMessage = document.getElementById('codeOuvrageErrorMessage');
		
		        // Check if the maximum limit (3) is reached
		        if (addedCodeOuvragesBody.childElementCount < 3) {
		            // Check if the examplaire already exists in the table
		            if (!examplaireExists(reference)) {
		                // Create a new row and cell
		                var row = addedCodeOuvragesBody.insertRow();
		                var cell = row.insertCell(0);
		
		                // Create a div to hold the examplaire details
		                var examplaireDiv = document.createElement('div');
		                examplaireDiv.className = 'mb-2';
		
		                // Set the innerHTML of the div with the examplaire details
		                examplaireDiv.innerHTML = reference;
		
		                // Append the examplaire div to the cell
		                cell.appendChild(examplaireDiv);
		                
		             	// Update the hidden input field value with the added ouvrage
		                updateAddedOuvragesInput(reference);
		
		                // Clear the error message
		                errorMessage.innerHTML = '';
		            } else {
		                // Display error message
		                errorMessage.innerHTML = 'Examplaire already exists in the table.';
		            }
		        }
		    }
		
		 	// Function to check if Examplaire already exists in the table
			function examplaireExists(examplaireId) {
			    var addedCodeOuvragesBody = document.getElementById('addedCodeOuvragesBody');
			    var rows = addedCodeOuvragesBody.getElementsByTagName('tr');
			
			    // Iterate through existing rows to check for existing examplaire
			    for (var i = 0; i < rows.length; i++) {
			        var cellValue = rows[i].getElementsByTagName('div')[0].innerHTML.trim();
					console.log("cell value: ", cellValue.slice(0, -1));
					console.log("Examplaire value: ", examplaireId.slice(0, -1));
			        // Check if all characters except the last one are the same
			        if (cellValue.length === examplaireId.length && cellValue.slice(0, -1) === examplaireId.slice(0, -1)) {
			            return true; // Examplaire already exists
			        }
			    }
			    
			
			    return false; // Examplaire does not exist
			}
		 	
			// Function to update the hidden input field value with added ouvrages
			function updateAddedOuvragesInput(reference) {
			    var addedOuvragesInput = document.getElementById('addedOuvrages');
			    var currentOuvrages = addedOuvragesInput.value;

			    // Append the reference to the existing list of ouvrages
			    addedOuvragesInput.value = currentOuvrages + reference + ",";
			}

			// Function to prepare added ouvrages before form submission
			function prepareAddedOuvrages() {
			    // Remove the trailing comma from the added ouvrages list
			    var addedOuvragesInput = document.getElementById('addedOuvrages');
			    addedOuvragesInput.value = addedOuvragesInput.value.slice(0, -1);
			}
		</script>
		<script src="js/main.js"></script>
</body>
</html>