<input type="hidden" name="name" value="<?php echo $options['name'];?>">
<br>

<form class="form-inline" method="POST" name="options_form" action="index.php?index=get_options">
                  <div class="input-group">
                    <input type="text" class="form-control" style="text-align:right" name="name" placeholder="Nom de votre boutique">
                    <span class="input-group-addon"><?php echo "@".$_SESSION['name'].".myshop.itinet.fr";?></span> 
                  </div>
                  <div class="form-group">
                  <button type="submit" name="options_form" class="btn btn-primary pull-right">Essayer !</button>
</form>
</div>
</div>
</div>

<div class="container marketing">
<br><br><br><br>

<hr class="featurette-divider">