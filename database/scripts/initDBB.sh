#!/bin/bash
echo "Exécution du script initDBB.sh..."

SQL_FILE_ENV="database/sources-sql/init-BDD.sql"
SQL_FILE_BDD="database/sources-sql/oceane.sql"

# Créer la base de données à partir du fichier SQL
echo "Création de la base de données à partir de $SQL_FILE_ENV..."
sudo mysql -u root < $SQL_FILE_ENV

# Peupler la base de données à partir du fichier SQL
echo "Peuplement de la BDD à partir de $SQL_FILE_BDD..."
sudo mysql -u root < $SQL_FILE_BDD