# Job04 Inscription du contenu d'un fichier existant dans un nouveau fichier.

echo "Copie d'un fichier existant dans un nouveau fichier"

#! /bin/bash


$2 > $1

echo "Le fichier" $2 "a été copié dans le répertoire actuel sous le nom de" $1

ls -l
