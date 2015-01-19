
        <input type="hidden" name="pseudo" value="<?php echo $options['name'];?>">

<script type="text/javascript">
var c,c2, ch;
 
// ajouter un champ avec son "mail" propre;
function plus(){
c=document.getElementById('cadre');
c2=c.getElementsByTagName('input');
ch=document.createElement('input');
 
ch.setAttribute('type','text');
ch.setAttribute('mail','ch'+c2.length);
c.appendChild(ch);
 
document.getElementById('mail').style.display='inline';
}
 
// supprimer le dernier champ;
function moins(){
if(c2.length>0){c.removeChild(c2[c2.length-1])};
if(c2.length==0){document.getElementById('mail').style.display='none'};
}
</script>

<div id="cadre" style="margin-left:100px;width:200px">
</div>
 
<p>
<input type="submit" value="Ajouter un mail" onclick="plus()" />
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