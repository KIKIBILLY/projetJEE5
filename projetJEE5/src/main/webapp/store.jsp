<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
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
				<ul class="header-links pull-right">
					<li><a href="#"><i class="fa fa-user-o"></i> Mon compte</a></li>
				</ul>
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
							<form>
								<select class="input-select">
									<option value="0">Tout</option>
									<c:forEach items="${pls}" var="pl">
										<option value="${pl.idPL}">${pl.libelle}</option>
									</c:forEach>
								</select> <input class="input" placeholder="Search here">
								<button class="search-btn">Rechercher</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->
							<!-- /Wishlist -->

							<!-- Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Reservations</span>
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
														<a href="#">${reservation.objet.fp.libelle}</a>
													</h3>
													<h4 class="product-price">
														<span class="qty">Date Reservation :
															${reservation.dateReservation}</span>
													</h4>
												</div>
												<form action="magasin" method="POST">
													<button type="submit" value="${reservation.idReservation}"
														name="id_reservation" class="delete">
														<i class="fa fa-close"></i>
													</button>
												</form>
											</div>
										</c:forEach>
									</div>
									<div class="cart-summary">
										<small>Vous avez ${nbReservation}/${pm.NMOR} Reservations</small>
									</div>
								</div>
							</div>
							<!-- /Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="true"> <i class="fa fa-shopping-basket"></i>
									<span>Locations</span>
									<div class="qty">0</div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product01.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name">
													<a href="#">product name goes here</a>
												</h3>
												<h4 class="product-price">
													<span class="qty">1x</span>$980.00
												</h4>
											</div>
											<button class="delete">
												<i class="fa fa-close"></i>
											</button>
										</div>
									</div>

									<div class="cart-btns">
										<a href="#">View Cart</a> <a href="#">Checkout <i
											class="fa fa-arrow-circle-right"></i></a>
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
						<form action="">
							<input type="radio" name="gender" value="Tout"> Tout<br>
							<input type="radio" name="gender" value="Vehicule">
							Vehicule<br> <input type="radio" name="gender"
								value="Immobilier"> Immobilier<br> <input
								type="radio" name="gender" value="Electronique">
							Electronique<br> <input type="radio" name="gender"
								value="Electromenager"> Electromenager<br> <input
								type="radio" name="gender" value="Meubles"> Meubles<br>
							<input type="radio" name="gender" value="Loisirs">
							Loisirs<br> <input type="radio" name="gender"
								value="Loisirs"> Materiaux
						</form>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Interval PRIX</h3>
						<div class="price-filter">
							<div id="price-slider"></div>
							<div class="input-number price-min">
								<input id="price-min" type="number"> <span
									class="qty-up">+</span> <span class="qty-down">-</span>
							</div>
							<span>-</span>
							<div class="input-number price-max">
								<input id="price-max" type="number"> <span
									class="qty-up">+</span> <span class="qty-down">-</span>
							</div>
						</div>
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
										<p>
											<a href="#">${objet.fp.description}</a>
										</p>
										<h4 class="product-price">
											PRIX :
											<c:out value="${objet.fp.pxlj}" />
											Euros/JOUR
										</h4>
									</div>
									<div class="add-to-cart">
									<c:if test="${nbReservation < pm.NMOR }">
										<a href="objet?id=${objet.identifiant}">
											<button class="add-to-cart-btn">
												<i class="fa fa-shopping-cart"></i>Reserver
											</button>
										</a>
									</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- /product -->


						<!-- /product -->
					</div>
					<!-- /store products -->

					<!-- store bottom filter -->
					<div class="store-filter clearfix">
						<span class="store-qty">Showing 20-100 products</span>
						<ul class="store-pagination">
							<li class="active">1</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
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
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("select.input-select").change(
							function() {
								var selectedCountry = $(this).children(
										"option:selected").val();
			
							});
				});
	</script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main2.js"></script>

</body>
</html>
