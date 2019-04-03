<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Profile Employé</title>
  <link href="img/rent.png" rel="icon">
  
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style2.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="jquery-3.3.1.min.js"></script>

<script type="text/javascript">

$(document).on("click", ".visualiser", function () {
    document.location="objet?action=visualiser&id="+$(this).data('id');
});
</script>

<script type="text/javascript">

function confirmation(id) {
    document.location="objet?action=visualiser&id="+id;
}
</script>
</head>

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style2.css"/>

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
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

						<!-- variable de session -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <c:if
									test="${ !empty sessionScope.prenom && !empty sessionScope.nom }">
									<img src="${ sessionScope.photo }" class="user-image"
										alt="User Image">
									<span class="hidden-xs">${ sessionScope.nom } ${ sessionScope.prenom }
									</span>
								</c:if>
						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><c:if
										test="${ !empty sessionScope.prenom && !empty sessionScope.nom }">

										<img src="${ sessionScope.photo }" class="img-circle"
											alt="User Image">
										<p>${ sessionScope.nom } ${ sessionScope.prenom }
										<p>
									</c:if></li>
								<!-- Menu Body -->

								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="ProfileEmploye" class="btn btn-default btn-flat">Profil</a>
									</div>
									<div class="pull-right">
										<a href="login.jsp" class="btn  btn-default btn-flat">Se
											deconnecter</a>
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
      <<div class="user-panel">
					<c:if
						test="${ !empty sessionScope.prenom && !empty sessionScope.nom }">
						<div class="pull-left image">
							<img src="${ sessionScope.photo }" class="img-circle"
								alt="User Image">
						</div>
						<div class="pull-left info">


							<p>${ sessionScope.nom }  ${ sessionScope.prenom }</p>
							

						</div>
					</c:if>

				</div>
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU</li>

        <li ><a  href="ListeClient"><i class="fa fa-circle-o"></i>Gestion des clients</a></li>
        <li><a href="GestionStock"><i class="fa fa-circle-o"></i> Gestion du stock</a></li>
        <li class="active"><a><i class="fa fa-circle-o"></i> Gestion du compte</a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    
    <section class="content-header">
      <h1>
        Profil Utilisateur
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="${employe.urlPhoto}" alt="User profile picture">

              <h3 class="profile-username text-center">${employe.nom} ${employe.prenom} </h3>

              <p class="text-muted text-center">Employé</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                   <a class="pull-right">${employe.credential.email}</a>
                </li>
                <br>
                <li class="list-group-item">
                  <b>Téléphone</b> <a class="pull-right">${employe.numeroTel}</a>
                </li>
                
              </ul>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">A propos</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            
              <strong><i class="fa fa-map-marker margin-r-5"></i> Adresse</strong>

              <p class="text-muted">${employe.adresseHabitation}</p>

              <hr>
              
              <strong><i class="fa fa-file-text-o margin-r-5"></i> Point de location</strong>

              <p class="text-muted">
                ${employe.pl.libelle}
              </p>

              <hr>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#settings" data-toggle="tab">Paramètres</a></li>
            </ul>
            <div class="tab-content">
             

              <div class="active tab-pane" id="settings">
                <form class="form-horizontal" action="ProfileEmploye" method="post">
                    
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label" >Nom</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" name="nom" placeholder="Nom" required="true">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label" required="true">Prénom</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" name="prenom" placeholder="Prénom" required="true">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Email" required="true">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Mot de passe</label>

                    <div class="col-sm-10">
                      <input type="password" class="form-control" id="inputEmail" name="password" placeholder="Mot de passe" required="true">
                    </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Adresse</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" id="inputExperience" name="adresse" placeholder="Adresse" required="true"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Téléphone</label>

                    <div class="col-sm-10">
                      <input type="number" class="form-control" id="inputSkills" name="telephone" placeholder="Numéro de téléphone" required="true">
                    </div>
                  </div>
                  <hr>
                  <div class="form-group">
                      <label class="col-sm-2 control-label" for="exampleInputFile">Photo de profile</label>
                      <div class="col-sm-10">
                       <input class="" type="file" name="photo" id="exampleInputFile">
                      </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <input type="submit" class="btn btn-primary" name="action" value="Enregistrer">
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->

  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    
    <strong>Copyright &copy; 2018-2019   Easy Rent.</strong> Tous droits réservés 
  </footer>
</div>


<script>
  // Material Select Initialization
$(document).ready(function() {
$('.mdb-select').materialSelect();
});
</script>
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
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable()
  })

</script>
<script type="text/javascript">
function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
				element.attr("name",$(this).attr("name"));
				element.change(function(){
					element.next(element).find('input').val((element.val()).split('\\').pop());
				});
				$(this).find("button.btn-choose").click(function(){
					element.click();
				});
				$(this).find("button.btn-reset").click(function(){
					element.val(null);
					$(this).parents(".input-file").find('input').val('');
				});
				$(this).find('input').css("cursor","pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		}
	);
}
$(function() {
	bs_input_file();
});
</script>
</body>
</html>


