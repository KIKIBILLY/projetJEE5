ect <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
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
<!--  script>
$(document).ready(function(){

	$("button").click(function(){
		$("#test3").val($(".btn3").attr("id"));
	  });
});
</script>

<script type="text/javascript">
	function confirmation(id){
        var conf= confirm("Etes vous sure de bien vouloir supprimer ce PL ??");
        if(conf==true){
           
            }
		}

$(document).ready(function(){
	 $("#confirmation").click(function(){
       
	     
	  });
	});
</script-->
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




					<li ><a href="./Admin"> <i class="fa fa-circle-o"></i> <span>Gestion
								des utilisateurs</span>

					</a></li>

					<li class="active" ><a > <i class="fa fa-circle-o"></i>
							<span>Gestion des PL</span>

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
					<form action="compteAdminListePl" method="post" role="form">
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
			
			<section class="content-header">
				<h1>Gestion des points de locations</h1>
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
											<th>Identifiant</th>
											<th>Libellé</th>
											<th>Adresse</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
									 <c:forEach items="${pls}" var="pl">
										<tr>
											<td>${pl.idPL}</td>
											<td>${pl.libelle}</td>
											<td>${pl.adresse}</td>
											<td>
												<button class="add-to-cart-btn" >
													<i class="fa fa-edit"></i>
												</button>
												<button type="button" class="del add-to-cart-btn" data-id="${pl.idPL}" data-libelle="${pl.libelle}" data-toggle="modal" data-target="#exampleModalCenter">
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

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="exampleModalLongTitle">Confirmation de suppression</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h5 > La suppression du point de vente est irréversible</h5>
        <h5 > Etes vous sure de bien vouloir supprimer ce point de location ?</h5>
        <h5></h5>
        <p id="libPl"><p>
        <p id="idPlP"><p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        <button type="button" class="confirmation btn btn-danger">Confirmer</button>
      </div>
    </div>
  </div>
</div>