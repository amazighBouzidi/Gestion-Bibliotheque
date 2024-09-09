<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Administrateur Page Management</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="allcomponents/allcss.jsp" %>
	<style>
        .card:hover {
            cursor: pointer;
            transform: scale(1.05);
            transition: transform 0.3s ease-in-out;
        }

        .card-container {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .card {
            width: 18rem;
            margin: 0 10px;
        }
    </style>
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
        <h2 class="mb-4 text-center">Acceuil  Administrateur</h2>
        <!-- Cards for displaying number of abonnées and bibliothécaires -->
        <div class="container-fluid">
        	<div class="row">
                <div class="col-md-4 col-sm-6 col-lg-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5 class="card-title">Nombre D'abonnées</h5>
                            <p class="card-text" style="font-size: 30px;">${numberAbonnee}</p>
                            <a href="<%=request.getContextPath()%>/listeAbonne" class="card-link">Voir La Liste</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-lg-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5 class="card-title">Nombre de Bibliothécaires</h5>
                            <p class="card-text" style="font-size: 30px;">${numberBibliothecaire}</p>
                            <a href="<%=request.getContextPath()%>/listeBibliothecaire" class="card-link">Voir La Liste</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 col-sm-6 col-lg-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5 class="card-title">Nombre de Pénalisations</h5>
                            <p class="card-text" style="font-size: 30px;">${numberPenalisation}</p>
                            <a href="<%=request.getContextPath()%>/listePenalisation" class="card-link">Voir La Liste</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 col-sm-6 col-lg-3">
                    <div class="card text-center">
                        <div class="card-body">
                            <h5 class="card-title">Nombre de Retardataire</h5>
                            <p class="card-text" style="font-size: 30px;">${numberRetard}</p>
                            <a href="<%=request.getContextPath()%>/AjouterPenalisation" class="card-link">Pénaliser ces Retardataire</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="margin-top: 20px;">
          <div class="container-fluid">
          </div>
        </nav>  
        
        <div  class="container-fluid">
        	<!-- Cards for adding Abonnée, Bibliothécaire, and Pénalisation -->
            <div class="card-container">
                <!-- Card for adding Abonnée -->
                <div class="card" onclick="location.href='<%=request.getContextPath()%>/AjouterAbonne'">
                    <div class="card-body">
                        <h5 class="card-title">Ajouter Abonnée</h5>
                        <p class="card-text">Click to add a new Abonnée.</p>
                    </div>
                </div>

                <!-- Card for adding Bibliothécaire -->
                <div class="card" onclick="location.href='<%=request.getContextPath()%>/AjouterBibliothecaire'">
                    <div class="card-body">
                        <h5 class="card-title">Ajouter Bibliothécaire</h5>
                        <p class="card-text">Click to add a new Bibliothécaire.</p>
                    </div>
                </div>

                <!-- Card for adding Pénalisation -->
                <div class="card" onclick="location.href='<%=request.getContextPath()%>/AjouterPenalisation'">
                    <div class="card-body">
                        <h5 class="card-title">Ajouter Pénalisation</h5>
                        <p class="card-text">Click to add a new Pénalisation.</p>
                    </div>
                </div>
            </div>
        </div>  
	 </div>

		<script src="js/main.js"></script>
</body>
</html>