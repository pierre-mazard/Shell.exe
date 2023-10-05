#Job09 Récupéraiton des infos des utilisateus d'un fichier CSV et transfert sur le système

#!/bin/bash

#Chemin d'accés au fichier CSV
csv_file="/home/pierre_mazard/Shell.exe/Job09/Shell_Userlist.csv"

#Parcourir les lignes du fichier CSV
while IFS=',' read -r Id Prenom Nom Mdp Role; do
User="$Prenom,$Mdp,$Role"

#Vérification si l'utilisateur est admin
	if [ "$Role" = "Admin" ]; then
		#Créer l'utilisateur avec les permissions de super utilisateur
		sudo useradd -m -G sudo "Prenom"
		echo "$Prenom:$Mdp" | chpasswd
		echo "L'utilisateur $Prenom a été créé avec les permissions de super utilisateur"
	else
		#Créer l'utilisateur noral
		sudo useradd -m "$Prenom"
		echo "$Prenom:$Mdp" | chpasswd
		echo "L'utilisateur $Prenom a été créé avec les permissions normales"
	fi
done < "Shell_Userlist.csv"
