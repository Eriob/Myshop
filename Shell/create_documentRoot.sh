#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation des virtualshosts
# Role : Automatiser la creation de virtualhosts
#------------------------------------------------------------

#On prendra en entrée
#$1 : le nom de Document root de l'utilisateur


function create_documentRoot() {

#On prendra en entrée :
#$1 : le nom du Document root de l'utilisateur 
	
	cd /var/sftp/myshop
	$nom = $1

	mkdir $nom

}

function manage_documentRoot() {

#On prendra en entrée :
#Pour renommer son document Root
#$1 : l'action souhaité par l'utilisateur (1=rename,2=deactivate)
#$2 : l'ancien nom de document Root
#$3 : le nouveau nom de document Root

#Pour supprimer son document Root
#$2 : le nom de document Root a supprimer
	cd /var/sftp/myshop

	if [[ $1 = 1 ]]; then
		# On renomme $2 en $3 ($2 = ancien nom / $3 = nouveau nom)
		mv $2 $3
	elif [[ $1 = 2 ]]; then
		# On desactive le document root $2 ($2 = nom du repertoire)
		unlink /etc/apache2/sites-available/$2
	else
		echo "Cette action n'est pas possible"
	fi

}


function create_virtualhost() {

	cd /etc/apache2/

	echo "<VirtualHost *:80>
		ServerName $1.myshop.itinet.fr
		DocumentRoot /var/sftp/myshop/$1
		Errorlog /var/log/apache2/$1.myshop.itinet.fr-error_log
		CustomLog /var/log/apache2/$1.myshop.itinet.fr-access_log
	</VirtualHost>
	" > sites-available/$1

	ln -s sites-available/$1 sites-enabled/

}