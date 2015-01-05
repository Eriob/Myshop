<div class ="subscribe-navtab">
    <h2> Inscription </h2>
        <br>
        <ul class="nav nav-tabs nav-justified">
          <li role="presentation" class="disabled"><a href="#">Etape 1 : Création utilisateur</a></li>
          <li role="presentation" class="disabled"><a href="#">Etape 2 : Création boutique</a></li>
          <li role="presentation" class="active"><a href="#">Etape 3 : Vos informations</a></li>
        </ul>
</div>

<div class ="subscribe">
    <div class="container">
    <div class="row">
        <form class="form-horizontal" name="register_form" method="POST">
            
            <div class="form-group">
                <label for="name" class="control-label">Nom de votre site :</label> 
                <input type="text" name="name" class="form-control" value="<?php echo $_POST['name']?>.myshop.itinet.fr" readonly>
            </div>
        
        <hr class="featurette-divider">

        <h3> Base de données </h3>
        <br>
            <div class="form-group">
                <label for="dbname" class="control-label">Nom de votre base de données</label>
                <input type="text" name="dbname" id="dbname" value="<?php echo $_POST['dbname']?>" class="form-control" readonly>
            </div>

            <div class="form-group">
                <label for="dbuser" class="control-label">Nom d'utilisateur</label>
                <input type="text" name="dbuser" id="dbuser" value="<?php echo $_POST['dbuser']?>" class="form-control" readonly>
            </div>
            
            <div class="form-group">
                <label for="dbpassword" class="control-label">Mot de passe</label>
                <div class="input-group">
                    <input type="password" name="dbpassword" id="dbpassword" value="<?php echo $_POST['dbpassword']?>" class="form-control" readonly>
                </div>
            </div>

            <div class="btn-group">
                <button type="button" action="index.php?index=subscribe_step2" class="btn btn-primary"  aria-expanded="false"> Modifier ces informations </button>
            </div>

            <hr class="featurette-divider">
        <h3> Prestashop (optionnel) </h3>
        <br>
            <h4> Vous pouvez installer prestashop sur votre page <?php echo $_POST['name']; ?>.myshop.itinet.fr<br>
            <a href="http://www.prestashop.com/fr/" TARGET=_BLANK><h4>Installer Prestashop</a><br></h4>

            <hr class="featurette-divider">

            <button type="submit" href="index.php?index=valid_subscribe" class="btn btn-primary pull-left">Valider</button>
            </form>
        </div>
        </div>
        </div>
        <div class="container marketing">
        <br><br><br><br>

        <hr class="featurette-divider">