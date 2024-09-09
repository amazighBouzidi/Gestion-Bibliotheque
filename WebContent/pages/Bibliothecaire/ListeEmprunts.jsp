<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
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
        
	       <div id="pdf-content" class="html_to_pdf">
	       	 	<h2 class="text-center">Listes Des Emprunts</h2>
		        <div class="container-fluid" style="margin-top: 20px;">
		        	<table class="table table-bordered">
			            <thead class="thead-dark">
			                <tr>
			                    <th>ID</th>
			                    <th>Date Emprunt</th>
			                    <th>Heure Emprunt</th>
			                    <th>Date Retour</th>
			                    <th>Prolonge</th>
			                    <th>Regler</th>
			                    <th>Matricule Lecteur</th>
			                    <th>Code Examplaire</th>
			                </tr>
			            </thead>
			            <tbody>
			                <!-- Iterate over the list of Emprunts and display each one -->
			                <c:forEach var="emprunt" items="${listEmprunt}">
			                    <tr>
			                        <td>${emprunt.idemprunt}</td>
			                        <td>${emprunt.dateemprunt}</td>
			                        <td>${emprunt.heureemprunt}</td>
			                        <td>${emprunt.dateretour}</td>
			                        <td>
			                        	<c:choose>
							                <c:when test="${emprunt.prolonge eq 'oui'}">
							                    ${emprunt.prolonge}
							                </c:when>
							                <c:otherwise>
							                    <c:set var="formatter" value='<%= new SimpleDateFormat("yyyy-MM-dd") %>' />
							                    <c:set var="dateretourDate" value="${formatter.parse(emprunt.dateretour)}" />
							                    <c:choose>
							                        <c:when test="${dateretourDate.time - now.time >= 2 * 7 * 24 * 60 * 60 * 1000}">
							                        	<form id="addEmpruntForm" class="row g-3 needs-validation" action="<%=request.getContextPath()%>/ProlongerEmprunt" method="post" novalidate>
							                        		<input type="hidden" value="${emprunt.dateretour}" name="dateretour" >
							                        		<input type="hidden" value="${emprunt.idemprunt}" name="idemprunt" >
							                            	<button type="submit" class="btn btn-primary" >Prolonger</button>
							                            </form>
							                        </c:when>
							                        <c:otherwise>
							                            Cant Prolong
							                        </c:otherwise>
							                    </c:choose>
							                </c:otherwise>
							            </c:choose>
									</td>
			                        <td>${emprunt.regler}</td>
			                        <td>${emprunt.matriculelecteur}</td>
			                        <td>${emprunt.codeexamplaire}</td>
			                    </tr>
			                </c:forEach>
			            </tbody>
			        </table>    
		        </div>
	       </div>
	        <button id="showNewEmpruntsBtn" onclick="HTMLTPDF()" class="btn btn-primary">Show New Emprunts</button> 
       </div>
      	<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Include jsPDF library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>

<!-- Include jsPDF plugin for converting HTML to PDF -->
<script src="https://rawgit.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>

<!-- Your existing HTML and CSS -->

<!-- Your script for generating PDF using jsPDF and the plugin -->
<script>
    function HTMLTPDF() {
        var element = document.getElementById("pdf-content");
        html2pdf(element);
    }
</script>

		<script src="js/main.js"></script>
</body>
</html>