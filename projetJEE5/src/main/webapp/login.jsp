<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Login</title>

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
 
</head>

<body>
  <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
  <div id="login-page">
    <div class="container">
      <form class="form-login" action="login" method="POST">
        <h2 class="form-login-heading">Connexion</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" placeholder="Email" name="email" required="required" autofocus>
          <br>
          <input type="password" class="form-control" placeholder="Mot de passe" name="password" required="required">
          <label class="checkbox">
            <input type="checkbox" value="remember-me"> Se souvenir de moi
            <span class="pull-right">
            <a data-toggle="modal" href="login.html#myModal"> Mot de passe oublié?</a>
            </span>
            </label>
          <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> Se connecter</button>
          <hr>
          <% if(request.getAttribute("msg") != null) { %>
   			 <p style="color: red">
   		     <%= request.getAttribute("msg") %>
   			 </p>
 		  <% } %>
          <div class="registration">
            Nouveau client?<br/>
            <a class="" href="loginRegistration.jsp">
              Creer un compte
              </a>
          </div>
        </div>
        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Mot de passe oublié?</h4>
              </div>
              <div class="modal-body">
                <p>Introduisez votre adresse email.</p>
                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
              </div>
              <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">Annuler</button>
                <button class="btn btn-theme" type="button">Valider</button>
              </div>
            </div>
          </div>
        </div>
        <!-- modal -->
      </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
  <script type="text/javascript" src="lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("img/login-bg.jpg", {
      speed: 500
    });
  </script>
</body>

</html>
