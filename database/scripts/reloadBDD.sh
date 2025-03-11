#!/bin/bash
echo "Exécution du script reloadDBB.sh..."

# Variables de configuration
DB_NAME="oceane"
DB_USER="admin"
DB_PASSWORD="admin_password"
BACKUP_DIR="database/sources-sql"
BACKUP_FILE="$BACKUP_DIR/oceane.sql"

# Vérifier si le fichier de sauvegarde existe
if [ ! -f "$BACKUP_FILE" ]; then
  echo "Le fichier de sauvegarde $BACKUP_FILE n'existe pas."
  exit 1
fi

# Vider toutes les tables de la base de données existante
echo "Vidage de toutes les tables de la base de données existante $DB_NAME..."
TABLES=$(mysql -u $DB_USER -p$DB_PASSWORD -N -e "SELECT table_name FROM information_schema.tables WHERE table_schema = '$DB_NAME';")
for TABLE in $TABLES; do
  mysql -u $DB_USER -p$DB_PASSWORD -e "SET FOREIGN_KEY_CHECKS = 0; DROP TABLE IF EXISTS $TABLE; SET FOREIGN_KEY_CHECKS = 1;" $DB_NAME
done

# Restaurer la base de données à partir du fichier de sauvegarde
echo "Restauration de la base de données $DB_NAME à partir de $BACKUP_FILE..."
mysql -u $DB_USER -p$DB_PASSWORD $DB_NAME < $BACKUP_FILE

echo "La base de données $DB_NAME a été remplacée avec succès."