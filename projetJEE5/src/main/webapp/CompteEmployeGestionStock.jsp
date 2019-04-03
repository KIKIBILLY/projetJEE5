<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gestion Stock</title>
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

<script type="text/javascript">
$(document).on("click", ".editer", function () {
     $("#identifiant").val($(this).data('id'));
     $("#identifiantM").val($(this).data('id'));
     $("#libelle").val($(this).data('libelle'));
     $("#prix").val($(this).data('prix'));
     $("#caution").val($(this).data('caution'));
     $("#amende").val($(this).data('amende'));
     $("#desc").text($(this).data('desc'));
     $("#defaut").text($(this).data('defaut'));

     $("#img1").attr("src", $(this).data('img1'));
     $("#img2").attr("src", $(this).data('img2'));
     
});
</script>

<script>  
var request=new XMLHttpRequest(); 

function searchInfo(){  
var name=document.vinform.name.value;  
var url="rechercheEnStock.jsp?val="+name;  
  
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

        <li ><a href="ListeClient"><i class="fa fa-circle-o"></i>Gestion des clients</a></li>
        <li class="active"><a><i class="fa fa-circle-o"></i> Gestion du stock</a></li>
        <li><a href="ProfileEmploye"><i class="fa fa-circle-o"></i> Gestion du compte</a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Gestion du stock
      </h1>
      <br>
      <div class="col-md-4 ">
      <form name="vinform">
        <div class="input-group">
          <input type="text" name="name" onkeyup="searchInfo()" class="form-control" placeholder="Libellé, Catégorie ...">
              
        </div>
        <div class="" id="resultatRech">
     	      <span id="mylocation"></span> 
   	   	</div>
      </form>
      </div>
      
      <div class="col-md-3 ">
      	<button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#ajouterProduit">
  		Ajouter un objet
		</button>
      </div>
     </section>
     <hr>

                  
    
    	
    
   
    <section class="content">

      <!-- /.col -->
        <div class="col-md-12">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#reservation" data-toggle="tab">Réservés</a></li>
              <li><a href="#location" data-toggle="tab">Loués</a></li>
              <li><a href="#autre" data-toggle="tab">Autres</a></li>
            </ul>
            
            
            <div class="tab-content">
                
              <div class="active tab-pane" id="reservation">
                  <div class="container">  
                    <div class="row">
                    <c:forEach items="${reserves}" var="r">
                     <div class="product col-sm-4 col-md-2">
                      <div class="product-img">
                        <img src="${r.images[0]}" alt="">
                      </div>
                      <div class="product-body">
                        <p class="product-category">${r.categorie}</p>
                        <h3 class="product-name"><a href="#">${r.fp.libelle}</a></h3>
                        <h4 class="product-price">${r.fp.pxlj} Euros/jour</h4>
                        
                        <div class="product-btns">
                          <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Ajouter aux favoris</span></button>
                          <button class="visualiser quick-view" data-id="${r.identifiant}" ><i class="fa fa-eye"></i><span class="tooltipp">Fiche produit</span></button>
                        </div>
                      </div>
                     </div>
                    </c:forEach>
                   </div>
                  </div>
              </div>

              <div class="tab-pane" id="location">
                    <div class="row">
                    
                    <c:forEach items="${loues}" var="l">
                    <div class="product col-sm-4 col-md-2">
                      <div class="product-img">
                        <img src="${l.images[0]}" alt="">
                      </div>
                      <div class="product-body">
                        <p class="product-category">${l.categorie}</p>
                        <h3 class="product-name"><a href="#">${l.fp.libelle}</a></h3>
                        <h4 class="product-price">${l.fp.pxlj} Euros/jour</h4>
                        <div class="product-btns">
                          <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Ajouter aux favoris</span></button>
                          <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">Contrat</span></button>
                          <button class="visualiser quick-view" data-id="${l.identifiant}"><i class="fa fa-eye"></i><span class="tooltipp">Fiche produit</span></button>
                        </div>
                      </div>
                    </div> 
                    </c:forEach>
                    
                    </div>
                </div>


              <div class="tab-pane" id="autre">
                <div class="row">
                    
                   <c:forEach items="${autre}" var="a">
                    <div class="product col-sm-4 col-md-2">
                      <div class="product-img">
                        <img src="${a.images[0]}" alt="">
                        <div class="product-label">
                          <span class="new">NOUVEAU</span>
                        </div>
                      </div>
                      <div class="product-body">
                        <p class="product-category">${a.categorie}</p>
                        <h3 class="product-name"><a href="#">${a.fp.libelle}</a></h3>
                        <h4 class="product-price">${a.fp.pxlj} Euros/jour</h4>
                        
                      </div>
                      <div class="add-to-cart">
                        <button class="editer add-to-cart-btn" data-id="${a.identifiant}" data-libelle="${a.fp.libelle}" data-amende="${a.fp.adj}" data-prix="${a.fp.pxlj}" data-caution="${a.fp.cl}" data-desc="${a.fp.description}"  data-defaut="${a.fp.defauts}" data-img1="${a.images[0]}" data-img2="${a.images[1]}"  data-toggle="modal" data-target="#editerFicheProduit"><i class="fa fa-edit"></i> Editer </button>
                      </div>
                    </div>
                    </c:forEach>
                     
                    </div>
              </div>
              
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    
    <strong>Copyright &copy; 2018-2019   Easy Rent.</strong> Tous droits réservés 
  </footer>
</div>



<!-- ./wrapper -->

<!-- jQuery 3 -->
<script>
  // Material Select Initialization
$(document).ready(function() {
$('.mdb-select').materialSelect();
});
</script>

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

<style>
.modal.and.carousel {
  position: fixed; // Needed because the carousel overrides the position property
}
#resultatRech {
    
    position:absolute;
    z-index:1;
}
.img-responsive .centree {
 margin: 0 auto;
}
</style>

