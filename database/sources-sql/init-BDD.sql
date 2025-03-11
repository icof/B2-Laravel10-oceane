-- script d'initialisation de la base de données oceane pour l'application web avec les droits de l'utilisateur oceane-web
DROP DATABASE IF EXISTS `oceane`;
CREATE DATABASE IF NOT EXISTS `oceane`
CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP USER IF EXISTS 'oceane-web'@'%';
CREATE USER 'oceane-web'@'%' IDENTIFIED BY 'oceane-intra';

GRANT ALL ON oceane.* TO 'oceane-web'@'%' ;

USE `oceane`;