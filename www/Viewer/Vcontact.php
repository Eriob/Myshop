<div class ="contact-navtab">
    <div class="contact-navtab-title">
        <h2> Contact </h2>
    </div>
        <br>
</div>

<div class ="contact">
    <div class="container">
    <div class="row">
        <form class="form-horizontal" name="register_form" method="POST" action="index.php?index=subscribe_step1">
            
            <div class="form-group">
                <label for="name" class="control-label">Votre Pseudo :</label> 
                <input type="text" name="name" class="form-control" value="<?php echo $_POST['pseudo']?>" readonly>
            </div>

            <div class="form-group">
                <label for="email" class="control-label">Votre Email</label>
                <input type="email" name="email" id="email" class="form-control" required="required"/>
            </div>

            <div class="form-group">
                <label for="firstname" class="control-label">Prénom</label>
                <input type="text" name="firstname" id="firstname" class="form-control" required="required"/>
            </div>
            
            <div class="form-group">
                <label for="lastname" class="control-label">Nom</label>
                <input type="text" name="lastname" id="lastname" class="form-control" required="required"/>
            </div>
            
            <div class="form-group">
                <label for="message" class="control-label">Votre message</label>
                <textarea name="message" id="message" class="form-control" required="required"/>
            </div>

            <button type="submit" class="btn btn-primary pull-left">Soumettre le message</button>
            </form>
        </div>
        </div>
        </div>
        <div class="container marketing">
        <br><br><br>
        <hr class="featurette-divider">
        </div>