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
<link rel="stylesheet"
	href="./bower_components/font-awesome/css/font-awesome.min.css">

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
			<div class="box">
				<div class="product-details">
					<div class="add-to-cart" style="margin-top: 2%">
						<a href="magasin">
							<button style="background-color: black;" class="add-to-cart-btn">
								<i class="fa fa-undo"></i>Boutique
							</button>
						</a>
					</div>
				</div>
				<div class="box-header">
					<h3 class="box-title"></h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>ID Reservation</th>
								<th>Nom de l'objet</th>
								<th>Date Reservation</th>
								<th>Duree Reservation</th>
								<th>Date limite recuperation</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reservations}" var="reservation">
								<tr>
									<td>${reservation.idReservation}</td>
									<td>${reservation.objet.fp.libelle}</td>
									<td>${reservation.dateReservation}</td>
									<td>${reservation.nbrJourReservation}</td>
									<td>${reservation.dateLimitReservation}</td>
									<td>

										<div>
											<button style="background-color: red; color: white; width: 35px;" type="button" 
												data-toggle="modal"
												data-target="#${reservation.idReservation}">
												<i class="fa fa-trash"></i>
											</button>
											<div class="modal fade" id="${reservation.idReservation}"
												tabindex="-1" role="dialog"
												aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered"
													role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h4 class="modal-title" id="exampleModalLongTitle">Confirmation
																de suppression</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<h5>La suppression de la reservation est
																irreverssible</h5>
															<h5>Etes vous sure de bien vouloir supprimer cette
																reservation ?</h5>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Annuler</button>
															<form action="reservation" method="GET">
																<input type="hidden" name="act" value="supprimer" /> <input
																	type="hidden" name="id_reservation"
																	value="${reservation.idReservation}" />
																<button type="submit"
																	class="confirmation btn btn-danger">Confirmer</button>
															</form>
														</div>
													</div>
												</div>
											</div>
											<a href="reservation?act=afficheReservation&id_reservation=${reservation.idReservation}">
											<button
												style="background-color: black; color: white; width: 35px;">
												<i class="fa fa-edit"></i>
											</button>
											</a>
										</div>
									</td>
								</tr>
							</c:forEach>
					</table>
				</div>
				<!-- /.box-body -->
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
	<script>
		$('input[type=checkbox]').change(function() {
			var count = $('input[type=checkbox]:checked').length;
			$('button').prop('disabled', count == 0);
		});
	</script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
	<!-- jQuery 3 -->
	<script src="./bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="./bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="./bower_components/fastclick/lib/fastclick.js"></script>
	<script src="./dist/js/adminlte.min.js"></script>
	<script src="./dist/js/demo.js"></script>
	<script>
		$(function() {
			$('#example1').DataTable()

		})
	</script>
</body>
</html>
