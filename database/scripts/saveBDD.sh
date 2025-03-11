#!/bin/bash
echo "Exécution du script saveDBB.sh..."

# Variables de configuration
DB_NAME="oceane"
DB_USER="admin"
DB_PASSWORD="admin_password"
BACKUP_DIR="database/sources-sql"

# Exécuter le dump de la base de données et ajouter la commande USE au début
{
  echo "USE $DB_NAME;"
  mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME
} > $BACKUP_DIR/${DB_NAME}.sql

# Vérifier si la commande s'est exécutée avec succès
if [ $? -eq 0 ]; then
  echo "Sauvegarde de la base de données réussie : $BACKUP_DIR/${DB_NAME}.sql"
else
  echo "Erreur lors de la sauvegarde de la base de données"
fi