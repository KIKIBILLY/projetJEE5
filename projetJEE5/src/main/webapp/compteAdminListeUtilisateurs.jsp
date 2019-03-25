<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Gestion des utilisateurs</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
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




					<li class="active"><a> <i class="fa fa-circle-o"></i> <span>Gestion
								des utilisateurs</span>

					</a></li>

					<li><a href="./compteAdminListePl"> <i class="fa fa-circle-o"></i>
							<span>Gestion des PL</span>

					</a></li>

				</ul>

			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Gestion des employés</h1>
			</section>
			
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">

						<div class="box">
							<div class="box-header">
								<h3 class="box-title"></h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Nom</th>
											<th>Prénom</th>
											<th>Email</th>
											<th>Téléphone</th>
											<th>Adresse</th>
											<th>Point de location</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${emps}" var="e">
										<tr>
											<td>${e.nom}</td>
											<td>${e.prenom}</td>
											<td>${e.credential.email}</td>
											<td>${e.numeroTel}</td>
											<td>${e.adresseHabitation}</td>
											<td>${e.pl.libelle}</td>
											<td>
												<button class="add-to-cart-btn" >
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" class="del add-to-cart-btn" data-id="${e.identifiant}" data-nom="${e.nom}" data-toggle="modal" data-target="#exampleModalCenter">
													<i class="fa fa-trash"></i><!-- a href="javascript:confirmation('${pl.idPL}')"></a-->
												</button>
											</td>
										</tr>
									 </c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
			
			<section class="content-header">
				<h1>Gestion des administrateurs</h1>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">

						<div class="box">
							<div class="box-header">
								<h3 class="box-title"></h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example2" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Nom</th>
											<th>Prénom</th>
											<th>Email</th>
											<th>Téléphone</th>
											<th>Adresse</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${admins}" var="a">
										<tr>
											<td>${a.nom}</td>
											<td>${a.prenom}</td>
											<td>${a.credential.email}</td>
											<td>${a.numeroTel}</td>
											<td>${a.adresseHabitation}</td>
											<td>
												<button class="add-to-cart-btn" >
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" class="del add-to-cart-btn" data-id="${a.identifiant}" data-nom="${a.nom}" data-toggle="modal" data-target="#exampleModalCenter">
													<i class="fa fa-trash"></i><!-- a href="javascript:confirmation('${pl.idPL}')"></a-->
												</button>
											</td>
										</tr>
									 </c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			
			<section class="content-header">
				<h1>Gestion des clients</h1>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">

						<div class="box">
							<div class="box-header">
								<h3 class="box-title"></h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example3" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Nom</th>
											<th>Prénom</th>
											<th>Email</th>
											<th>Téléphone</th>
											<th>Adresse</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${clients}" var="c">
										<tr>
											<td>${c.nom}</td>
											<td>${c.prenom}</td>
											<td>${c.credential.email}</td>
											<td>${c.numeroTel}</td>
											<td>${c.adresseHabitation}</td>
											<td>
												<button class="add-to-cart-btn" >
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" class="del add-to-cart-btn" data-id="${c.identifiant}" data-libelle="${c.nom}" data-toggle="modal" data-target="#exampleModalCenter">
													<i class="fa fa-trash"></i><!-- a href="javascript:confirmation('${pl.idPL}')"></a-->
												</button>
											</td>
										</tr>
									 </c:forEach>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
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
			
		})
	</script>
</body>
</html>
