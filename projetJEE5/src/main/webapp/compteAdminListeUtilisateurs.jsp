<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Gestion des utilisateurs</title>
<link href="img/rent.png" rel="icon">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).on("click", ".del", function () {
     $("#nomUser").text($(this).data('nom'));
     $("#idUser").text($(this).data('id'));
     $("#roleUser").text($(this).data('role'));
});

$(document).on("click", ".confirmation", function () {
	var id = $("#idUser").text();
	var role = $("#roleUser").text();
    document.location="Admin?action=Supprimer&id="+id+"&role="+role;
});

</script>
<script>  
var request=new XMLHttpRequest(); 

function searchInfo(){  
var name=document.vinform.name.value;  
var url="rechercheUtilisateur.jsp?val="+name;  
  
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

$(document).ready(function(){
	$("#ajouterEmploye").click(function() 
			{

				var request=new XMLHttpRequest(); 
				var url="chargerListePl.jsp?";  
				try{  
				request.onreadystatechange=function(){  
				if(request.readyState==4){  
				var val=request.responseText;  
				document.getElementById('optionPl').innerHTML=val;  
				}  
				}//end of function  
				request.open("GET",url,true);  
				request.send();  
				}catch(e){alert("Unable to connect to server");}  
				 

			}); 
  });


</script>
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
										<a href="ProfileAdmin" class="btn btn-default btn-flat">Profil</a>
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

        
					<li class="active"><a href="Admin"> <i class="fa fa-circle-o"></i> <span>Gestion
								des utilisateurs</span>

					</a></li>

					<li ><a href="ListePl"> <i class="fa fa-circle-o"></i>
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
			<!-- Content Header (Page header) -->
			<section class="content-header">
			  <div class="col-md-4 ">
               <form name="vinform">
                <div class="input-group">
                 <input type="text" name="name" onkeyup="searchInfo()" class="form-control" placeholder="Nom, Prénom, Email ...">
                </div>
                <div class="" id="resultatRech">
     	          <span id="mylocation"></span> 
   	   	        </div>
               </form>
              </div>
      
              <div class="col-md-3 ">
      	       <button type="button" class="btn btn-primary" id="ajouterEmploye" data-toggle="modal" data-target="#ajouterEmployé">
  		         Ajouter un employé
		       </button>
              </div>
			
			</section>
			<br>
			<br>
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
												<button type="button" class="del add-to-cart-btn" data-id="${e.identifiant}" data-nom="${e.nom}" data-role="employe" data-toggle="modal" data-target="#exampleModalCenter">
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
												<button type="button" class="del add-to-cart-btn" data-id="${a.identifiant}" data-nom="${a.nom}" data-role="admin" data-toggle="modal" data-target="#exampleModalCenter">
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
												<button type="button" class="del add-to-cart-btn" data-id="${c.identifiant}" data-nom="${c.nom}" data-role="client" data-toggle="modal" data-target="#exampleModalCenter">
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
	<script>
		$(function() {
			$('#example1').DataTable()
			$('#example2').DataTable()
			$('#example3').DataTable()
			
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
        <h5 > La suppression de l'utilisateur est irréversible</h5>
        <h5 > Etes vous sure de bien vouloir supprimer cet utilisateur ?</h5>
        <h5></h5>
        <p id="nomUser"><p>
        <p hidden id="idUser"><p>
        <p hidden id="roleUser"><p>
        
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
        <h5 class="modal-title" id="exampleModalLabel">Ajouter un employé</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" action="Admin" method="post">
                    
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
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Point de location</label>

                    <div class="col-sm-10">
                         
  						<span id="optionPl"></span>
					     		  	                 
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
                      <input type="submit" class="btn btn-primary" name="action" value="Ajouter">
                    </div>
                  </div>
                </form>
      </div>
     </div>
  </div>
</div>
</html>





