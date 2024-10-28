#!/bin/bash

VILLE=$1
curl -s "wttr.in/$VILLE?format=v2" -o meteo_brute.txt

TEMP_ACTUELLE=$(grep -oP '(?<=\+)\d+°C' meteo_brute.txt | head -n1)

TEMP_DEMAIN=$(curl -s "wttr.in/$VILLE?format=%t&forecast=1&day=1" | grep -oP '\+\d+°C')

echo "Temp actuelle : $TEMP_ACTUELLE"
echo "Temp de demain : $TEMP_DEMAIN"

DATE=$(date '+%d-%m-%Y' )
HEURE=$(date '+%H:%M' )

OUTPUT="$DATE -  $HEURE - $VILLE : $TEMP_ACTUELLE - $TEMP_DEMAIN"
echo "$OUTPUT"
