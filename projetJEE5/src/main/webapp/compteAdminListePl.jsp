<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Points de location</title>
<link href="img/rent.png" rel="icon">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
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


<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='custom.css' rel='stylesheet' type='text/css'>

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
    document.location="ListePl?action=Supprimer&idPl="+idPl;
});

</script>

<script>  
var request=new XMLHttpRequest(); 

function searchInfo(){  
var name=document.vinform.name.value;  
var url="rechercherPl.jsp?val="+name;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>
<script type="text/javascript">
$(function () {

    function initMap() {

        var location = new google.maps.LatLng(49.0333, 2.0667);

        var mapCanvas = document.getElementById('map');
        var mapOptions = {
            center: location,
            zoom: 16,
            panControl: false,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions);

        var markerImage = 'img/marker.png';

        var marker = new google.maps.Marker({
            position: location,
            map: map,
            icon: markerImage
        });

        var contentString = '<div class="info-window">' +
                '<h3>Point de Cergy</h3>' +
                '<div class="info-content">' +
                '<p>9 Le Square de echequier 95800 CERGY</p>' +
                '</div>' +
                '</div>';

        var infowindow = new google.maps.InfoWindow({
            content: contentString,
            maxWidth: 400
        });

        marker.addListener('click', function () {
            infowindow.open(map, marker);
        });


    }

    google.maps.event.addDomListener(window, 'load', initMap);
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
      <div class="user-panel">
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

        
					<li ><a href="Admin"> <i class="fa fa-circle-o"></i> <span>Gestion
								des utilisateurs</span>

					</a></li>

					<li class="active"><a href="ListePl"> <i class="fa fa-circle-o"></i>
							<span>Gestion des Points de location</span>

					</a></li>
					
					<li ><a href="Parametres"> <i class="fa fa-circle-o"></i>
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
			 
              <div class="col-md-3 ">
      	       <button type="button" class="btn btn-primary" id="ajouterEmploye" data-toggle="modal" data-target="#ajouterEmployé">
  		         Ajouter une agence
		       </button>
              </div>
			
			</section>
			<br>
			<br>
			
			<section class="content-header">
				<h1>Gestion des points de locations</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-8">

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
					
					<div class="box box-success col-xs-4">
					  <div style="height: 300px;"  id="map">
					  </div>
					</div>
					
					
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->

			


		</div>
		<footer class="main-footer">
    
   			 <strong>Copyright &copy; 2018-2019   Easy Rent.</strong> Tous droits réservés 
 		 </footer>


		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- page script -->
	
	
	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"></script>
        <script src="custom.js"></script>
	<script>
		$(function() {
			$('#example1').DataTable()
		});
	</script>
</body>
<style>
#resultatRech {
    
    position:absolute;
    z-index:1;
}
</style>
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
        <p hidden id="idPlP"><p>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
        <button type="button" class="confirmation btn btn-danger">Confirmer</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal editable -->
<div class="modal fade" id="ajouterEmployé" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ajouter un point de location</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="ListePl" method="post">
                    
                
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label" required="true">Libellé</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" name="libelle" placeholder="Libellé" required="true">
                    </div>
                  </div>
      
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Adresse</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" id="inputExperience" name="adresse" placeholder="Adresse" required="true"></textarea>
                    </div>
                  </div>
                
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <input type="submit" class="btn btn-primary" name="action" value="Ajouter">
                    </div>
               </div>
           </form>
      </div>
     </div>
  </div>
</div>
</html>
<!-- Button trigger modal -->

