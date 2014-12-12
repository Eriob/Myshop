<div class ="subscribe">
    <div class="container">
    <div class="row">
        <h2> Inscription </h2>
        <br>
        <form class="signup_form" role="form" method="POST">
            
            <div class="form-group name">
                <label for="name" class="control-label">Nom de votre site</label>
                <input type="text" name="name" id="name" class="form-control" value="<?php echo $_POST['name']?>.myshop.itinet.fr" required="required"/>
            </div>

            <div class="form-group login">
                <label for="login" class="control-label">Adresse Email</label>
                <input type="email" name="email" id="email" class="form-control" autofocus="autofocus" required="required"/>
            </div>

            <div class="form-group firstname">
                <label for="firstname" class="control-label">Prénom</label>
                <input type="text" name="firstname" id="firstname" class="form-control" required="required"/>
            </div>
            
            <div class="form-group lastname">
                <label for="lastname" class="control-label">Nom</label>
                <input type="text" name="lastname" id="lastname" class="form-control" required="required"/>
            </div>
            
            <div class="form-group password">
                <label for="password" class="control-label">Password</label>
                <div class="input-group">
                    <input type="password" name="password" id="password" class="form-control" required="required"/>
                </div>
            </div>

            <div class="form-group password2">
                <label for="password" class="control-label">Confirmation du Password</label>
                <div class="input-group">
                    <input type="password" name="password2" id="password2" class="form-control" required="required"/>
                </div>
            </div>
        
            <div class="form-group phone">
              <label for="phone" class="control-label">Numéro de téléphone</label>
              <input class="form-control" type="tel" name="phone" id="phone" value="+33 "/>
            </div>

            <div name="primary_interest" class="form-group ">
              <label class="control-label" for="plan">Intérêt Premier</label>
              <select class="form-control" name="plan" id="plan">
                <option value="plan_to_use">Utilisé au sein de ma compagnie</option>
                <option value="plan_to_sell">Utilisé pour mon intérêt personnel</option>
                <option value="plan_to_test">Je suis un professeur ou un étudiant</option>
              </select>
            </div>

            <button type="submit" class="btn btn-primary pull-left">Démarrer ma boutique en ligne</button>
            </form>
        </div>
        </div>
        </div>
        <br><br><br><br>