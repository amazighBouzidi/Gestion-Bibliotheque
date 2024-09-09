<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login Bibliothèque</title>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="allcomponents/allcss.jsp" %>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	 <div class="d-lg-flex half">
	    <div class="bg order-2" style="background-image: url('img/012.jpg'); background-size: cover; background-position: center; background-repeat: no-repeat;"></div>
	    <div class="contents order-1 order-md-1">
	        <div class="container">
	            <div class="row align-items-center justify-content-center">
	                <div class="col-md-7">
	                    <h3>Login to <strong>BookStore</strong></h3>
	                    <p class="mb-4">Explorez un monde de connaissances avec notre Bibliothèque Management.</p>
	                    <form action="<%=request.getContextPath()%>/checkLogin" method="post" class="needs-validation">
	                        <div class="form-group first">
	                            <label for="username">Nom D'utilisateur</label>
	                            <input type="text" class="form-control" placeholder="Votre Note D'utilisateur" id="username" name="username" required>
	                            <div class="invalid-feedback">
	                                Veuillez fournir un nom d'utilisateur.
	                            </div>
	                        </div>
	                        <div class="form-group last mb-3">
	                            <label for="password">Mot De Passe</label>
	                            <input type="password" class="form-control" placeholder="Votre Mot De Passe" id="password" name="password" required>
	                            <div class="invalid-feedback">
	                                Veuillez fournir un mot de passe.
	                            </div>
	                        </div>
	                        <c:if test="${not empty errorMessage}">
	                        	<p style="color: red;">${errorMessage}</p>
	                    	</c:if>
	                       <button class="btn btn-primary col-12" type="submit">Se Connecter </button>
	                    </form>  
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
		$(document).ready(function () {
	        // Fetch the form for adding a new abonne
	        const addLoginForm = $('form.needs-validation');
	
	        // Prevent submission and apply custom Bootstrap validation styles
	        addAbonneForm.on('submit', function (event) {
	            if (!addLoginForm[0].checkValidity()) {
	                event.preventDefault();
	                event.stopPropagation();
	            }
	
	            addLoginForm.addClass('was-validated');
	        });
	    });
	</script>
</body>
</html>