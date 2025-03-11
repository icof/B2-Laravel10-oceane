# Utilisez l'image de base PHP 8.3
FROM mcr.microsoft.com/devcontainers/php:1-8.3

RUN apt-get update && apt-get install -y wget && apt-get install -y nodejs npm

# Installez les extensions nécessaires
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Installez MariaDB
RUN apt-get install -y mariadb-server

# Téléchargez et installez phpMyAdmin
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz && \
    tar xvf phpMyAdmin-latest-all-languages.tar.gz && \
    mv phpMyAdmin-*-all-languages /usr/src/phpmyadmin && \
    rm phpMyAdmin-latest-all-languages.tar.gz

# Copier le fichier de configuration exemple
RUN cp /usr/src/phpmyadmin/config.sample.inc.php /usr/src/phpmyadmin/config.inc.php

# Configurer phpMyAdmin
RUN echo "\$cfg['Servers'][\$i]['auth_type'] = 'config';" >> /usr/src/phpmyadmin/config.inc.php && \
    echo "\$cfg['Servers'][\$i]['user'] = 'admin';" >> /usr/src/phpmyadmin/config.inc.php && \
    echo "\$cfg['Servers'][\$i]['password'] = 'admin_password';" >> /usr/src/phpmyadmin/config.inc.php && \
    echo "\$cfg['Servers'][\$i]['host'] = '127.0.0.1';" >> /usr/src/phpmyadmin/config.inc.php && \
    echo "\$cfg['Servers'][\$i]['AllowNoPassword'] = true;" >> /usr/src/phpmyadmin/config.inc.php 

# Créez un super utilisateur MariaDB
RUN service mariadb start && \
    mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_password';" && \
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;" && \
    mysql -e "FLUSH PRIVILEGES;"

# Créer le répertoire temporaire pour phpMyAdmin et définir les permissions
RUN mkdir -p /usr/src/phpmyadmin/tmp && \
    chown -R www-data:www-data /usr/src/phpmyadmin/tmp && \
    chmod 777 /usr/src/phpmyadmin/tmp

# Exposez le port par défaut de MariaDB et de phpMyAdmin
EXPOSE 3306 8080

# Démarrez le service MariaDB
CMD ["mysqld"]
