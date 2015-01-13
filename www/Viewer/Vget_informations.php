<div class ="informations-navtab">
    <div class="informations-navtab-title">
        <h1> Mes informations </h1>
    </div>
    <br>
</div>

<div class ="informations">
    <div class="container">
    <div class="row">
        <form class="form-horizontal" name="register_form" method="POST" action="index.php?index=subscribe_step2">
            
            <div class="form-group">
                <label for="name" class="control-label">Nom de votre site :</label> 
                <input type="text" name="name" class="form-control" value="<?php echo $_POST['name']?>.myshop.itinet.fr" readonly>
            </div> 

            <div class="form-group">
                <label for="email" class="control-label">Adresse Email</label>
                <input type="email" name="email" class="form-control" value="<?php echo $_POST['email']?>" readonly>
            </div>

            <input type="hidden" name="pseudo" value="<?php echo $_POST['pseudo'];?>">
            <input type="hidden" name="password" value="<?php echo $_POST['password'];?>">
            <input type="hidden" name="email" value="<?php echo $_POST['email'];?>">

        <h3> Base de données </h3>
            <div class="form-group">
                <label for="name" class="control-label">Nom de votre base de données</label>
                <input type="text" name="name" id="name" value="<?php echo $_POST['name']?>" class="form-control" readonly>
            </div>

            <div class="form-group">
                <label for="pseudo" class="control-label">Nom d'utilisateur</label>
                <input type="text" name="pseudo" id="pseudo" value="<?php echo $_POST['pseudo']?>" class="form-control" readonly>
            </div>
            
            <div class="form-group">
                <label for="password" class="control-label">Mot de passe</label>
                <div class="input-group">
                    <input type="password" name="password" id="password" value="<?php echo $_POST['password']?>" class="form-control" readonly>
                </div>
            </div>
        <div class="subscribe-prestashop">
        <h3> Prestashop (optionnel) </h3>
            <h4> Vous pouvez installer prestashop sur votre page <?php echo $_POST['name']; ?>.myshop.itinet.fr<br>
            <a href="http://www.prestashop.com/fr/" TARGET=_BLANK><h4>Installer Prestashop</a><br></h4>
        </div>
        <br><br><br>
            <hr class="featurette-divider">

            <button type="submit" href="index.php?index=" class="btn btn-primary pull-left">Modifier des informations</button>
            </form>
        </div>
        </div>
        </div>
        <div class="container marketing">
        <br><br><br><br>

        <hr class="featurette-divider">
        </div>