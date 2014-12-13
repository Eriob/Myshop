<!DOCTYPE html>

<html lang="fr">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="etudiant, projet, e-commerce, hebergement">
    <meta name="author" content="IN'TECH INFO">

    <title>MySHOP</title>

    <!-- Bootstrap core CSS -->
    <link href="./bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./bootstrap/main.css" rel="stylesheet">
  </head>
<!-- NAVBAR
================================================== -->
  <body>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">MySHOP</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav pull-right">
                <li class="active"><a href="#">Accueil</a></li>
                <li><a href="#Sites MySHOP">Sites MySHOP</a></li>
                <li><a href="#contact">Contact</a></li>
                <li class="dropdown"> 
                    <a data-toggle="dropdown" href="#"><?php echo $_SESSION['pseudo'];?><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="index.php?index=myProfil">Mon Profil</a></li>
                      <li><a href="index.php?index=myWebsites">Mes Sites</a></li>
                      <li><a href="index.php?index=3">.3.</a></li>
                      <li><a href="index.php?index=4">.4.</a></li>
                      <li><a href="index.php?index=5">.5.</a></li>
                      <li class="divider"></li>
                      <li><a href="index.php?index=disconnect">Deconnexion</a></li>
                    </ul>
                </li>
                </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