<!-- Modal -->
<div class="modal fade and carousel slide" id="editerFicheProduit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Editer la Fiche produit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">
        <div class="box">
          <ol class="carousel-indicators">
            <li data-target="#editerFicheProduit" data-slide-to="0" class="active"></li>
            <li data-target="#editerFicheProduit" data-slide-to="1"></li>
          </ol>
          <div class="carousel-inner">
            <div class="item active">
              <img id="img1" src="" alt="First slide"  class="img-responsive center-block" height="100" width="150">
            </div>
            <div class="item">
              <img id="img2" src="" alt="Second slide" class="img-responsive center-block" height="100" width="150">
            </div>
          </div><!-- /.carousel-inner -->
          <a class="left carousel-control" href="#editerFicheProduit" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#editerFicheProduit" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
        </div> 
       <form action="GestionStock" method="post">
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputEmail4">Identifiant</label>
            <input type="text" class="form-control" id="identifiant" placeholder="" disabled="true">
            <input hidden type="text" id="identifiantM" name="identifiantM" >
           
          </div>
        <div class="form-group col-md-6">
           <label for="inputEmail4">Désignation</label>
           <input type="text" class="form-control" id="libelle" name="libelleM" placeholder="Libellé court">
        </div>
        <div class="form-group col-md-6">
          <label for="inputPassword4">Amende</label>
          <input type="number" min="0" step="0.01" class="form-control" id="amende" name="amendeM" placeholder="Amende de dépassement">
        </div>
        </div>

        <div class="">
          <div class="form-group col-md-6">
          <label for="inputEmail4">Prix/jr</label>
          <input type="number" min="0" step="0.01" class="form-control" id="prix" name="prixM" placeholder="Prix de location par jour">
        </div>
        <div class="form-group col-md-6">
          <label for="inputPassword4">Caution</label>
          <input type="number" min="0" step="0.01" class="form-control" id="caution" name="cautionM" placeholder="Caution de garantie">
        </div>
      </div>
      
      <div class="form-group" >
         <textarea class="form-control" rows="3" id="desc" name="descM" placeholder="Description"></textarea>
      </div> 
      <div class="form-group" >
         <textarea class="form-control" rows="3" id="defaut" name="defautM" placeholder="Défauts"></textarea>
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
        <input type="submit" class="btn btn-primary" name="action" value="Editer">
      </div> 
      </form>
    </div>
    </div>
  </div>
</div>


<!-- Modal editable -->
<div class="modal fade and carousel slide" id="ajouterProduit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ajouter un produit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="modal-body">
        
        <form action="GestionStock" method="post">
        <div class="form-group">
		<div class="input-group input-file" name="Fichier1">
			<span class="input-group-btn">
        		<button class="btn btn-default btn-choose" type="button">Choisir</button>
    		</span>
    		<input type="text" class="form-control" name="url_image" placeholder='Choisissez une image ...'  required="true" />
    		<span class="input-group-btn">
       			 <button class="btn btn-warning btn-reset" type="button">Reset</button>
    		</span>
		</div>
	</div>
        <div class="form-row">
        <div class="form-group col-md-6">
           <label for="">Désignation</label>
           <input type="text" class="form-control" name="libelle" placeholder="Libellé court" required="true">
        </div>
       
        <div class="form-group col-md-6">
          <label for="">Amende</label>
          <input type="number" min="0" step="0.01" class="form-control" name="amende" placeholder="Amende de dépassement" required="true">
        </div>
        </div>

        <div class="">
          <div class="form-group col-md-6">
          <label for="">Prix/jr</label>
          <input type="number" min="0" step="0.01" class="form-control" name="prix" placeholder="Prix de location par jour" required="true">
        </div>
        <div class="form-group col-md-6">
          <label for="">Caution</label>
          <input type="number" min="0" step="0.01" class="form-control" name="caution" placeholder="Caution de garantie" required="true">
        </div>
      </div>
       <div class="form-group col-md-6">
           <label for="">Catégorie</label>
             
             <select name="categorie" class="selectpicker">
    			<option>Vehicule</option>
    			<option>Immobilier</option>
   				<option>Electronique</option>
   				<option>Electroménager</option>
   				<option>Meubles</option>
   				<option>Loisirs</option>
   				<option>Matériau</option>
			</select> 
        </div>
      <br>
      <div class="form-group" >
         <textarea class="form-control" rows="3" name="description" placeholder="Description"></textarea>
      </div>
      <br>
      <div class="form-group" >
         <textarea class="form-control" rows="3" name="defauts" placeholder="Défauts"></textarea>
      </div>   
    
    <div class="modal-footer">

        <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
		<input type="submit" class="btn btn-primary" name="action" value="Enregistrer">
						
    </div>
    </form>
    </div>
    </div>
  </div>
</div>





