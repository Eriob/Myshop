<div class ="options-navtab">
    <div class="options-navtab-title">
        <h1> Options sur ma boutique </h1>
    </div>
    <br>
</div>

<div class ="options">
    <div class="container">
    <div class="row">
        <form class="form-horizontal" name="register_form" method="POST" action="index.php?index=subscribe_step2">
            <div class="form-group">
                <label for="name" class="control-label">Nom de votre site :</label> 
                <input type="text" name="name" class="form-control" value="<?php echo $options['shop']?>.myshop.itinet.fr" readonly>
            </div> 

        <?php
        if (isset($count)) {
            for ($i=0; $i < $count ; $i++) { 
            echo "<div class=\"form-group\">
                <label for=\"email\" class=\"control-label\">Adresse Email</label>
                <input type=\"email\" name=\"email\" class=\"form-control\" value=\"<?php echo $options['email']?>\" readonly>
                </div>";
            }        
        }
        ?>
        <input type="hidden" name="pseudo" value="<?php echo $options['pseudo'];?>">
        
        <br><br>
        
        <hr class="featurette-divider">
        <button type="submit" href="index.php?index=get_options" class="btn btn-primary pull-left">Ajouter des adresses mails</button>
        </form>
    </div>
    </div>
</div>

<div class="container marketing">
<br><br><br><br>

<hr class="featurette-divider">