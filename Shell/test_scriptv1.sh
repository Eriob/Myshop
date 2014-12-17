#! /bin/bash

#------------------------------------------------------------
# Auteur : Alababa
# Nom : Script de test v1
# Role : Testez les scripts DNS, Mail, DocumentRoot présent dans /var/www/Myshop/Shell
#------------------------------------------------------------

function test_fileDNS() {
	source /var/www/Myshop/Shell/manage_fileDNS.sh

while true; do
	/bin/echo "Ce test inclue :"
	/bin/echo "- Ajouter d'une adresse dans le fichier DNS"
	/bin/echo "- Renommer une adresse dans le fichier DNS"
	/bin/echo "- Supprimer une adresse dans le fichier DNS"
	/bin/echo "Faites un choix : ajouter, renommer ou supprimer"
	read choice

	/bin/echo "<-------------------------------------------->"
			/bin/echo " Vous souhaitez :" $choice
	/bin/echo "<-------------------------------------------->"

	case $choice in
		ajouter* | AJOUTER*) /bin/echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
						 read arg1
						 addline_fileDNS $arg1
				 break;;
		renommer* | RENOMMER*) /bin/echo "Entrez l'argument 1 : (l'ancien nom)"
							   read arg1
							   /bin/echo "Entrez l'argument 2 : (le nouveau nom)"
							   read arg2
							   manage_fileDNS 1 $arg1 $arg2
				 break;;
		supprimer* | SUPPRIMER*) /bin/echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
								 read arg1
								 manage_fileDNS 2 $arg1
				 break;;
		q*) exit;;
		*) /bin/echo "Mauvaise réponse (ajouter, renommer ou supprimer).";;
	esac
done

}

function test_documentRoot() {
	source /var/www/Myshop/Shell/manage_documentRoot.sh

while true; do
	/bin/echo "Ce test inclue :"
	/bin/echo "- Création du documentroot/virtualhost"
	/bin/echo "- Renommer son documentroot/virtualhost"
	/bin/echo "- Désactiver le virtualhost"
	/bin/echo "- Supprimer le site de l'utilisateur"
	/bin/echo "- Réactiver son virtualhost (si désactiver)"
	/bin/echo "Faites un choix : creer, renommer, supprimer, desactiver ou reactiver"
	read choice

	/bin/echo "<-------------------------------------------->"
			/bin/echo " Vous souhaitez :" $choice
	/bin/echo "<-------------------------------------------->"

	case $choice in
		creer* | CREER*) /bin/echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
						 read arg1
						 create_documentRoot $arg1
				 break;;
		renommer* | RENOMMER*) /bin/echo "Entrez l'argument 1 : (l'ancien nom)"
							   read arg1
							   /bin/echo "Entrez l'argument 2 : (le nouveau nom)"
							   read arg2
							   manage_documentRoot 1 $arg1 $arg2
				 break;;
		desactiver* | DESACTIVER*) /bin/echo "Entrez l'argument 1 : (le nom du site)"
								 read arg1
								 manage_documentRoot 2 $arg1
				 break;;
		supprimer* | SUPPRIMER*) /bin/echo "Entrez l'argument 1 : (le nom du site)"
								 read arg1
								 manage_documentRoot 3 $arg1
				 break;;
		reactiver* | REACTIVER*) /bin/echo "Entrez l'argument 1 : (le nom du site)"
								 read arg1
								 manage_documentRoot 4 $arg1
				 break;;
		q*) exit;;
		*) /bin/echo "Mauvaise réponse (creer, renommer, desactiver, supprimer ou reactiver).";;
	esac
done

}

function test_mail() {
	source /var/www/Myshop/Shell/manage_mail.sh
	
	while true; do
	/bin/echo "Ce test inclue :"
	/bin/echo "- Création du répertoire utilisateur dans /var/mail, envoi mail de bienvenue"
	/bin/echo "- Supprimer le compte mail d'un utilisateur"
	/bin/echo "Faites un choix : creer ou supprimer"
	read choice

	/bin/echo "<-------------------------------------------->"
			/bin/echo " Vous souhaitez :" $choice
	/bin/echo "<-------------------------------------------->"

	case $choice in
		creer* | CREER*) /bin/echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
						 read arg1
						 /bin/echo "Entrez l'argument 2 : (le mot de passe de l'utilisateur)"
						 read arg2
						 create_mailDirectory $arg1 $arg2
				 break;;
		supprimer* | SUPPRIMER*) /bin/echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
								 read arg1
								 manage_mailDirectory $arg1
				 break;;
		q*) exit;;
		*) /bin/echo "Mauvaise réponse (creer ou supprimer).";;
	esac
done

}

function test_userUnix() {
	source /var/www/Myshop/Shell/manage_users.sh
	
	while true; do
	/bin/echo "Ce test inclue :"
	/bin/echo "- Création d'un utilisateur UNIX"
	/bin/echo "- Renommage d'un utilisateur UNIX"
	/bin/echo "- Suppression d'un utilisateur UNIX"
	/bin/echo "Faites un choix : creer, renommer ou supprimer"
	read choice

	/bin/echo "<-------------------------------------------->"
			/bin/echo " Vous souhaitez :" $choice
	/bin/echo "<-------------------------------------------->"

	case $choice in
		creer* | CREER*) /bin/echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
						 read arg1
						 /bin/echo "Entrez l'argument 2 : (le mot de passe de l'utilisateur)"
						 read arg2
						 create_userUnix $arg1 $arg2
				 break;;
		renommer* | RENOMMER*) /bin/echo "Entrez l'argument 1 : (l'ancien nom)"
							   read arg1
							   /bin/echo "Entrez l'argument 2 : (le nouveau nom)"
							   read arg2
							   manage_userUnix 1 $arg1 $arg2
				 break;;
		supprimer* | SUPPRIMER*) /bin/echo "Entrez l'argument 1 : (le nom de l'utilisateur)"
								 read arg1
								 manage_userUnix 2 $arg1
				 break;;
		q*) exit;;
		*) /bin/echo "Mauvaise réponse (creer, renommer ou supprimer).";;
	esac
done


}

while true; do
	/bin/echo "Choisissez un test : dns, mail, documentroot ou userunix"
	read choice

	/bin/echo "<-------------------------------------------->"
			/bin/echo " Vous souhaitez testez le" $choice
	/bin/echo "<-------------------------------------------->"

	case $choice in
		dns* | DNS*) test_fileDNS
				 break;;
		mail* | MAIL*) test_mail
				 break;;
		documentroot* | DOCUMENTROOT*) test_documentRoot
				 break;;
		userunix* | USERUNIX*) test_userUnix
				 break;;
		q*) exit;;
		*) /bin/echo "Mauvaise réponse (dns, mail, documentroot ou userunix).";;
	esac
done
