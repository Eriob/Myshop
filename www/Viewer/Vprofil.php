<?php
if(!isset($_SESSION)) {session_start();}
include('./Controller/Cgetprofile.php');
?>

<div class ="profile-navtab">
    <div class="profile-navtab-title">
        <h1> Mon profil </h1>
    </div>
        <br>
</div>

<div class="profile">
    <div class="container">
    <div class="row">
        <form class="form-horizontal" name="profile_update_form" method="POST" action="index.php?index=update_profile">
			
            <div class="form-group">
                <label for="email" class="control-label">Nouvelle adresse mail</label>
                <input type="email" name="new_email" id="new_email" class="form-control" placeholder="<?php if($profile['email'] != NULL){echo $profile['email'];}?>"/>
            </div>

            
            <div class="form-group">
                <label for="password" class="control-label">Nouveau mot de passe</label>
                <div class="input-group">
					<input type="password" name="new_password" id="new_password" class="form-control"/>
                </div>
            </div>
			
			<div class="form-group">
                <label for="password" class="control-label">Confirmation du nouveau mot de passe</label>
                <div class="input-group">
					<input type="password" name="new_pass_confirm" id="new_pass_confirm" class="form-control"/>
                </div>
            </div>
			
			

            <div class="form-group">
              <label for="phone" class="control-label">Num&eacute;ro de t&eacute;l&eacute;phone</label>
              <input class="form-control" type="tel" name="new_phone" id="new_phone" placeholder="<?php if($profile['phone'] != NULL){echo $profile['phone'];}?>"/>
            </div>

            <div class="form-group">
                <label for="password2" class="control-label">Confirmation du mot de passe actuel*</label>
                <div class="input-group">
                    <input type="password" name="password" id="password" class="form-control" required="required"/>
                </div>
            </div>
			
			Les champs marqu&eacute;s d'un * sont obligatoires<br>
        
            <button type="submit" class="btn btn-primary pull-left">Valider</button>
            </form>
        </div>
    </div>
    <br>
     <form class="form-horizontal" name="profile_delete" method="POST" action="index.php?index=delete_shop">
        <input type="hidden" name="name" value="<?php $_SESSION['name'];?>">
        <button type="submit" href="index.php?index=delete_shop" class="btn btn-danger pull-left">Supprimer mon compte</button>
    </form>
</div>
<div class="container marketing">
<br><br><br>
<hr class="featurette-divider">