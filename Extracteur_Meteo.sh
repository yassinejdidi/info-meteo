#!/bin/bash

#Récupération des données
VILLE=${1:-"Paris"}
curl -s "wttr.in/$VILLE?format=j1" -o meteo_brute.json

#Récupération des témpératures
TEMP_ACTUELLE=$(grep -oP '(?<=\+)\d+°C' meteo_brute.txt | head -n1)
TEMP_DEMAIN=$(curl -s "wttr.in/$VILLE?format=%t&forecast=1&day=1" | grep -oP '\+\d+°C')

echo "Temp actuelle : $TEMP_ACTUELLE"
echo "Temp de demain : $TEMP_DEMAIN"


#Formatage des données récupérées
DATE=$(date '+%d-%m-%Y' )
HEURE=$(date '+%H:%M' )

OUTPUT="$DATE -  $HEURE - $VILLE : Température actuelle: $TEMP_ACTUELLE - Prévision: $TEMP_DEMAIN" - Vent: $VENT - Humidité: $HUMIDITE - Visibilité: $VISIBILITE"
echo "$OUTPUT"


#Enregistrement dans meteo.txt
echo "$OUTPUT" >> meteo.txt

#Archivage de quotidien

#Définir le nom du fichier d'archive avec la date
FICHIER_HISTORIQUE="meteo_$(date '+%d%m%Y').txt"

#Enregistrer la sortie dans le fichier d'archive journalier
echo "$OUTPUT" >> "$FICHIER_HISTORIQUE"

#Extraction des données à l'aide de jq
TEMP_ACTUELLE=$(jq -r'.current_condition[0].temp_C + "°C"' meteo_brute.json)
TEMP_DEMAIN=$(jq -r'.weather[1].maxtempC + "°C"'meteo_brute.json)
VENT=$(jq -r '.current_condition[0].windspeedKmph + " km/h"' meteo_brute.json)
HUMIDITE=$(jq -r '.current_condition[0].humidity + "%"' meteo_brute.json)has context menu
VISIBILITE=$(jq -r'.current_condition[0].visibility + " km"'meteo_brute.json)
