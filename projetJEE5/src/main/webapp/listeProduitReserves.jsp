<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Fiche Produit</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link href="img/rent.png" rel="icon">
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style2.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
			    <button class="pull-left btn btn-warning btn-lg" ><a href="GestionStock">Revenir</a></button>
				
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->

		<!-- /MAIN HEADER -->
	</header>

	<!-- NAVIGATION -->

	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->

	<!-- /container -->
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- Product main img -->
				<div class="col-md-5 col-md-push-2">
					<div id="product-main-img">

						<c:forEach items="${objet.images}" var="image">
							<div class="product-preview">
								<img src="${image}" alt="">
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- /Product main img -->

				<!-- Product thumb imgs -->
				<div class="col-md-2  col-md-pull-5">
					<div id="product-imgs">


						<c:forEach items="${objet.images}" var="image">
							<div class="product-preview">
								<img src="${image}" alt="">
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- /Product thumb imgs -->

				<!-- Product details -->
				<div class="col-md-5">
					<div class="product-details">
						<h1 class="product-price">FICHE PRODUIT</h1>
						<h2 class="product-name">
							libelle :
							<c:out value="${ objet.fp.libelle}" />
						</h2>
						<h2 class="product-name">
							categorie :
							<c:out value="${objet.categorie}" />
						</h2>

						<h5 style="color: red;">
							PRIX DE LOCATION :
							<c:out value="${objet.fp.pxlj}" />
							Euros/JOUR
						</h5>
						<h5 style="color: red;">
							CAUTION DE LOCATION :
							<c:out value="${objet.fp.cl}" />
							Euros/JOUR
						</h5>
						<h5 style="color: red;">
							AMENDE DE DEPASSEMENT :
							<c:out value="${objet.fp.adj}" />
							Euros/JOUR
						</h5>
						<h2 class="product-name">Description du produit</h2>
						<p>
							<c:out value="${objet.fp.description}" />
							.
						</p>
						<h2 class="product-name">List des défauts connus</h2>
						<p>
							<c:out value="${objet.fp.defauts}" />
							.
						</p>
						<h2 class="product-name">point de location</h2>
						<h5>
							NOM :
							<c:out value="${pl.libelle}" />
						</h5>
						<h5>
							ADRESSE :
							<c:out value="${pl.adresse}" />
						</h5>
						<h2 class="product-name">Informations sur la réservation</h2>
						<h5>
							NOM DU CLIENT :
							<c:out value="${client.nom}" /> <c:out value="${client.prenom}" />
						</h5>
						<h5>
							ADRESSE :
							<c:out value="${client.adresseHabitation}" />
						</h5>
						<h5>
							ADRESSE EMAIL :
							<c:out value="${client.credential.email}" />
						</h5>
						<h5>
							TELEPHONE :
							<c:out value="${client.numeroTel}" />
						</h5>
						<h5>
						  
						    PARAMETRES :
							<span class="qty-up">NDmL : ${pm.NDmL}</span> <span class="qty-down">NDML : ${pm.NDML}</span>
						  
						</h5>
					</div>
				</div>
				<!-- /Product details -->

				<!-- Product tab -->

				<!-- /product tab -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- Section -->

	<!-- /Section -->

	<!-- FOOTER -->
	<footer id="footer">

	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
