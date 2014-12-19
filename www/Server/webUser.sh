#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation de création des webUsers
# Role : Automatiser la creation des webUsers
#------------------------------------------------------------

function add_webUser {

# ROLE : CREER UN UTILISATEUR UNIX, SON REPERTOIRE PERSONNEL ET SON VIRTUALHOST

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : le mot de passe de l'utilisateur
#$3 : le nom de la boutique

if /bin/grep "^$1:" /etc/passwd ; then
	/bin/echo "Cet utilisateur UNIX existe déjà ! [ECHEC]"
else
	/bin/echo "Création du nouvel utilisateur UNIX en cours..."
	#gid 5001 = group SFTP
	/usr/sbin/useradd --home /var/sftp/$1 --gid 5001 --groups 5001 --password "$(mkpasswd "$2")" --shell /bin/MySecureShell $1
	/bin/echo "Création [OK]"
		
	if [[ -d "/var/sftp/$1" ]]; then
		/bin/echo "Répertoire /var/sftp/$1 déja crée [OK]"
	else
		/bin/echo "Création du répertoire /var/sftp/$1/www en cours..."
		/bin/mkdir /var/sftp/$1/
		/bin/mkdir /var/sftp/$1/www 
		/bin/echo "Création [OK]"

		/bin/echo "Modification des droits sur le dossier utilisateur /var/sftp/$1"
		/bin/chown -R $1:sftp /var/sftp/$1
		/bin/echo "Modification des droits [OK]"

		/bin/echo "Application des Quotas en cours..."
		/usr/sbin/edquota -p test $1
		/bin/echo "Applications des Quotas [OK]"
	fi

	if [[ -d "/etc/apache2/sites-available/$3" ]]; then
		/bin/echo "Virtualhost déjà crée [OK]"
	else
		/bin/echo "Création du virtualhost dans sites-available/$3 en cours..."
		/bin/echo "<VirtualHost *:80>
				ServerName $3.myshop.itinet.fr
				DocumentRoot /var/sftp/$1/www
				Errorlog /var/log/apache2/$3.myshop.itinet.fr-error_log
				</VirtualHost>" > /etc/apache2/sites-available/$3
		/bin/echo "Création [OK]"
		/bin/echo "Création d'un lien symbolique vers sites-enabled en cours..."
		/bin/ln -s /etc/apache2/sites-available/$3 /etc/apache2/sites-enabled/
		/bin/echo "Création [OK]"
	fi
fi

}

function rename_webUser {

# ROLE : MET A JOUR LE VIRTUALHOST D'UNE BOUTIQUE

#On prendra en entrée :
#$1 : le nom de l'utilisateur
#$2 : l'ancien nom de la boutique
#$3 : le nouveau nom de la boutique


if [[ -f "/etc/apache2/sites-available/$2" ]]; then
	# On renomme $2 en $3 ($2 = ancien nom / $3 = nouveau nom)
	/bin/echo "Mise à jour du virtualhost dans sites-available/$3 en cours..."
	/bin/rm /etc/apache2/sites-enabled/$2
	/bin/rm /etc/apache2/sites-available/$2
	/bin/echo "<VirtualHost *:80>
			ServerName $3.myshop.itinet.fr
			DocumentRoot /var/sftp/$1/www
			Errorlog /var/log/apache2/$3.myshop.itinet.fr-error_log
			</VirtualHost>" > /etc/apache2/sites-available/$3
	/bin/ln -s /etc/apache2/sites-available/$3 /etc/apache2/sites-enabled/
	/bin/echo "Mise à jour VirtualHost [OK]"
else
	/bin/echo "Impossible de renommer, cet boutique n'existe pas ! [ECHEC]"
fi

}

function desactivate_webUser {

# ROLE : DESACTIVE LE VIRTUALHOST D'UNE BOUTIQUE

#On prendra en entrée :
#$1 : le nom de la boutique

if [[ -f "/etc/apache2/sites-enabled/$1" ]]; then
	# On desactive le site $1 ($1 = nom du repertoire)
	/bin/echo "Suppression du lien symbolique de sites-enabled/$1 en cours..."
	/usr/bin/unlink /etc/apache2/sites-enabled/$1
	/bin/echo "Suppression [OK]"
else
	/bin/echo "Impossible de désactiver, ce site n'existe pas ! [ECHEC]"
fi

}

function reactivate_webUser {

# ROLE : REACTIVE LE VIRTUALHOST D'UNE BOUTIQUE

#On prendra en entrée :
#$1 : le nom de la boutique

if [[ -f "/etc/apache2/sites-available/$1" ]]; then
	# On réactive le site
	/bin/echo "Réactivation du lien symbolique de /sites-available/$1 en cours..."
	/bin/ln -s /etc/apache2/sites-available/$1 /etc/apache2/sites-enabled/
	/bin/echo "Réactivation [OK]"
else
	/bin/echo "Impossible de réactiver, cet utilisateur n'existe pas [ECHEC]"
fi

}

function delete_webUSser {

# ROLE : SUPPRIME UN UTILISATEUR ET SA BOUTIQUE

#On prendra en entrée :
#$1 : le nom de la boutique
#$2 : le nom de l'utilisateur

if [[ -d /var/sftp/$1 && -f "/etc/apache2/sites-enabled/$1" ]]; then
	# On supprime le site $1
	/bin/echo "Suppression de /var/sftp/$1/www en cours..."
	/bin/rm /var/sftp/$1/www
	/bin/echo "Suppression [OK]"
	/bin/echo "Suppression du lien symbolique de sites-enabled/$1 en cours..."
	/usr/bin/unlink /etc/apache2/sites-enabled/$1
	/bin/echo "Suppression [OK]"
	/bin/echo "Suppression du virtualhost dans site-available"
	/bin/rm /etc/apache2/sites-available/$1
	/bin/echo "Suppression [OK]"
else
	/bin/echo "Impossible de supprimer, cet utilisateur n'existe pas [ECHEC]"
fi

if /bin/grep "^$2:" /etc/passwd; then
	#On supprime la ligne dans le fichier DNS
	/bin/echo "Suppression de l'utilisateur UNIX en cours..."
	/bin/sed "/^$2:/d" /etc/passwd >> /etc/sauv_passwd
	/bin/cp /etc/sauv_passwd /etc/passwd
	/bin/rm /etc/sauv_passwd
	/bin/echo "Suppression [OK]"
else
	/bin/echo "Cet utilisateur n'existe pas ! [ECHEC]"
fi

}

#REDEMARRAGE DU SERVICE APACHE2
#---------------------------------------------------------------
/bin/echo "Redémarrage du service apache2 en cours..."
/etc/init.d/apache2 restart
/bin/echo "Redémarrage [OK]"
#---------------------------------------------------------------