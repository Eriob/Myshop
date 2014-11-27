<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <title>E-Shop - Accueil</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- TODO: make sure bootstrap.min.css points to BootTheme generated file
        -->
    <link href="./bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            padding-top: 20px;
            padding-bottom: 40px;
        }
        /* Custom container */
        .container-narrow {
            margin: 0 auto;
            max-width: 700px;
        }
        .container-narrow > hr {
            margin: 30px 0;
        }
        /* Main marketing message and sign up button */
        .jumbotron {
            margin: 60px 0;
            text-align: center;
        }
        .jumbotron h1 {
            font-size: 72px;
            line-height: 1;
        }
        .jumbotron .btn {
            font-size: 21px;
            padding: 14px 24px;
        }
        /* Supporting marketing content */
        .marketing {
            margin: 60px 0;
        }
        .marketing p + h4 {
            margin-top: 28px;
        }
    </style>
    <!-- TODO: make sure bootstrap-responsive.min.css points to BootTheme
        generated file -->
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
<link href='main.css' rel='stylesheet'>
</head>

<body>
    <div class="container-narrow">
        <div class="masthead">
            <ul class="nav nav-pills pull-right">
                <li>
                    <a href="index.php?index=index">Accueil</a>
                </li>
                <li>
                    <a href="index.php?index=contact">Contact</a>
                </li>
                <li>
                    <a href="index.php?index=searchWebsite">Sites E-Shop</a>
                </li>
                <li>
                    <!-- Button trigger modal -->
                    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                    Connexion
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fermer</span></button>
                            Identifiez-vous
                          </div>
                          <div class="modal-body">
                            <form action="index.php?index=connect" method="POST">
                                <input type="text" name="pseudo" placeholder="Pseudo"><br>
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
            <h3 class="muted"><a href="index.php?index=index">E-Shop</h3></a>

        </div>
        <hr>