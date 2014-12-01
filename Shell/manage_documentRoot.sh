#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation des virtualshosts
# Role : Automatiser la creation de virtualhosts
#------------------------------------------------------------


function create_documentRoot() {

#On prendra en entrée :
#$1 : le nom du Document root de l'utilisateur 
	

	if [[ -d "/var/sftp/$1" ]]; then
		echo "Répertoire /var/sftp/$1 déja crée [OK]"
	else
		echo "Création du répertoire /var/sftp/$1/www en cours..."
		mkdir /var/sftp/$1/
		mkdir /var/sftp/$1/www
		echo "Création [OK]"
		echo "Modification des droits sur le dossier utilisateur /var/sftp/$1"
		chown -R $1:sftp /var/sftp/$1
		echo "Modification des droits [OK]"
	fi
	
	if [[ -d "/etc/apache2/sites-available/$1" ]]; then
		echo "Virtualhost déjà crée [OK]"
	else
		echo "Création du virtualhost dans sites-available/$1 en cours..."
		echo "<VirtualHost *:80>
		ServerName $1.myshop.itinet.fr
		DocumentRoot /var/sftp/myshop/$1/www
		Errorlog /var/log/apache2/$1.myshop.itinet.fr-error_log
		CustomLog /var/log/apache2/$1.myshop.itinet.fr-access_log
		</VirtualHost>" > /etc/apache2/sites-available/$1
		echo "Création [OK]"
		echo "Création d'un lien symbolique vers sites-enabled en cours..."
		ln -s /etc/apache2/sites-available/$1 /etc/apache2/sites-enabled/
		echo "Création [OK]"
	fi

}

function manage_documentRoot() {

#On prendra en entrée :
#Pour renommer son document Root
#$1 : l'action souhaité par l'utilisateur (1=rename,2=deactivate, 3=reactivate)
#$2 : l'ancien nom de document Root
#$3 : le nouveau nom de document Root

#Pour désactiver son site
#$2 : le nom du site a désactiver

#Pour supprimer son site
#$2 : le nom du site a supprimer

#Pour réactiver son site
#$2 : le nom du site à réactiver

	if [[ $1 = 1 ]]; then
		if [[ -d "/var/sftp/$2" && -f "/etc/apache2/sites-available/$2" ]]; then
			# On renomme $2 en $3 ($2 = ancien nom / $3 = nouveau nom)
			echo "Renommage de /var/sftp/$2 en /var/sftp/$3 en cours..."
			mv /var/sftp/$2/ /var/sftp/$3
			echo "Renommage [OK]"
			echo "Mise à jour du virtualhost dans sites-available/$3 en cours..."
			rm /etc/apache2/sites-enabled/$2
			rm /etc/apache2/sites-available/$2
			echo "<VirtualHost *:80>
			ServerName $3.myshop.itinet.fr
			DocumentRoot /var/sftp/$3/www
			Errorlog /var/log/apache2/$3.myshop.itinet.fr-error_log
			CustomLog /var/log/apache2/$3.myshop.itinet.fr-access_log
			</VirtualHost>" > /etc/apache2/sites-available/$3
			ln -s /etc/apache2/sites-available/$3 /etc/apache2/sites-enabled/
			echo "Mise à jour VirtualHost [OK]"
		else
			echo "Impossible de renommer, cet utilisateur n'existe pas ! [ECHEC]"
		fi
	elif [[ $1 = 2 ]]; then
		if [[ -f "/etc/apache2/sites-enabled/$2" ]]; then
			# On desactive le site $2 ($2 = nom du repertoire)
			echo "Suppression du lien symbolique de sites-enabled/$2 en cours..."
			unlink /etc/apache2/sites-enabled/$2
			echo "Suppression [OK]"
		else
			echo "Impossible de désactiver, ce site n'existe pas ! [ECHEC]"
		fi
	elif [[ $1 = 3 ]]; then
		if [[ -d /var/sftp/$2 && -f "/etc/apache2/sites-enabled/$2" ]]; then
			# On supprime le site $2
			echo "Suppression de /var/sftp/$2/www en cours..."
			rm /var/sftp/$2/www
			echo "Suppression [OK]"
			echo "Suppression du lien symbolique de sites-enabled/$2 en cours..."
			unlink /etc/apache2/sites-enabled/$2
			echo "Suppression [OK]"
			echo "Suppression du virtualhost dans site-available"
			rm /etc/apache2/sites-available/$2
			echo "Suppression [OK]"
		else
			echo "Impossible de supprimer, cet utilisateur n'existe pas [ECHEC]"
		fi
	elif [[ $1 = 4 ]]; then
		if [[ -f "/etc/apache2/sites-available/$2" ]]; then
			# On réactive le site
			echo "Réactivation du lien symbolique de /sites-available/$2 en cours..."
			ln -s /etc/apache2/sites-available/$2 /etc/apache2/sites-enabled/
			echo "Réactivation [OK]"
		else
			echo "Impossible de réactiver, cet utilisateur n'existe pas [ECHEC]"
		fi
	else
		echo "Cette action n'est pas possible, veuillez checker votre script :)"
	fi
	
	echo "Redémarrage du service apache2 en cours..."
	/etc/init.d/apache2 restart
	echo "Redémarrage [OK]"
}