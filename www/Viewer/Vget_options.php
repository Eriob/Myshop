<input type="hidden" name="name" value="<?php echo $options['name'];?>">
<br>

<form class="form-horizontal" method="POST" name="options_form" action="index.php?index=get_options">
    <div class="form-group">
        <input type="text" class="form-control" style="text-align:right;margin-left:15px;" name="addmail" placeholder="Nouvelle adresse mail">
    </div>
    <?php echo "@".$_SESSION['name'].".myshop.itinet.fr";?>
    <br>
    <br>
    <button type="submit" href="index.php?index=get_options" class="btn btn-primary pull-left">Valider</button>
</form>
</div>
</div>
</div>

<div class="container marketing">
<br><br><br><br>

<hr class="featurette-divider">