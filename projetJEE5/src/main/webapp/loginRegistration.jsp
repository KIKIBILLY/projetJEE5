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
      <form class="form-login" action="registration" method="POST">
        <h2 class="form-login-heading">Enregistrement</h2>
        <div class="login-wrap">
          <input type="email" class="form-control" placeholder="Nom d'utilisateur" name="email" required="required" autofocus>
          <br>
          <input type="password" class="form-control" placeholder="Mot de passe" name="password" required="required">
          <br>
          <input type="password" class="form-control" placeholder="Confirmation" name="confPassword" required="required">
          <br>
          <input type="text" class="form-control" placeholder="Nom" name="nom" required="required">
          <br>
          <input type="text" class="form-control" placeholder="Prénom" name="prenom" required="required">
          <br>
          <br>
          <input type="text" class="form-control" placeholder="Adresse" name="adresse" required="required">
          <br>
          <input type="number" class="form-control" placeholder="Numero de telephone" name="numtel" >
          <br>
           <br>
          <input type="text" class="form-control" placeholder="Url de l'image" name="urlphoto" >
          <br>
           <hr>
          <button class="btn btn-theme btn-block" type="submit"> Valider</button>
          <button class="btn btn-danger btn-block" type="reset" name="Reset Form"> Annuler</button>
        </div>
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