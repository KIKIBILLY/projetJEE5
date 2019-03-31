<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Easy Rent| Contrat</title>
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

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body onload="window.print();">
<div class="wrapper">
  <!-- Main content -->
  <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <i class="fa fa-globe"></i> Easy Rent Inc.
          <small class="pull-right"><c:out value="${date}" /></small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
      <div class="col-sm-4 invoice-col">
        From
        <address>
          <strong>Easy Rent, Inc.</strong><br>
          9 Square de l'echiquier<br>
          Cergy 95800 FRANCE<br>
          Phone: (0033) 763-82920<br>
          Email: contrat@easyrent.fr
        </address>
      </div>
      <!-- /.col -->
      <div class="col-sm-4 invoice-col">
        To
        <address>
          <strong>${client.nom} ${client.prenom} </strong><br>       
           <c:out value="${client.adresseHabitation}" />  <br> 
          Phone: <c:out value="${client.numeroTel}" /> <br>
          Email:<c:out value="${client.credential.email}" /> 
          
        </address>
      </div>
      <!-- /.col -->
      
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
      <div class="col-xs-12 table-responsive">
        <table class="table table-striped">
          <thead>
     
          
          <tr>
            <th>Id Locatiion</th>
            <th>Produit</th>
            <th>Prix Caution</th>
            <th>Prix location/J</th>
            <th>Date location</th>
            <th>Date Limite location</th>
          </tr>
          </thead>
          
          <tbody>
     	<c:forEach items="${ locations }" var="location">
          
          <tr>
            <td><c:out value="${ location.idLocation}" /></td>
            <td><c:out value="${ location.reservation.objet.fp.libelle}" /></td>
            <td><c:out value="${ location.reservation.objet.fp.cl}" /></td>
            <td><c:out value="${ location.reservation.objet.fp.pxlj}" /></td>
            <td><c:out value="${ location.dateLocation}" /></td>
            <td><c:out value="${ location.dateLimitLocation}" /></td>
            
          </tr>
         
            </c:forEach >
          </tbody>
        
        </table>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
      <!-- accepted payments column -->
      <div class="col-xs-6">
        <p class="lead">Payment Methods:</p>
        <img src="./dist/img/credit/visa.png" alt="Visa">
        <img src="./dist/img/credit/mastercard.png" alt="Mastercard">
        <img src="./dist/img/credit/american-express.png" alt="American Express">
        <img src="./dist/img/credit/paypal2.png" alt="Paypal">

      </div>
      <!-- /.col -->
      <div class="col-xs-6">
        <p class="lead">Montant a payer</p>

        <div class="table-responsive">
          <table class="table">
            <tr>
              <th style="width:50%">total:</th>
              <td>?</td>
            </tr>
            
          </table>
        </div>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!-- ./wrapper -->
</body>
</html>
