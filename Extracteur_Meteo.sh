#!/bin/bash

# Définir le répertoire de travail
cd /c/Users/etudiant/Desktop/info-meteo

VILLE=${1:-"Paris"}
FORMAT=$2

# Récupération des données météo au format JSON
curl -s "wttr.in/$VILLE?format=j1" -o meteo_brute.json

# Extraction des données à l'aide de jq
TEMP_ACTUELLE=$(jq -r '.current_condition[0].temp_C + "°C"' meteo_brute.json)
TEMP_DEMAIN=$(jq -r '.weather[1].maxtempC + "°C"' meteo_brute.json)
VENT=$(jq -r '.current_condition[0].windspeedKmph + " km/h"' meteo_brute.json)
HUMIDITE=$(jq -r '.current_condition[0].humidity + "%"' meteo_brute.json)
VISIBILITE=$(jq -r '.current_condition[0].visibility + " km"' meteo_brute.json)

# Récupération de la date et de l'heure
DATE=$(date '+%Y-%m-%d')
HEURE=$(date '+%H:%M')

# Nom du fichier d'historique
FICHIER_HISTORIQUE="meteo_$(date '+%Y%m%d')"

if [ "$FORMAT" == "--json" ]; then
  # Assemblage des données en JSON
  JSON_OUTPUT=$(jq -n \
    --arg date "$DATE" \
    --arg heure "$HEURE" \
    --arg ville "$VILLE" \
    --arg temperature "$TEMP_ACTUELLE" \
    --arg prevision "$TEMP_DEMAIN" \
    --arg vent "$VENT" \
    --arg humidite "$HUMIDITE" \
    --arg visibilite "$VISIBILITE" \
    '{
      date: $date,
      heure: $heure,
      ville: $ville,
      temperature: $temperature,
      prevision: $prevision,
      vent: $vent,
      humidite: $humidite,
      visibilite: $visibilite
    }'
  )

  # Enregistrement dans le fichier JSON
  echo "$JSON_OUTPUT" >> "$FICHIER_HISTORIQUE.json"
else
  # Assemblage des informations en texte
  OUTPUT="$DATE - $HEURE - $VILLE : Température actuelle: $TEMP_ACTUELLE - Prévision: $TEMP_DEMAIN - Vent: $VENT - Humidité: $HUMIDITE - Visibilité: $VISIBILITE"

  # Enregistrement dans le fichier texte
  echo "$OUTPUT" >> "$FICHIER_HISTORIQUE.txt"
fi

