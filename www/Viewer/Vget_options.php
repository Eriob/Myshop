
        <input type="hidden" name="name" value="<?php echo $options['name'];?>">

<p>
</p>
<br>

<form class="form-inline" method="POST" name="options_form" action="index.php?index=get_options">
    <div class="input-group">
        <input type="text" class="form-control" style="text-align:right" name="addmail" placeholder="Nouvelle adresse mail">
        <span class="input-group-addon">@<?php echo $_SESSION['name'].".myshop.itinet.fr";?></span> 
    </div>
    
    <div class="form-group">
    <br>
    <button type="submit" href="index.php?index=get_options" class="btn btn-primary pull-left">Valider</button>
</form>
    </div>
</div>
</div>

<div class="container marketing">
<br><br><br><br>

<hr class="featurette-divider">