
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MySHOP</title>

    <!-- Bootstrap core CSS -->
    <link href="/var/www/Myshop/www/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/var/www/Myshop/www/bootstrap/main.css" rel="stylesheet">
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
              <a class="navbar-brand" href="index.php?index=index">MySHOP</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav pull-right">
                <?php if($_GET['index'] == "websites") {
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
                ?>
                <li><a data-toggle="modal" data-target="#myModal">Connexion</a>
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span><span class="sr-only">Fermer</span></button>
                            <h4> Identifiez-vous</h4>
                          </div>

                          <div class="modal-body">
                            <form action="index.php?index=connect" method="POST">
                                <input type="text" name="pseudo" placeholder="Pseudo"><br>
                                <br>
                                <input type="password" name="password" placeholder="Password"><br>
                                <br>
                                <input type='submit' name="connect" value="Se connecter"/><br>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </li>
                </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>