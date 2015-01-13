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
              <a class="navbar-brand" href="index.php">MySHOP</a>
              <div class="msg">
                    <?php if (isset($msg)) {
                      print("<h3>".$msg."</h3>");
                    }?>
              </div>
            </div>
            

            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav pull-right">
                <?php if(isset($_GET['index'])){
                        if($_GET['index'] == "websites") {
                          echo "<li><a href=\"index.php?index=index\">Accueil</a></li>";
                          echo "<li class=\"active\"><a href=\"index.php?index=websites\">Sites MySHOP</a></li>";
                          echo "<li><a href=\"index.php?index=contact\">Contact</a></li>";
                        }else if($_GET['index'] == "contact") {
                          echo "<li><a href=\"index.php?index=index\">Accueil</a></li>";
                          echo "<li><a href=\"index.php?index=websites\">Sites MySHOP</a></li>";
                          echo "<li class=\"active\"><a href=\"index.php?index=contact\">Contact</a></li>";
                        }else{
                          echo "<li class=\"active\"><a href=\"index.php?index=index\">Accueil</a></li>";
                          echo "<li><a href=\"index.php?index=websites\">Sites MySHOP</a></li>";
                          echo "<li><a href=\"index.php?index=contact\">Contact</a></li>";
                        }
                      }else{
                        echo "<li class=\"active\"><a href=\"index.php?index=index\">Accueil</a></li>";
                        echo "<li><a href=\"index.php?index=websites\">Sites MySHOP</a></li>";
                        echo "<li><a href=\"index.php?index=contact\">Contact</a></li>";
                      }
                ?>
                
                <li class="dropdown"> 
                    <a data-toggle="dropdown" href="#"><?php echo $_SESSION['pseudo'];?><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="index.php?index=myProfil">Mon Profil</a></li>
                      <li><a href="index.php?index=show_mywebsite" target="_blank">Mon Site</a></li>
                      <li><a href="index.php?index=get_informations">Mes informations</a></li>
                      <li><a href="index.php?index=myOptions">Mes options</a></li>
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
