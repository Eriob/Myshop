<div class ="subscribe-navtab">
    <h2> Inscription </h2>
        <br>
        <ul class="nav nav-tabs nav-justified">
          <li role="presentation" class="disabled"><a href="#">Etape 1 : Création utilisateur</a></li>
          <li role="presentation" class="active"><a href="#">Etape 2 : Création boutique</a></li>
          <li role="presentation" class="disabled"><a href="#">Etape 3 : Vos informations</a></li>
        </ul>
</div>

<div class ="subscribe">
    <div class="container">
    <div class="row">
        <form class="form-horizontal" name="register_form" method="POST" action="index.php?index=subscribe_step2">
            
            <div class="form-group">
                <label for="name" class="control-label">Nom de votre site :</label> 
                <input type="text" name="name" class="form-control" value="<?php echo $_POST['name']?>" readonly>
            </div>
                <input type="hidden" name="pseudo" value="<?php echo $_POST['pseudo'];?>">
                <input type="hidden" name="password" value="<?php echo $_POST['password'];?>">
                <input type="hidden" name="email" value="<?php echo $_POST['email'];?>">

        <h3> Base de données </h3>
        <br>
            <div class="form-group">
                <label for="dbname" class="control-label">Nom de votre base de données</label>
                <input type="text" name="dbname" id="dbname" class="form-control" required="required"/>
            </div>

            <div class="form-group">
                <label for="dbuser" class="control-label">Nom d'utilisateur</label>
                <input type="text" name="dbuser" id="dbuser" class="form-control" required="required"/>
            </div>
            
            <div class="form-group">
                <label for="dbpassword" class="control-label">Mot de passe</label>
                <div class="input-group">
                    <input type="password" name="dbpassword" id="dbpassword" class="form-control" required="required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="dbpassword2" class="control-label">Confirmation du Mot de passse</label>
                <div class="input-group">
                    <input type="password" name="dbpassword2" id="dbpassword2" class="form-control" required="required"/>
                </div>
            </div>
            <button type="submit" href="index.php?index=subscribe_step2" class="btn btn-primary pull-left">Etape suivante</button>
            </form>
        </div>
        </div>
        </div>
        <div class="container marketing">
        <br><br><br><br>

        <hr class="featurette-divider">
        </div>