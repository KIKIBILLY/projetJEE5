<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Profile client</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="./bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="./dist/css/skins/_all-skins.min.css">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="./bower_components/Ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="./bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="./dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="./dist/css/skins/_all-skins.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="jquery-3.3.1.min.js"></script>
  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

 

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
										<a href="#" class="btn btn-default btn-flat">Profil</a>
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

        <li class="active"><a href="profile.html"><i class="fa fa-circle-o"></i>Gestion des clients</a></li>
        <li><a href="login.html"><i class="fa fa-circle-o"></i> Gestion du stock</a></li>
        <li><a href="register.html"><i class="fa fa-circle-o"></i> Gestion du compte</a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
    
      <h1>
        Profil du client
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
            
            
            
            
              <img class="profile-user-img img-responsive img-circle" src="${ client.urlPhoto}" alt="User profile picture">

              <h3 class="profile-username text-center"><c:out value="${ client.nom} ${ client.prenom}"/></h3>

              <p class="text-muted text-center" > <c:out value="${ client.credential.email}" /></p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                
                
                
                  <b>Nombre de Réservations</b> <a class="pull-right"><c:out value="${ reservations.size()}" /></a>
                </li>
                <li class="list-group-item">
                  <b>Nombre de Locations</b> <a class="pull-right"><c:out value="${ locations.size()}" /></a>
                </li>
              </ul>
           
              
              
              
              
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">A Propos</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> Numero de telephone</strong>

              <p class="text-muted">
                <c:out value="${ client.numeroTel}" />
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> Adresse</strong>

              <p class="text-muted"><c:out value="${ client.adresseHabitation}" /></p>  
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
              <li class="active"><a href="#reservation" data-toggle="tab">Réservations</a></li>
              <li><a href="#location" data-toggle="tab">Locations</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="reservation">
                <form action="ClientControleur" method="POST">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Liste des objets reserves </h3>
            </div>
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Id Reservation</th>
                  <th>Categorie</th>
                  <th>Libelle </th>
                  <th>Prix location/J</th>
                  <th>Date de reservation</th>
                  <th>Date limite de reservation</th>
                  <th>Action</th>
                </tr>
                
                </thead>
                <tbody>
                
                <c:forEach items="${ reservations }" var="reservation">
                <tr> 
                  <td> <input name="check" value="${ reservation.idReservation}" class="minimal" type="checkbox">   <c:out value="   ${ reservation.idReservation}" /></td>
                  <td><c:out value="${ reservation.objet.categorie}" /></td>
                  <td><c:out value="${ reservation.objet.fp.libelle}" /></td>
                  <td><c:out value="${ reservation.objet.fp.pxlj}" /></td>
                  <td><c:out value="${ reservation.dateReservation}" /></td>
                  <td><c:out value="${ reservation.dateLimitReservation}" />
                   <td>
                  <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-share"></i></button>
                   <button type="button" data-id="${reservation.idReservation}" data-libelle="${reservation.objet.fp.libelle}" class="del add-to-cart-btn" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa fa-trash"></i></button>
                  
                  </td>
                </tr>
               	</c:forEach>
              
                </tbody>
                
              </table>
         

            </div>

            <div class="box-footer">
                <button type="submit" class="contrat btn btn-block btn-success" >Valider les réservations</button>
            </div>
          </div>
           </form>

              </div>








        <div class="tab-pane" id="location">

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Liste des objets loués </h3>
            </div>
            <div class="box-body">
              <table id="example2" class="table table-bordered table-striped">
                <thead>
                
                <tr>
                  <th>Id Location</th>
                  <th>Id Reservation</th>
                  <th>Date de location</th>
                  <th>Date limite de location</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                 <c:forEach items="${ locations }" var="location">
                <tr>
                  
                  <td> <c:out value="${ location.idLocation}" /></td>
                  <td><c:out value="${ location.reservation.idReservation}" /></td>
                  <td><c:out value="${ location.dateLocation}" /></td>
                  <td><c:out value="${ location.dateLimitLocation}" /></td>
                  
                  <td> 
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-money"></i></button>
                  </td>
                </tr>
               </c:forEach>
                </tbody>
                
              </table>
            </div>
            
            
            
            <div class="box-footer">
                <a href="ContratControleur?identifiant=${client.identifiant}"><button  class="contrat btn btn-block btn-warning" >Consulter Contrat</button></a>
            </div>
            <!-- /.box-body -->
          </div>
 
              </div>



              </div>
              
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
        <h5 > La suppression est irréversible</h5>
        <h5 > Etes vous sure de bien vouloir supprimer la reservation suivante :</h5>
         <div><p>Identifiant de la reservation: </p><p id="IdObj"></p> </div>
       <div> <p>Libelle : </p><p id="LbObj"> </p></div>
       
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        <button type="button" class="confirmation btn btn-danger">Confirmer</button>
      </div>
    </div>
  </div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edition de la fiche produit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div >
              <img src="https://dyw7ncnq1en5l.cloudfront.net/news/46/46551/tesla-model-s-web.jpg" height="200" width="550" >
      </div> 
      <hr>
      <form>

      
    
    
  <div class="form-row">
  <div class="form-group col-md-6">
      <label for="inputEmail4">Identifiant</label>
      <input type="email" class="form-control" id="inputEmail4" placeholder="" disabled="true">
    </div>
    <div class="form-group col-md-6">
      <label for="inputEmail4">Désignation</label>
      <input type="email" class="form-control" id="inputEmail4" placeholder="Libellé court" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Amende</label>
      <input type="password" class="form-control" id="inputPassword4" placeholder="Amende de dépassement">
    </div>
  </div>
  <div class="">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Prix/jr</label>
      <input type="email" class="form-control" id="inputEmail4" placeholder="Prix de location par jour" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Caution</label>
      <input type="password" class="form-control" id="inputPassword4" placeholder="Caution de garantie">
    </div>
  </div>
  <br>
  <div class="form-group" >
    
    <textarea class="form-control" rows="3" placeholder="Description et défauts"></textarea>
  </div>
  
  <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
  <button type="submit" class="btn btn-primary">Sauvegarder</button>
</form>
</div>
      
    </div>
  </div>
</div>



<!-- jQuery 3 -->
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="./bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="./bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="./dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="./dist/js/demo.js"></script>

<script type="text/javascript">
$(document).on("click", ".del", function () {
     $("#LbObj").text($(this).data('libelle'));
     $("#IdObj").text($(this).data('id'));
     
     
});

$(document).on("click", ".confirmation", function () {
	var idReservation = $("#IdObj").text();
	alert("ClientControleur?action=Supprimer&idReservation="+idReservation+"&identifiant="+  ${client.identifiant});
    document.location="ClientControleur?action=Supprimer&idReservation="+idReservation+"&identifiant="+ ${client.identifiant };
});


</script>
<!-- page script -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable()
  })
</script>



</body>
</html>
