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
      <div id="content" class="container">

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

        	<h2 class="text-center">Liste des Restitutions</h2>
        	<div class="container-fluid">
        		<!-- Search Field -->
		        <div class="mb-3">
		            <input type="text" id="searchInput" class="form-control" placeholder="Rechercher...">
		        </div>
		         <div class="table-responsive">
		            <table class="table table-bordered">
		                <thead class="thead-dark">
		                    <tr>
		                        <th>Id</th>
		                        <th>Daterestitution</th>
		                        <th>Matriculelecteur</th>
		                        <th>Codeexamplaire</th>  
		                    </tr>
		                </thead>
		                <tbody id="restitutionsTableBody">
		                   <c:forEach var="restitutions" items="${listRestitution}">
                            <tr>
						        <td>${restitutions.id}</td>
						        <td>${restitutions.daterestitution}</td>
						        <td>${restitutions.matriculelecteur}</td>
						        <td>${restitutions.codeexamplaire}</td>
    						</tr> 	
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
				<c:forEach var="restitutions" items="${listRestitution}" varStatus="loop">
					{
					    id: '${restitutions.id}',
					    daterestitution: '${restitutions.daterestitution}',
					    matriculelecteur: '${restitutions.matriculelecteur}',
					    codeexamplaire: '${restitutions.codeexamplaire}',
					    
					},
					
				</c:forEach>
            ];

            // Initialize the table with the original data
            updateTable(originalData);

            // Listen for changes in the search input
            $('#searchInput').on('input', function() {
                var searchText = $(this).val().toLowerCase();

                // Filter the original data based on the search text
                var filteredData = originalData.filter(function(restitutions) {
                    return (
                    		restitutions.id.toLowerCase().includes(searchText) ||
                    		restitutions.daterestitution.toLowerCase().includes(searchText) ||
                    		restitutions.matriculelecteur.toLowerCase().includes(searchText) ||
                    		restitutions.codeexamplaire.toLowerCase().includes(searchText) 
                        
                    );
                });

                // Update the table with the filtered data
                updateTable(filteredData);
            });

            // Function to update the table with new data
            function updateTable(data) {
                var tableBody = $('#restitutionsTableBody');
                tableBody.empty();

                // Append rows to the table based on the data
                data.forEach(function(restitutions) {
                    var row = '<tr>';
                    row += '<td>' + restitutions.id + '</td>';
                    row += '<td>' + restitutions.daterestitution + '</td>';
                    row += '<td>' + restitutions.matriculelecteur + '</td>';
                    row += '<td>' + restitutions.codeexamplaire + '</td>';
                    row += '</tr>';
                    tableBody.append(row);
                });
            }
        });
    </script>
		

    <script src="js/main.js"></script>
  </body>
</html>