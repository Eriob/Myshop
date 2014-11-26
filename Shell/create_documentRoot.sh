#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation des virtualshosts
# Role : Automatiser la creation de virtualhosts
#------------------------------------------------------------


function create_documentRoot() {

#On prendra en entrée :
#$1 : le nom du Document root de l'utilisateur 
	
	echo "STEP 1 : On crée le répertoire /var/sftp/$1"
	mkdir /var/sftp/$1
	echo "STEP 1 : Création [OK]"
	echo "STEP 2 : On crée le virtualhost associé dans /etc/apache2/sites-available/$1"
	echo "<VirtualHost *:80>
		ServerName $1.myshop.itinet.fr
		DocumentRoot /var/sftp/myshop/$1
		Errorlog /var/log/apache2/$1.myshop.itinet.fr-error_log
		CustomLog /var/log/apache2/$1.myshop.itinet.fr-access_log
	</VirtualHost>
	" > /etc/apache2/sites-available/$1
	echo "STEP 2 : Création [OK]"
	echo "STEP 3 : on crée un lien symbolique vers sites-enabled"
	ln -s /etc/apache2/sites-available/$1 /etc/apache2/sites-enabled/
	echo "STEP 3 : Création [OK]"

}

function manage_documentRoot() {

#On prendra en entrée :
#Pour renommer son document Root
#$1 : l'action souhaité par l'utilisateur (1=rename,2=deactivate)
#$2 : l'ancien nom de document Root
#$3 : le nouveau nom de document Root

#Pour supprimer son document Root
#$2 : le nom de document Root a supprimer

	if [[ $1 = 1 ]]; then
		# On renomme $2 en $3 ($2 = ancien nom / $3 = nouveau nom)
		echo "On renome $2 en $3"
		mv /var/sftp/$2 /var/sftp/$3
		echo "Renommage [OK]"
	elif [[ $1 = 2 ]]; then
		# On desactive le document root $2 ($2 = nom du repertoire)
		echo "On retire le lien symbolique de /etc/apache2/sites-available/$2"
		unlink /etc/apache2/sites-available/$2
		echo "Suppression [OK]"
	else
		echo "Cette action n'est pas possible, veuillez checker votre script :)"
	fi
	
}