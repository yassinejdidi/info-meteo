Objectif du Projet : 

L’objectif du projet est de créer un script Shell qui extrait périodiquement la température actuelle d'une ville donnée ainsi que les prévisions météorologiques pour le lendemain en utilisant le service wttr.in. 
Le script enregistre les informations extraites dans un fichier texte. 
Il prendra par défaut la ville de PARIS si aucun paramètres n’est donné lors de l'exécution.

Pour l'exécution du projet, l’utilisateur doit avoir installé au par avant le programme JQ pour pouvoir traiter le format JSON.


Comment exécuter le script ? 

Il faut ouvrir le terminal puis entrez la commande suivante selon votre système d’exploitation:

Sur windows : bash Extracteur_Meteo.sh
Sous Linux/Unix/MacOS : ./Extracteur_Meteo.sh

On donne ensuite en paramètre la ville que l’on veut utiliser 




Qu’est-ce qu’un cron ?
Un cron permet d’automatiser un processus/un programme. 
C’est un scheduler seulement disponible sur les systèmes d’exploitation Linux/Unix/MacOS.
Il existe une alternative sur windows nommée 




Afficher les cron existant:
$ crontab -l

Ajouter un cron:
$crontab -e

Comment ça marche ?
*    *    *    *    *  commande_a_executer
│    │    │    │    │
│    │    │    │    └─── Jour de la semaine (0 - 7) (0 or 7 = DIMANCHE)
│    │    │    └────────── Mois (1 - 12)
│    │    └─────────────── Jour (1 - 31)
│    └──────────────────── Heure (0 - 23)
└───────────────────────── Minute (0 - 59)





