<input type="hidden" name="name" value="<?php echo $options['name'];?>">
<br>

<form class="form-inline" method="POST" name="options_form" action="index.php?index=get_options">
                  <div class="input-group">
                    <input type="text" class="form-control" style="text-align:right" name="addmail" placeholder="Nouvelle adresse">
                    <span class="input-group-addon"><?php echo "@".$_SESSION['name'].".myshop.itinet.fr";?></span> 
                  </div>
                  <div class="input-group">
                    <input type="password" class="form-control" style="text-align:right" name="password" placeholder="Nouveau Mot de passe">
                  </div>
                  <div class="form-group">
                  <button type="submit" name="options_form" href="index.php?index=get_options" class="btn btn-primary pull-right">Créer</button>
</form>
</div>
</div>
</div>

<div class="container marketing">
<br><br><br><br>

<hr class="featurette-divider">