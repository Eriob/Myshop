<?php
if(!isset($_SESSION)) {session_start();}
include('./Controller/Cgetprofile.php');
?>

<div class ="profile">
    <div class="container">
    <div class="row">
        <form class="form-horizontal" name="profile_update_form" method="POST" action="index.php?index=update_profile">
            
			
            <div class="form-group">
                <label for="email" class="control-label">Nouvelle adresse mail</label>
                <input type="email" name="new_email" id="new_email" class="form-control"/>
				<?php if($profile['email'] != NULL){echo "Votre adresse mail actuelle: ".$profile['email'];}?>
            </div>

            <div class="form-group">
                <label for="pseudo" class="control-label">Nouvelle adresse</label>
                <input type="text" name="new_address" id="new_address" class="form-control"/>
				<?php if($profile['address'] != NULL){echo "Votre adresse actuelle: ".$profile['address'];}?>
            </div>

            <div class="form-group">
                <label for="firstname" class="control-label">Nouveau code postal</label>
                <input type="text" name="new_zipcode" id="new_zipcode" class="form-control"/>
				<?php if($profile['zip_code'] != NULL){echo "Votre code postal actuel: ".$profile['zip_code'];}?>
            </div>
            
            <div class="form-group">
                <label for="password" class="control-label">Nouveau mot de passe</label>
                <div class="input-group">
                    <input type="password" name="new_password" id="new_password" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
              <label for="phone" class="control-label">Numéro de téléphone</label>
              <input class="form-control" type="tel" name="new_phone" id="new_phone" value="+33 "/>
			  <?php if($profile['phone'] != NULL){echo "Votre numéro de téléphone actuel: 0".$profile['phone'];}?>
            </div>

            <div class="form-group">
                <label for="password2" class="control-label">Confirmation du mot de passe*</label>
                <div class="input-group">
                    <input type="password" name="password" id="password" class="form-control" required="required"/>
                </div>
            </div>
			
			Les champs marqués d'un * sont obligatoires<br>
        
            <button type="submit" class="btn btn-primary pull-left">Valider</button>
            </form>
        </div>
    </div>
</div>
<div class="container marketing">
<br><br><br>
<hr class="featurette-divider">
</div>

