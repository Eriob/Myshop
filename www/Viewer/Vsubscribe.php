<div class ="subscribe-navtab">
    <div class="subscribe-navtab-title">
        <h1> Inscription </h1>
    </div>
        <br>
        <ul class="nav nav-tabs nav-justified">
          <li role="presentation" class="active"><a href="#">Etape 1 : Création de la boutique</a></li>
          <li role="presentation" class="disabled"><a href="#">Etape 2 : Vos informations</a></li>
          <li role="presentation" class="disabled"><a href="#">Etape 3 : Fin de l'inscription</a></li>
        </ul>
</div>

<div class ="subscribe">
    <div class="container">
    <div class="row">
        <form class="form-horizontal" name="register_form" method="POST" action="index.php?index=subscribe_step1">
            
            <div class="form-group">
                <label for="name" class="control-label">Nom de votre site :</label> 
                <input type="text" name="name" class="form-control" value="<?php echo $_POST['name']?>.myshop.itinet.fr" readonly>
            </div>

            <div class="form-group">
                <label for="pseudo" class="control-label">Votre pseudo</label>
                <input type="text" name="pseudo" id="pseudo" class="form-control" autofocus="autofocus" required="required"/>
            </div>

            <div class="form-group">
                <label for="email" class="control-label">Adresse Email</label>
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
                <label for="password" class="control-label">Mot de passe</label>
                <div class="input-group">
                    <input type="password" name="password" id="password" class="form-control" required="required"/>
                </div>
            </div>

            <div class="form-group">
                <label for="password2" class="control-label">Confirmation du mot de passe</label>
                <div class="input-group">
                    <input type="password" name="password2" id="password2" class="form-control" required="required"/>
                </div>
            </div>
        
            <div class="form-group">
              <label for="phone" class="control-label">Numéro de téléphone</label>
              <input class="form-control" type="tel" name="phone" id="phone" value="06"/>
            </div>

            <div name="primary_interest" class="form-group ">
              <label class="control-label" for="plan">Intérêt Premier</label>
              <select class="form-control" name="plan" id="plan">
                <option value="plan_to_use">Utilisé au sein de ma compagnie</option>
                <option value="plan_to_sell">Utilisé pour mon intérêt personnel</option>
                <option value="plan_to_test">Je suis un professeur ou un étudiant</option>
              </select>
            </div>

            <button type="submit" class="btn btn-primary pull-left">Etape suivante</button>
            </form>
        </div>
        </div>
        </div>
        <div class="container marketing">
        <br><br><br>
        <hr class="featurette-divider">
        </div>