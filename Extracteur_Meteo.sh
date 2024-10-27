#!/bin/bash

VILLE=$1
curl -s "wttr.in/$VILLE?format=v2" -o meteo_brute.txt

