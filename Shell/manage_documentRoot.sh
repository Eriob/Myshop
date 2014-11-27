#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation des virtualshosts
# Role : Automatiser la creation de virtualhosts
#------------------------------------------------------------


function create_documentRoot() {

#On prendra en entrée :
#$1 : le nom du Document root de l'utilisateur 
	
	echo "STEP 1 : Création du répertoire /var/sftp/$1 en cours..."
	mkdir /var/sftp/$1
	echo "STEP 1 : Création [OK]"
	echo "STEP 2 : Création du virtualhost dans sites-available/$1 en cours..."
	echo "<VirtualHost *:80>
		ServerName $1.myshop.itinet.fr
		DocumentRoot /var/sftp/myshop/$1
		Errorlog /var/log/apache2/$1.myshop.itinet.fr-error_log
		CustomLog /var/log/apache2/$1.myshop.itinet.fr-access_log
		</VirtualHost>" > /etc/apache2/sites-available/$1
	echo "STEP 2 : Création [OK]"
	echo "STEP 3 : Création d'un lien symbolique vers sites-enabled en cours..."
	ln -s /etc/apache2/sites-available/$1 /etc/apache2/sites-enabled/
	echo "STEP 3 : Création [OK]"

}

function manage_documentRoot() {

#On prendra en entrée :
#Pour renommer son document Root
#$1 : l'action souhaité par l'utilisateur (1=rename,2=deactivate, 3=reactivate)
#$2 : l'ancien nom de document Root
#$3 : le nouveau nom de document Root

#Pour désactiver son site
#$2 : le nom du site a désactiver

#Pour réactiver son site
#$2 : le nom du site à réactiver

	if [[ $1 = 1 ]]; then
		# On renomme $2 en $3 ($2 = ancien nom / $3 = nouveau nom)
		echo "Renommage de /var/sftp/$2 en /var/sftp/$3 en cours..."
		mv /var/sftp/$2 /var/sftp/$3
		echo "Renommage [OK]"
		echo "Mise à jour du virtualhost dans sites-available/$3 en cours..."
		rm /etc/apache2/sites-available/$2
		echo "<VirtualHost *:80>
		ServerName $3.myshop.itinet.fr
		DocumentRoot /var/sftp/myshop/$3
		Errorlog /var/log/apache2/$3.myshop.itinet.fr-error_log
		CustomLog /var/log/apache2/$3.myshop.itinet.fr-access_log
		</VirtualHost>" > /etc/apache2/sites-available/$3
		rm /etc/apache2/sites-enabled/$2
		ln -s /etc/apache2/sites-available/$3 /etc/apache2/sites-enabled/
	echo "Mise à jour VirtualHost [OK]"
	elif [[ $1 = 2 ]]; then
		# On desactive le site $2 ($2 = nom du repertoire)
		echo "Suppression du lien symbolique de sites-available/$2 en cours..."
		unlink /etc/apache2/sites-available/$2
		echo "Suppression [OK]"
	elif [[ $1 = 3 ]]; then
		# On réactive le site
		echo "Réactivation du lien symbolique de /sites-available/$2 en cours..."
		ln -s /etc/apache2/sites-available/$2 /etc/apache2/sites-enabled/
		echo "Réactivation [OK]"
	else
		echo "Cette action n'est pas possible, veuillez checker votre script :)"
	fi
	
}