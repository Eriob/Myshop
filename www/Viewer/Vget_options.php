
        <input type="hidden" name="pseudo" value="<?php echo $options['name'];?>">

<p>
</p>
<br><br>
                    
        <div class="input-group">
            <label for="addmail" class="control-label">Ajouter une adresse mail : </label> 
            <input type="text" name="addmail" class="form-control" style="text-align:right" placeholder="Nouvelle adresse">
            <span class="input-group-addon">@<?php echo $_SESSION['name'].".myshop.itinet.fr";?></span> 
         </div>

        <button type="submit" href="index.php?index=get_options" class="btn btn-primary pull-left">Valider</button>
        </form>
    </div>
    </div>
</div>

<div class="container marketing">
<br><br><br><br>

<hr class="featurette-divider">