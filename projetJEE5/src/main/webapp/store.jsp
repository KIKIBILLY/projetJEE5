<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
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
<link rel="stylesheet"
	href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="./bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="./bower_components/Ionicons/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="./bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="./dist/css/skins/_all-skins.min.css">


<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style2.css" />
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="jquery-3.3.1.min.js"></script>
<script>  
var request=new XMLHttpRequest(); 

function searchInfo(){  
var name=document.vinform.name.value;  
var url="rechercheEnStockClient.jsp?val=" + name;

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById('mylocation').innerHTML = val;
				}
			}//end of function  
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
</script>

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
									<a href="ProfileClient">Profil</a> <a href="login">Deconnexion</a>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-8">
						<div class="header-search">

							<div class="row">
								<div class="col-md-3">
									<form action="magasin" method="GET" name="monForm">
										<input style="width: 120%" type="hidden" name="act" value="rechercheParPL" /> <select
											class="input-select" id="pointLocation" name="pointLocation"
											onchange="this.form.submit()">
											<option value="Pl">Point Location</option>
											<option value="Tout">Tout</option>
											<c:forEach items="${pls}" var="pl">
												<option value="${pl.idPL}">${pl.libelle}</option>
											</c:forEach>
										</select>
									</form>
								</div>
								<div class="col-md-8">
									<form name="vinform">

										<input style="width:100%" type="text" name="name" onkeyup="searchInfo()"
											class="input" placeholder="libelle, description ...">
										<div class="" id="resultatRech">
											<span id="mylocation"></span>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<c:if test="${!empty sessionScope.id_client}">
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Wishlist -->
								<!-- /Wishlist -->

								<!-- Cart -->
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown"
										aria-expanded="true"> <i class="fa fa-shopping-cart"></i>
										<span>Reservations</span>
										<div class="qty">${nbReservation}/${pm.NMOR}</div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list">
											<c:forEach items="${reservations}" var="reservation">
												<div class="product-widget">
													<div class="product-img">
														<img src="${reservation.objet.images[0]}" alt="">
													</div>
													<div class="product-body">
														<h3 class="product-name">
															<a href="reservation">${reservation.objet.fp.libelle}</a>
														</h3>
														<h4 class="product-price">
															<span class="qty">Date Reservation :
																${reservation.dateReservation}</span>
														</h4>
													</div>
												</div>
											</c:forEach>
										</div>
										<div class="cart-summary">
											<small>Vous avez ${nbReservation}/${pm.NMOR}
												Reservations possibles</small>

										</div>
										<div>
											<a href="reservation">Acceder aux reservations</a>
										</div>
									</div>
								</div>
								<!-- /Cart -->
								<div class="dropdown">
									<a class="dropdown-toggle" data-toggle="dropdown"
										aria-expanded="true"> <i class="fa fa-shopping-basket"></i>
										<span>Locations</span>
										<div class="qty">${nbLocation}/${pm.NMOL}</div>
									</a>
									<div class="cart-dropdown">
										<div class="cart-list">
											<c:forEach items="${locations}" var="location">
												<div class="product-widget">
													<div class="product-img">
														<img src="${location.reservation.objet.images[0]}" alt="">
													</div>
													<div class="product-body">
														<h3 class="product-name">
															<a href="reservation">${location.reservation.objet.fp.libelle}</a>
														</h3>
														<h4 class="product-price">
															<span class="qty">Date Location :
																${location.dateLocation}</span>
														</h4>
														<h4 class="product-price">
															<span class="qty">Date Restitution :
																${location.dateLimitLocation}</span>
														</h4>
													</div>
												</div>
											</c:forEach>
										</div>
										<div class="cart-summary">
											<small>Vous avez ${nbLocation}/${pm.NMOL}
												Locations possibles</small>

										</div>
										
									</div>
								</div>
								<!-- /Cart -->

								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
					</c:if>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->

			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->

	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Categories</h3>
						<form action="magasin" method="GET">
							<input type="hidden" name="act" value="rechercheParCategorie" />
							<input onchange="this.form.submit()" type="radio"
								name="categorie" value="Tout"> Tout<br> <input
								onchange="this.form.submit()" type="radio" name="categorie"
								value="Vehicule"> Vehicule<br> <input
								onchange="this.form.submit()" type="radio" name="categorie"
								value="Immobilier"> Immobilier<br> <input
								onchange="this.form.submit()" type="radio" name="categorie"
								value="Electronique"> Electronique<br> <input
								onchange="this.form.submit()" type="radio" name="categorie"
								value="Electromenager"> Electromenager<br> <input
								onchange="this.form.submit()" type="radio" name="categorie"
								value="Meubles"> Meubles<br> <input
								onchange="this.form.submit()" type="radio" name="categorie"
								value="Loisirs"> Loisirs<br> <input
								onchange="this.form.submit()" type="radio" name="categorie"
								value="Materiaux"> Materiaux
						</form>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Interval PRIX</h3>
						<form action="magasin" method="GET">
							<input type="hidden" name="act" value="rechercheParPrix" />
							<div class="price-filter">
								<div id="price-slider"></div>
								<div class="input-number price-min">
									<input onchange="this.form.submit()" id="price-min" name="min"
										value="${prixMin}" type="number"> <span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
								<span>-</span>
								<div class="input-number price-max">
									<input onchange="this.form.submit()" id="price-max" name="max"
										value="${prixMax}" type="number"> <span class="qty-up">+</span>
									<span class="qty-down">-</span>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- /ASIDE -->

				<!-- STORE -->
				<div id="store" class="col-md-9">
					<!-- store top filter -->
					<!-- /store top filter -->

					<!-- store products -->
					<div class="row">
						<!-- product -->
						<c:forEach items="${ objets }" var="objet">
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="${objet.images[0]}" alt="">
									</div>
									<div class="product-body">
										<p class="product-category">${objet.categorie}</p>
										<h3 class="product-name">
											<a href="#">${objet.fp.libelle}</a>
										</h3>
										<h4 class="product-price">
											PRIX :
											<c:out value="${objet.fp.pxlj}" />
											Euros/JOUR
										</h4>
									</div>
									<div class="add-to-cart">
										<a href="objet?id=${objet.identifiant}">
											<button class="add-to-cart-btn">
												<i class="fa fa-shopping-cart"></i>Reserver
											</button>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- /product -->


						<!-- /product -->
					</div>
					<!-- /store products -->

					<!-- store bottom filter -->
					<!-- /store bottom filter -->
				</div>
				<!-- /STORE -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

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
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main2.js"></script>

</body>
</html>
<style>
#resultatRech {
	position: absolute;
	z-index: 1;
}
</style>