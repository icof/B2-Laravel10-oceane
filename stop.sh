#!/bin/bash
# script pour arreter les serveurs PHP et MariaDB

# Arrêter le serveur PHP pour le dossier web
WEB_PORT=8000
if lsof -i:$WEB_PORT > /dev/null; then
    echo "Arrêt du serveur PHP pour le dossier web sur le port $WEB_PORT"
    sudo kill $(lsof -t -i:$WEB_PORT)
else
    echo "Le serveur PHP pour le dossier web n'est pas démarré sur le port $WEB_PORT"
fi

# Arrêter le serveur PHP pour phpMyAdmin
PHPMYADMIN_PORT=8080
if lsof -i:$PHPMYADMIN_PORT > /dev/null; then
    echo "Arrêt du serveur PHP pour phpMyAdmin sur le port $PHPMYADMIN_PORT"
    sudo kill $(lsof -t -i:$PHPMYADMIN_PORT)
else
    echo "Le serveur PHP pour phpMyAdmin n'est pas démarré sur le port $PHPMYADMIN_PORT"
fi

# Arrêter le service MariaDB
echo "Arrêt du service MariaDB..."
sudo service mariadb stop

