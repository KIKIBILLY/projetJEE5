<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Paramètrage</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link href="img/rent.png" rel="icon">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$(document).on("click", ".del", function () {
     $("#libPl").text($(this).data('libelle'));
     $("#idPlP").text($(this).data('id'));
});

$(document).on("click", ".confirmation", function () {
	var idPl = $("#idPlP").text();
	alert("compteAdminListePl?action=Supprimer&idPl="+idPl);
    document.location="compteAdminListePl?action=Supprimer&idPl="+idPl;
});


</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a class="logo"> <span class="logo-lg"><b>Easy Rent</b></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">

						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="./dist/img/user2-160x160.jpg" class="user-image"
								alt="User Image"> <span class="hidden-xs">Arezki
									BOURIHANE</span>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
									src="./dist/img/user2-160x160.jpg" class="img-circle"
									alt="User Image">

									<p>Arezki -Administrateur-</li>
								<!-- Menu Body -->

								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="#" class="btn btn-default btn-flat">Profil</a>
									</div>
									<div class="pull-right">
										<a href="#" class="btn btn-default btn-flat">Se
											déconnecter</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->

					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="./dist/img/user2-160x160.jpg" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p>Alexander Pierce</p>
						<a href="#"><i class="fa fa-circle text-success"></i> En ligne</a>
					</div>
				</div>


				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">MENU</li>




					<li ><a href="Admin"> <i class="fa fa-circle-o"></i> <span>Gestion
								des utilisateurs</span>

					</a></li>

					<li ><a href="ListePl"> <i class="fa fa-circle-o"></i>
							<span>Gestion des Points de location</span>

					</a></li>
					
					<li class="active"><a href="Parametres"> <i class="fa fa-circle-o"></i>
							<span>Gestion des paramètres</span>

					</a></li>
					<li><a href="ProfileAdmin"> <i class="fa fa-circle-o"></i>
							<span>Gestion du compte</span>

					</a></li>
					

				</ul>

			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			
			
			<section class="content-header">
				<h1>Gestion des paramètres</h1>
			</section>

			<section class="content-header">
				<div class="box box-primary">
					<form action="Parametres" method="post" role="form">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">Durée maximum de location (NDML)</label> <input
									type="number" class="form-control" name="NDML" value="${NDML}"
									required="true">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Durée minimum de location (NDmL)</label> <input
									type="number" class="form-control" name="NDmL" value="${NDmL}"
									required="true">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Nombre maximum d’objets réservés (NMOR)</label> <input
									type="number" class="form-control" name="NMOR" value="${NMOR}"
									required="true">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Durée maximum de réservation (NDMR)</label> <input
									type="number" class="form-control" name="NDMR" value="${NDMR}"
									required="true">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Nombre maximum d’objets loués (NMOL)</label> <input
									type="number" class="form-control" name="NMOL" value="${NMOL}"
									required="true">
							</div>
						</div>
						<!-- /.box-body -->

						<div class="box-footer">
							<input type="submit" class="btn btn-primary" name="action" value="Modifier">
						</div>
					</form>
				</div>
			</section>
			

		</div>
        

		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	
	<!-- ./wrapper -->

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
	<!-- FastClick -->
	<script src="./bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="./dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./dist/js/demo.js"></script>
	<!-- page script -->
	<script>
		$(function() {
			$('#example1').DataTable()
			$('#example2').DataTable()
			$('#example3').DataTable()

		})c
	</script>
	
	
</body>
</html>
<!-- Button trigger modal -->