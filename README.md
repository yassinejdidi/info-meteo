Qu’est-ce qu’un cron ?
Un cron permet d’automatiser un processus/un programme


Afficher les cron existant:
$ crontab -l

Ajouter un cron:
$ crontab -e

Comment ça marche ?
*    *    *    *    *  commande_a_executer
│    │    │    │    │
│    │    │    │    └─── Jour de la semaine (0 - 7) (0 or 7 = DIMANCHE)
│    │    │    └────────── Mois (1 - 12)
│    │    └─────────────── Jour (1 - 31)
│    └──────────────────── Heure (0 - 23)
└───────────────────────── Minute (0 - 59)

Supprimer un cron:
$ crontab -r

