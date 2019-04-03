<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>Easy Rent</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
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
	<div id="top-header">
			<div class="container">
				<!-- Cart -->
				<c:if test="${!empty sessionScope.id_client}">
					<div class="dropdown">
						<a style="color: white;" class="dropdown-toggle"
							data-toggle="dropdown" aria-expanded="true"> <i
							class="fa fa-user-o"></i> <span>Mon compte</span>
						</a>
						<div class="cart-dropdown">
							<div class="cart-list">
								<div class="product-widget">
									<div class="product-img">
										<img src="${sessionScope.photo}" alt="">
									</div>
									<div class="product-body">
										<h3 class="product-name">
											<a href="#">${sessionScope.nom}</a>
										</h3>
										<h3 class="product-name">
											<a href="#">${sessionScope.prenom}</a>
										</h3>
									</div>
								</div>
								<div class="cart-btns">
									<a href="#">Profil</a> <a href="login">Deconnexion</a>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	<!-- /HEADER -->

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

						<c:forEach items="${reservation.objet.images}" var="image">
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


						<c:forEach items="${reservation.objet.images}" var="image">
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
					<h1 class="product-price">NUMERO RESERVATION : ${reservation.idReservation}</h1>
					<h2 class="product-name">
							Date Reservation :
							<c:out value="${ reservation.dateReservation}" />
						</h2>
						<h2 class="product-name">
							libelle :
							<c:out value="${ reservation.objet.fp.libelle}" />
						</h2>
						<h2 class="product-name">
							categorie :
							<c:out value="${reservation.objet.categorie}" />
						</h2>

						<h5 style="color: red;">
							PRIX DE LOCATION :
							<c:out value="${reservation.objet.fp.pxlj}" />
							Euros/JOUR
						</h5>
						<h5 style="color: red;">
							CAUTION DE LOCATION :
							<c:out value="${reservation.objet.fp.cl}" />
							Euros/JOUR
						</h5>
						<h5 style="color: red;">
							AMANDE DE DEPASSEMENT :
							<c:out value="${reservation.objet.fp.adj}" />
							Euros/JOUR
						</h5>
						<h2 class="product-name">Description du produit</h2>
						<p>
							<c:out value="${reservation.objet.fp.description}" />
							.
						</p>
						<h2 class="product-name">List des defauts connus</h2>
						<p>
							<c:out value="${reservation.objet.fp.defauts}" />
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
						<form action="reservation" method="POST">
						<input type="hidden" name="id_reservation" value="${reservation.idReservation}" />
						<input type="hidden" name="act" value="modifier" />
						<div class="add-to-cart">
							<div class="qty-label">
								Nombre jours :
								<div class="input-number">
									<input id="MyNumber" name="nbrJour" type="number" min="${pm.NDmL}" max="${pm.NDML}" value="${reservation.nbrJourReservation}">
									<span class="qty-up">+</span> <span class="qty-down">-</span>
								</div>
							</div>
									<button type="submit" class="add-to-cart-btn" >
									<i class="fa fa-edit"></i>Modifier
									</button>
						</div>
						</form>
						<div class="add-to-cart" style="margin-top:2%">
							<a href="reservation">
							<button  style="background-color:black;" class="add-to-cart-btn">
								<i class="fa fa-undo"></i>Annuler
							</button>
							</a>
							</div>
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

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
						<p>
							Inscriver vous pour recevoir nos <strong>OFFRES</strong>
						</p>
						<form>
							<input class="input" type="email"
								placeholder="Indiquer votre adresse mail">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> S'inscrire
							</button>
						</form>
						<ul class="newsletter-follow">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /NEWSLETTER -->

	<!-- FOOTER -->
	<footer id="footer">
		<!-- top footer -->
		<!-- /top footer -->

		<!-- bottom footer -->
		<div id="bottom-footer" class="section">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="footer-payments">
							<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
							<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
							<li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bottom footer -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script>$('input[type=checkbox]').change(function(){
	    var count = $('input[type=checkbox]:checked').length;
	    $('button').prop('disabled', count == 0);
	});</script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
