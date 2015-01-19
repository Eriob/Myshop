<div class ="subscribe-navtab">
    <div class="subscribe-navtab-title">
    <h1> Inscription </h1>
</div>
        <br>
        <ul class="nav nav-tabs nav-justified">
          <li role="presentation" class="disabled"><a href="#">Etape 1 : Création de la boutique</a></li>
          <li role="presentation" class="disabled"><a href="#">Etape 2 : Vos informations</a></li>
          <li role="presentation" class="active"><a href="#">Etape 3 : Fin de l'inscription</a></li>
        </ul>
</div>

    <section class="para_large">
    <div class="container">
    <div class="row">
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="col-md-12 mt32 mb16">
        <h4> Votre site <?php echo $_POST['name'];?> a été créé.
        <h5> Vous allez reçevoir un mail à <?php echo $_POST['email'];?>
        <br> Vous pouvez dès à présent vous connecter sur votre espace via filezilla (par exemple) avec vos identifiants.
        <br> Votre site est disponible à l'adresse suivante : <a href="<?php echo "http://".$_POST['name'].".myshop.itinet.fr";?>" TARGET=_BLANK><?php echo $_POST['name'].".myshop.itinet.fr";?></a>
        </div>            
        
    <form class="form-horizontal" method="POST" action="index.php?index=valid_subscribe">
        <input type="hidden" name="name" value="<?echo $_POST['name'];?>">
        <input type="hidden" name="password" value="<?echo $_POST['password'];?>">
    <button type="submit" href="index.php?index=valid_subscribe" class="btn btn-primary pull-left">Se Connecter</button>
    </form>

        <hr class="featurette-divider">

        <div class="container marketing">
        <br><br><br><br>

        <hr class="featurette-divider">
        </div>
    </section>
    
    <hr class="featurette-divider">