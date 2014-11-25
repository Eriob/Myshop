        <div class="jumbotron">
            <h1>Inscrivez vous</h1>

            <p class="lead">Inscription gratuite, E-Shop vous propose de créer votre boutique en ligne très facilement en quelques minutes</p>
        </div>
        <hr>
        <div class="row-fluid marketing">
        <div class="span6">
            <p class="lead">Vos informations personnelles</p>
        <form method="POST" action='index.php?index=subscribe'>
        <label>Nom :</label> <input type='text' name='nom' id='nom' value=""/><br>
        <label>Prenom </label> <input type='text' name='prenom' value=""/><br>
        <label>Pseudo </label> <input type='text' name='pseudo' value=""/><br>
        <label>Password </label> <input type='password' name='password' value=""/><br>
        <label>Password Confirmation </label> <input type='password' name='password2' value=""/><br>
        <label>Mail </label><input type='email' name='mail' value=""/><br>
        <labeL>Date de naissance </label><input type='date' name='dateBirth' value=""/><br>
        </div>
        <div class="span6">
        <br><br><br>
        <label>Adresse </label><input type='text' name='address' value=""/><br>
        <label>Ville </label><input type='text' name='city' value=""/><br>
        <label>Code Postal </label><input type='number' name='postalCode' value=""/><br>
        <label>Question de sécurité </label><input type='text' name='question' value=""/><br>
        <label>Réponse </label><input type='text' name='answer' value=""/><br>
        <label>Télephone </label><input type='tel' name='telephone' value=""/><br>
        </div>
        </div>
        <hr>
        <div class="row-fluid marketing">
        <div class="span6">
            <p class="lead"> Informations sur votre boutique</p>
        <input type="text" name="domain" placeholder="Votre nom de domaine"> .eshop.fr<br>
        <select name="categorie">
            <option value="" selected>theme du site</option>
            <option value="informatique">informatique</option>
            <option value="commercial">commercial</option>
            <option value="cuisine">cuisine</option>
            <option value="musique">musique</option>
            <option value="réseau social">réseau social</option>
            <option value="blog">blog</option>
            <option value="vidéos">vidéos</option>
            <option value="divers">divers</option>
            <option value="autres">autres</option>
        </select><br>
        <input type='submit' name="subscribe" value="S'inscrire"/><br>
        </form>
        </div>
        </div>
        
        <hr>
        <div class="footer">
            <p>&copy; IN'TECH INFO 2014 | design by <strong>Alababa</strong></p>
        </div>
    </div>
    <!-- /container -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
    </script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src='main.js'></script>
</body>

</html>