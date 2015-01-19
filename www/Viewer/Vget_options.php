
        <input type="hidden" name="pseudo" value="<?php echo $options['name'];?>">

<script type="text/javascript">
    $(document).ready(function()
    {
        $('#addInput').click(function()
        {
            var c = $("#mail input:last").clone();
  
            var mail = $(c).attr('mail');
            value = mail.split('-');
            mail = value[0]+'-'+(parseInt(value[1])+1);
 
            $(c).attr('mail', mail);
            $("#mail").append(c);
        });
    });
</script>
<p>
<input type="submit" id="addInput" value="Ajouter un mail" onclick="plus()" />
<input type="submit" style="display:none" id="mail" value="Supprimer le dernier mail" onclick="moins()" />
</p>

        <br><br>
        <button type="submit" href="index.php?index=get_options" class="btn btn-primary pull-left">Valider</button>
        </form>
    </div>
    </div>
</div>

<div class="container marketing">
<br><br><br><br>

<hr class="featurette-divider">