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
	 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jcomb.css">
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

        <h2 class="text-center">Liste des Abonnés</h2>
        <div class="container-fluid">
        <!-- Search Field -->
        <div class="mb-3">
            <input type="text" id="searchInput" class="form-control" placeholder="Rechercher...">
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Matricule</th>
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Adresse</th>
                        <th>Telephone</th>
                        <th>Faculte</th>
                        <th>Type</th>
                        <th>Somme Forfaitaire</th>
                        <th>Cotisation</th>
                        <th>Date Ajout</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="abonneeTableBody">
                    <c:forEach var="abonnee" items="${listAbonnee}">
                        <tr>
                            <td>${abonnee.matricule}</td>
                            <td>${abonnee.nom}</td>
                            <td>${abonnee.prenom}</td>
                            <td>${abonnee.adresse}</td>
                            <td>${abonnee.telephone}</td>
                            <td>${abonnee.faculte}</td>
                            <td>${abonnee.type}</td>
                            <td>${abonnee.sommeForfaitaire}</td>
                            <td>${abonnee.cotisation}</td>
                            <td>${abonnee.dateAjout}</td>
                            <td>
                                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateModal${abonnee.matricule}">
                                    Modifier
                                </button>
                                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal${abonnee.matricule}">
                                    Supprimer
                                </button>
                            </td>
                        </tr>
                        <!-- Update Modal -->
                        <div class="modal fade" id="updateModal${abonnee.matricule}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                             <div class="modal-dialog modal-lg" role="document">
						        <div class="modal-content">
						            <div class="modal-header">
						                <h5 class="modal-title" id="exampleModalLabel">Update Abonné</h5>
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">&times;</span>
						                </button>
						            </div>
						            <div class="modal-body">
						               <form class="row g-3 needs-validation" novalidate action="<%=request.getContextPath()%>/updateAbonne" method="post" id="updateForm-${abonnee.matricule}">
										    <div class="row">
										    	<!-- Hidden field for matriculeO -->
											    <input type="hidden" name="matriculeO" value="${abonnee.matricule}">
											
											    <!-- Visible field for matriculeN -->
											    <div class="col-md-12" style="margin-top: 25px">
											        <label for="validationCustomMatricule" class="form-label">Matricule</label>
											        <input type="text" class="form-control" id="validationCustomMatricule" name="matriculeN" value="${abonnee.matricule}" required>
											        <div class="invalid-feedback">
											            Veuillez fournir un matricule valide.
											        </div>
											    </div>
										    </div>
										
										    <!-- Nom and Prenom in one row -->
										    <div class="row">
										    	<div class="col-md-6" style="margin-top: 25px">
										        <label for="validationCustomNom" class="form-label">Nom</label>
										        <input type="text" class="form-control" id="validationCustomNom" name="nom" value="${abonnee.nom}" required>
										        <div class="invalid-feedback">
										            Veuillez fournir un nom valide.
										        </div>
										    </div>
										    <div class="col-md-6" style="margin-top: 25px">
										        <label for="validationCustomPrenom" class="form-label">Prenom</label>
										        <input type="text" class="form-control" id="validationCustomPrenom" name="prenom" value="${abonnee.prenom}" required>
										        <div class="invalid-feedback">
										            Veuillez fournir un prénom valide.
										        </div>
										    </div>
										    </div>
										
										    <div class="row">
										    	<!-- Adresse and Telephone in one row -->
											    <div class="col-md-6" style="margin-top: 25px">
											        <label for="validationCustomAdresse" class="form-label">Adresse</label>
											        <input type="text" class="form-control" id="validationCustomAdresse" name="adresse" value="${abonnee.adresse}" required>
											        <div class="invalid-feedback">
											            Veuillez fournir une adresse valide.
											        </div>
											    </div>
											    <div class="col-md-6" style="margin-top: 25px">
											        <label for="validationCustomTelephone" class="form-label">Telephone</label>
											        <input type="text" class="form-control" id="validationCustomTelephone" name="telephone" value="${abonnee.telephone}" required>
											        <div class="invalid-feedback">
											            Veuillez fournir un numéro de téléphone valide.
											        </div>
											    </div>
										    </div>
										
										    <div class="row">
										    	<!-- Faculte and Type in one row -->
											    <div class="col-md-6" style="margin-top: 25px">
											        <label for="validationCustomFaculte" class="form-label">Faculté</label>
											        <input type="text" class="form-control" id="validationCustomFaculte" name="faculte" value="${abonnee.faculte}" required>
											        <div class="invalid-feedback">
											            Veuillez fournir une faculté valide.
											        </div>
											    </div>
											    <div class="col-md-6" style="margin-top: 25px">
											        <label for="validationCustomType" class="form-label">Type</label>
											        <select class="form-select" id="validationCustomType" name="type" required>
											            <option value="Enseignant" ${abonnee.type.equals('Enseignant') ? 'selected' : ''}>Enseignant</option>
												        <option value="Etudiant Interne" ${abonnee.type.equals('Etudiant Interne') ? 'selected' : ''}>Etudiant Interne</option>
												        <option value="Etudiant Externe" ${abonnee.type.equals('Etudiant Externe') ? 'selected' : ''}>Etudiant Externe</option>
											        </select>
											        <div class="invalid-feedback">
											            Veuillez choisir un type.
											        </div>
											    </div>
										    </div>
										
										    <div class="row">
										    	<!-- Checkboxes for Cotisation and Somme Forfaitaire -->
												<div class="col-md-6" style="margin-top: 25px">
												    <div class="form-check" name="cotisation" id="cotisation${abonnee.matricule}">
												        <input class="form-check-input" type="checkbox" name="cotisation" id="cotisation${abonnee.matricule}" ${abonnee.cotisation.equals('oui') ? 'checked' : ''}>
												        <label class="form-check-label">Cotisation</label>
												    </div>
												    
												    <div class="form-check" name="sommeForfaitaire" id="sommeForfaitaire${abonnee.matricule}">
												        <input class="form-check-input" type="checkbox" name="sommeForfaitaire" id="sommeForfaitaire${abonnee.matricule}" ${abonnee.sommeForfaitaire.equals('oui') ? 'checked' : ''}>
												        <label class="form-check-label">Somme Forfaitaire</label>
												    </div>
												</div>
										    </div>
										
										    <div class="col-12" style="margin-top: 5%">
										        <button class="btn btn-primary col-12" type="submit">Modifier  Abonné </button>
										    </div>
										</form>   
						            </div>
						        </div>
						    </div>
                        </div>
                        <!-- End Update Modal -->

                        <!-- Delete Confirmation Modal -->
                        <div class="modal fade" id="deleteModal${abonnee.matricule}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                       		<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
								        <h5 class="modal-title" id="deleteModalLabel">Confirmation de Suppression</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								        	<span aria-hidden="true">&times;</span>
								   		</button>
								    </div>
								    <div class="modal-body">
								    	<p>Voulez-vous vraiment supprimer cette Abonné : ${abonnee.nom} ${abonnee.prenom}?</p>
								   	</div>
								   	<div class="modal-footer">
								   		<button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
								       	<!-- Add the link or form action to delete the bibliothecaire -->
								       	<a href="<%=request.getContextPath()%>/deleteAbonne?matricule=${abonnee.matricule}" class="btn btn-danger">Supprimer</a>
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
   
	<!-- Update Toast -->
	<div class="toast custom-toast update-toast" role="alert" aria-live="assertive" aria-atomic="true" style="color: white; background-color: green; width: 300px; position: fixed; top: 0; right: 0; margin: 10px; z-index: 1050;">
	    <!-- ... (existing code) ... -->
	</div>
	
	<!-- Delete Toast -->
	<div class="toast custom-toast delete-toast" role="alert" aria-live="assertive" aria-atomic="true" style="color: white; background-color: red; width: 300px; position: fixed; top: 0; right: 0; margin: 10px; z-index: 1050;">
	    <!-- ... (existing code) ... -->
	</div>
	
	<!-- Insert Success Toast -->
	<div class="toast custom-toast insert-toast" role="alert" aria-live="assertive" aria-atomic="true" style="width: 300px; position: fixed; top: 0; right: 0; margin: 10px; z-index: 1050;">
	    <!-- ... (existing code) ... -->
	</div>
	
	 <script>
	    jQuery(document).ready(function ($)  {
	        // Original table data
	        var originalData = [
	            <c:forEach var="abonnee" items="${listAbonnee}" varStatus="loop">
	                {
	                    matricule: '${abonnee.matricule}',
	                    nom: '${abonnee.nom}',
	                    prenom: '${abonnee.prenom}',
	                    adresse: '${abonnee.adresse}',
	                    telephone: '${abonnee.telephone}',
	                    faculte: '${abonnee.faculte}',
	                    type: '${abonnee.type}',
	                    sommeForfaitaire: '${abonnee.sommeForfaitaire}',
	                    cotisation: '${abonnee.cotisation}',
	                    dateAjout: '${abonnee.dateAjout}'
	                },
	            </c:forEach>
	        ];
	
	        // Initialize the table with the original data
	        updateTable(originalData);
	
	        // Listen for changes in the search input
	        $('#searchInput').on('input', function() {
	            var searchText = $(this).val().toLowerCase();
	            var filteredData = originalData.filter(function(abonnee) {
	                return (
	                    abonnee.matricule.toLowerCase().includes(searchText) ||
	                    abonnee.nom.toLowerCase().includes(searchText) ||
	                    abonnee.prenom.toLowerCase().includes(searchText) ||
	                    abonnee.adresse.toLowerCase().includes(searchText) ||
	                    abonnee.telephone.toLowerCase().includes(searchText) ||
	                    abonnee.faculte.toLowerCase().includes(searchText) ||
	                    abonnee.type.toLowerCase().includes(searchText) ||
	                    abonnee.sommeForfaitaire.toLowerCase().includes(searchText) ||
	                    abonnee.cotisation.toLowerCase().includes(searchText) ||
	                    abonnee.dateAjout.toLowerCase().includes(searchText)
	                );
	            });
	            updateTable(filteredData);
	        });
	
	        function updateTable(data) {
	            var tableBody = $('#abonneeTableBody');
	            tableBody.empty();
	            data.forEach(function(abonnee) {
	                var row = '<tr>';
	                row += '<td>' + abonnee.matricule + '</td>';
	                row += '<td>' + abonnee.nom + '</td>';
	                row += '<td>' + abonnee.prenom + '</td>';
	                row += '<td>' + abonnee.adresse + '</td>';
	                row += '<td>' + abonnee.telephone + '</td>';
	                row += '<td>' + abonnee.faculte + '</td>';
	                row += '<td>' + abonnee.type + '</td>';
	                row += '<td>' + abonnee.sommeForfaitaire + '</td>';
	                row += '<td>' + abonnee.cotisation + '</td>';
	                row += '<td>' + abonnee.dateAjout + '</td>';
	                row += '<td>';
	                row += '<button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateModal' + abonnee.matricule + '">Modifier</button>';
	                row += '<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal' + abonnee.matricule + '">Supprimer</button>';
	                row += '</td>';
	                row += '</tr>';
	                tableBody.append(row);
	            });
	        }
	    });
	</script>
	
	<!-- JavaScript to show the toasts -->
	<script>
	    $(document).ready(function() {
	        // Check if the URL contains an update success parameter
	        var updateParams = new URLSearchParams(window.location.search);
	        if (updateParams.has('updateSuccess') && updateParams.get('updateSuccess') === 'true') {
	            // Display the Bootstrap toast notification for update
	            var updateToast = $('.update-toast');
	            updateToast.toast('show');
	        }
	
	        // Check if the URL contains a delete success parameter
	        var deleteParams = new URLSearchParams(window.location.search);
	        if (deleteParams.has('deleteSuccess') && deleteParams.get('deleteSuccess') === 'true') {
	            // Display the Bootstrap toast notification for delete
	            var deleteToast = $('.delete-toast');
	            deleteToast.toast('show');
	        }
	
	        // Check if the URL contains an insert success parameter
	        var insertParams = new URLSearchParams(window.location.search);
	        if (insertParams.has('insertSuccess') && insertParams.get('insertSuccess') === 'true') {
	            // Display the Bootstrap toast notification for insert
	            var insertToast = $('.insert-toast');
	            insertToast.toast('show');
	        }
	    });
	</script>	
	<script>
	$(document).ready(function () {
	    // Hide checkboxes and labels initially
	    

	    // Update the selector to target elements with unique IDs
	    $('[id^=validationCustomType]').change(function () {
	        var selectedType = $(this).val();
	        var formId = $(this).closest('form').attr('id');

	        // Hide checkboxes and labels on every change
	        $('[id^=cotisation${formId}], [id^=sommeForfaitaire${formId}]').hide();

	        if (selectedType === 'Etudiant Interne') {
	            // Show sommeForfaitaire checkbox and label for Etudiant Interne
	            $('[id^=sommeForfaitaire${formId}]').show();
	        } else if (selectedType === 'Etudiant Externe') {
	            // Show cotisation checkbox and label for Etudiant Externe
	            $('[id^=cotisation${formId}]').show();
	        }
	    });

	 	// Handle checkbox values before form submission
        $('form').submit(function () {
            if ($('[name=sommeForfaitaire]:checked').length > 0) {
                $('[name=sommeForfaitaire]').val('true');
            } else {
                $('[name=sommeForfaitaire]').val('false');
            }
            
            if ($('[name=cotisation]:checked').length > 0) {
                $('[name=cotisation]').val('true');
            } else {
                $('[name=cotisation]').val('false');
            }
        });
	});

	</script>
    <script src="js/main.js"></script>
  </body>
</html>