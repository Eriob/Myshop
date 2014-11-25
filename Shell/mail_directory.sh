#! /bin/bash

#-------------------------------------------------------------
# Auteur : Alababa
# Nom : Script automatisation création mail directory + envoi mail
# Role : Automatiser la création d'une boite mail
#-------------------------------------------------------------

cd /var/mail

function create_MailDirectory() {

#On prendra en entrée :
#$1 : le nom de l'utilisateur


		if [[ test -e $1 ]]; then
			echo "Ce repertoire existe déjà"
		else
			mkdir $1
			cd ./$1
			maildirmake -f ./Maildir
		fi

}

function send_FirstMail() {

echo "Bienvenue sur MySHOP, vous pouvez des maintenant vous connectez sur http://myshop.itinet.fr et créer votre boutique en ligne en quelques minutes. 
L'équipe MySHOP (Ne pas répondre)" | mailx -s "Bienvenue sur MySHOP" $1@myshop.itinet.fr

}