# Job08 Script périodique

#!/bin/bash

# Récupérer le nombre de connexions de l'utilisateur
nblog=$(grep -c pierre_mazard /var/log/auth.log)

#Définir le nom de fichier en fonction de la date et de l'heure
date_heure=$(date +"%d-%m-%Y-%H-%M")
filename="number_connection-$date_heure.tar"

#Créer dossier de sauvegarde s'il n'est pas déja présent
savedir=~/Job08:Backup
if [ ! -d "$savedir" ]; then
	mkdir "$savedir"
fi

#Archiver le fcier dans un tar
tar -cf "$savedir/$filename"
var/log/auth.log

#Afficher le nombre de connexions et le nom du fichier crée
echo "Nombre de connexions : $nblog"
echo "Fichier sauvegardé : $savedir/$filename"
