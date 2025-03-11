USE oceane;
-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: oceane
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bateau`
--

DROP TABLE IF EXISTS `bateau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bateau` (
  `id` tinyint(3) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `longueur` float DEFAULT NULL,
  `largeur` float DEFAULT NULL,
  `vitesse_croisiere` float DEFAULT NULL,
  `niveauPMR` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `niveauAccessibilite` (`niveauPMR`),
  CONSTRAINT `bateau_ibfk_1` FOREIGN KEY (`niveauPMR`) REFERENCES `niveau_accessibilite` (`idNiveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bateau`
--

LOCK TABLES `bateau` WRITE;
/*!40000 ALTER TABLE `bateau` DISABLE KEYS */;
INSERT INTO `bateau` VALUES
(6,'Vindilis','vindilis.jpg','Le roulier (ou transbordeur ou ferry) VINDILIS a été mis en service en 1998. \r\n\r\nC’est sous le nom de Vindilis que fut identifiée pour la première fois sur une carte géographique Belle-Ile-en-Mer, vers l’an mille avant JC. Le bateau mesure 48 mètres de long et 12,50 mètres de large. Il peut transporter jusqu’à 399 passagers et 39 véhicules de tourisme. \r\n\r\nIl effectue la traversée vers Belle-Ile-en-Mer en 50 minutes à une vitesse de 12 nœuds.   ',48,12.5,12.5,3),
(7,'Bangor','bangor.jpg','Le BANGOR a effectué ses premières traversées commerciales en juin 2006. \r\n\r\nIl mesure 46 mètres de long et 12 mètres de large. Avec une capacité de 450 passagers et 32 véhicules de tourisme, il relie Quiberon à Le Palais (Belle-Ile) en 50 minutes à une vitesse de 12 nœuds. \r\n\r\nL’accès au salon passager est facilité pour les personnes à mobilité réduite grâce à la présence d’un ascenseur. ',46,12,12,3),
(8,'Kerdonis','kerdonis.jpg','Le KERDONIS a effectué ses premières traversées commerciales en juillet 2010. \r\n\r\nD’une longueur de 30,75 mètres et d’une largeur de 8 mètres, cette vedette est le premier bateau de la flotte à être classé « Clean Ship » (bateau propre). 295 passagers peuvent prendre place à bord de cette vedette. Elle ne transporte ni véhicule, ni marchandise.  \r\n\r\nA une vitesse de 20 nœuds, elle effectue la traversée entre Quiberon et Le Palais en 30 minutes. En juillet et août, le Kerdonis permet de rallier Sauzon au départ de Quiberon. ',30.75,8,20,1),
(10,'Melvan','melvan.jpg','Mis en service en février 2010, le MELVAN porte le nom d’un îlot rocheux situé entre les deux îles qu’il dessert, Houat et Hoëdic. \r\n\r\nAvec une vitesse moyenne de 16,5 nœuds, il permet de rallier, au départ de Quiberon, Houat en 40 minutes et Hoëdic en 55 minutes. \r\n\r\nCette vedette, adaptée aux besoins de ces îles, permet de transporter jusqu’à 234 passagers et 45 tonnes de fret. ',31,8.06,16.5,2),
(12,'Breizh Nevez I','breizh-nevez-I.jpg','Le BREIZH NEVEZ I est le dernier roulier (ou transbordeur ou ferry) de la flotte  de la Compagnie Océane mis en exploitation sur les liaisons vers les îles de Bretagne sud. Il a effectué ses premières traversées commerciales en avril 2018.\r\n\r\nIl déplace ses 43.5 mètres de long et 11.6 mètres de large à une vitesse de 11.5 nœuds. Sa capacité maximum est de 300 passagers et de 18 véhicules de tourisme. Il effectue la traversée entre Lorient et l‘Ile de Groix en 45 minutes. ',43.5,11.6,11.5,2),
(13,'Ile de Groix','ile-de-groix.jpg','L’ILE DE GROIX est le roulier (ou transbordeur ou ferry) mis en exploitation sur les liaisons vers les îles de Bretagne sud. Il a effectué ses premières traversées commerciales en juillet 2008. \r\n\r\nSistership du Bangor, il déplace ses 46 mètres de long et 12 mètres de large à une vitesse de 12 nœuds. Sa capacité maximum est de 450 passagers et de 32 véhicules de tourisme. Il effectue régulièrement la traversée entre Lorient et l’Ile de Groix en 45 minutes et ponctuellement la traversée entre Quiberon et Le Palais. ',46,12,12,3);
/*!40000 ALTER TABLE `bateau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bateau_secteur`
--

DROP TABLE IF EXISTS `bateau_secteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bateau_secteur` (
  `idBateau` tinyint(3) unsigned NOT NULL,
  `idSecteur` tinyint(3) unsigned NOT NULL,
  KEY `idBateau` (`idBateau`),
  KEY `idSecteur` (`idSecteur`),
  CONSTRAINT `bateau_secteur_ibfk_1` FOREIGN KEY (`idBateau`) REFERENCES `bateau` (`id`),
  CONSTRAINT `bateau_secteur_ibfk_2` FOREIGN KEY (`idSecteur`) REFERENCES `secteur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bateau_secteur`
--

LOCK TABLES `bateau_secteur` WRITE;
/*!40000 ALTER TABLE `bateau_secteur` DISABLE KEYS */;
INSERT INTO `bateau_secteur` VALUES
(10,2),
(8,2),
(7,1),
(6,1),
(8,1),
(13,3),
(12,3);
/*!40000 ALTER TABLE `bateau_secteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `idCategorie` varchar(2) NOT NULL,
  `libelleCategorie` varchar(100) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES
('PA','Passagers'),
('VE','Véhicules');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenance_bateau`
--

DROP TABLE IF EXISTS `contenance_bateau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenance_bateau` (
  `idBateau` tinyint(3) unsigned NOT NULL,
  `lettreCategorie` varchar(2) NOT NULL,
  `capaciteMax` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`idBateau`,`lettreCategorie`),
  KEY `lettreCategorie` (`lettreCategorie`),
  CONSTRAINT `contenance_bateau_ibfk_1` FOREIGN KEY (`idBateau`) REFERENCES `bateau` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `contenance_bateau_ibfk_2` FOREIGN KEY (`lettreCategorie`) REFERENCES `categorie` (`idCategorie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenance_bateau`
--

LOCK TABLES `contenance_bateau` WRITE;
/*!40000 ALTER TABLE `contenance_bateau` DISABLE KEYS */;
INSERT INTO `contenance_bateau` VALUES
(6,'PA',399),
(6,'VE',37),
(7,'PA',450),
(7,'VE',32),
(8,'PA',295),
(8,'VE',0),
(10,'PA',234),
(10,'VE',0),
(12,'PA',300),
(12,'VE',18),
(13,'PA',450),
(13,'VE',26);
/*!40000 ALTER TABLE `contenance_bateau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_reservation`
--

DROP TABLE IF EXISTS `detail_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_reservation` (
  `numReservation` int(10) unsigned NOT NULL,
  `numType` tinyint(3) unsigned NOT NULL,
  `lettreCategorie` varchar(2) NOT NULL,
  `quantité` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`numReservation`,`numType`,`lettreCategorie`),
  KEY `numType` (`numType`,`lettreCategorie`),
  CONSTRAINT `detail_reservation_ibfk_1` FOREIGN KEY (`numReservation`) REFERENCES `reservation` (`num`),
  CONSTRAINT `detail_reservation_ibfk_2` FOREIGN KEY (`numType`, `lettreCategorie`) REFERENCES `type_billet` (`idTypeBillet`, `idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_reservation`
--

LOCK TABLES `detail_reservation` WRITE;
/*!40000 ALTER TABLE `detail_reservation` DISABLE KEYS */;
INSERT INTO `detail_reservation` VALUES
(918145,1,'PA',2),
(918145,2,'PA',1),
(918145,3,'VE',1),
(918145,6,'PA',1),
(918145,6,'VE',1);
/*!40000 ALTER TABLE `detail_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liaison`
--

DROP TABLE IF EXISTS `liaison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liaison` (
  `code` tinyint(3) unsigned NOT NULL,
  `codeSecteur` tinyint(3) unsigned NOT NULL,
  `distance` decimal(10,2) NOT NULL,
  `portDepart` varchar(50) NOT NULL,
  `portArrivee` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `codeSecteur` (`codeSecteur`),
  KEY `portArrivee` (`portArrivee`),
  KEY `portDepart` (`portDepart`),
  CONSTRAINT `liaison_ibfk_3` FOREIGN KEY (`codeSecteur`) REFERENCES `secteur` (`id`),
  CONSTRAINT `liaison_ibfk_4` FOREIGN KEY (`portArrivee`) REFERENCES `port` (`nom_court`),
  CONSTRAINT `liaison_ibfk_5` FOREIGN KEY (`portDepart`) REFERENCES `port` (`nom_court`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liaison`
--

LOCK TABLES `liaison` WRITE;
/*!40000 ALTER TABLE `liaison` DISABLE KEYS */;
INSERT INTO `liaison` VALUES
(11,1,8.40,'Quiberon','Le Palais'),
(15,1,8.30,'Le Palais','Quiberon'),
(16,2,8.80,'Quiberon','Port St Gildas'),
(19,2,8.00,'Port St Gildas','Quiberon'),
(21,3,7.70,'Lorient','Port Tudy'),
(22,3,7.40,'Port Tudy','Lorient'),
(31,2,5.30,'Port St Gildas','Port Argol'),
(32,2,5.30,'Port Argol','Port St Gildas');
/*!40000 ALTER TABLE `liaison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveau_accessibilite`
--

DROP TABLE IF EXISTS `niveau_accessibilite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveau_accessibilite` (
  `idNiveau` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `descriptionAccessibilite` text NOT NULL,
  PRIMARY KEY (`idNiveau`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveau_accessibilite`
--

LOCK TABLES `niveau_accessibilite` WRITE;
/*!40000 ALTER TABLE `niveau_accessibilite` DISABLE KEYS */;
INSERT INTO `niveau_accessibilite` VALUES
(1,'non adapté PMR','Navire qui ne contient pas d\'équipement pour les personnes à mobilité réduite.'),
(2,'adapté PMR','Navire aménagé pour accueillir les personnes à mobilité réduite.'),
(3,'adapté PMR + ascenseur','Navire équipé d’un ascenseur aux normes PMR permettant aux personnes à mobilité réduite d’accéder aux salons voyageurs.');
/*!40000 ALTER TABLE `niveau_accessibilite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periode`
--

DROP TABLE IF EXISTS `periode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periode` (
  `idPeriode` varchar(5) NOT NULL,
  `libellePeriode` varchar(200) NOT NULL,
  `descriptionPeriode` text NOT NULL,
  PRIMARY KEY (`idPeriode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periode`
--

LOCK TABLES `periode` WRITE;
/*!40000 ALTER TABLE `periode` DISABLE KEYS */;
INSERT INTO `periode` VALUES
('HF','Haute fréquentation','Les vendredis, samedis, dimanches et jours fériés du 01/04 au 30/09'),
('PN','Période normale','Du 01/10 au 31/03 et du lundi au jeudi du 01/04 au 30/09, hors jours fériés');
/*!40000 ALTER TABLE `periode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `port` (
  `nom_court` varchar(50) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `camera` varchar(200) NOT NULL,
  PRIMARY KEY (`nom_court`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
INSERT INTO `port` VALUES
('Le Palais','gare maritime de Le Palais','La gare maritime de Le Palais est ouverte toute l’année de 08h30 à 12h15 et de 14h00 à 18h00.','Quai Bonnelle 56360 Le Palais','le-palais.jpg','https://pv.viewsurf.com/id/848/a/media/c/4416?i=Njk0ODp1bmRlZmluZWQ'),
('Lorient','gare maritime de Lorient','La gare maritime de Lorient est ouverte toute l’année du lundi au dimanche 30 minutes avant le premier départ et jusqu’au dernier départ de la journée. <br>\r\nLe dimanche et les jours fériés, les guichets ferment après le dernier départ du matin et rouvrent 30 minutes avant le départ de l’après-midi.\r\n<br>Pour faciliter votre stationnement à proximité de la gare maritime, anticipez votre arrivée à Lorient et utilisez les parkings à proximité.','rue Gilles Gahinet 56100 Lorient','lorient.jpg',''),
('Port Argol','gare maritime de port Argol de Hoëdic','La gare maritime du port de Hoëdic est ouverte toute l’année 30 minutes avant chaque départ.','Port de Hoëdic 56170 île de Hoëdic','port-argol.jpg',''),
('Port St Gildas','gare maritime de Port de Saint-Gildas','La gare maritime de Port de Saint-Gildas est ouverte toute l’année 30 minutes avant chaque départ.','Port de Saint-Gildas 56170 île d\'Houat','port-st-gildas.jpg',''),
('Port Tudy','gare maritime de Port Tudy ','La gare maritime de Port Tudy est ouverte toute l’année 30 minutes avant chaque départ.<br> Port Tudy dispose d’une salle d’attente moderne disposant de places assises et d’une zone d’embarquement couverte permettant de vous protéger des intempéries ou de fortes chaleurs.','Port Tudy 56590 île de Groix','port-tudy.jpg','http://www.groix.fr/?mode=webcam'),
('Quiberon','gare maritime de Quiberon','La gare maritime de Quiberon est ouverte toute l’année du lundi au dimanche 30 minutes avant le premier départ et jusqu’au dernier départ de la journée. <br>\r\nPour faciliter les flux de véhicules et de passagers, nous vous invitons à respecter les horaires d’embarquement, mais aussi à utiliser les parkings relais et les navettes dès leur mise en service.','Port Maria,  56170 Quiberon','quiberon.jpg','');
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `num` int(10) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `adr` varchar(300) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `numTraversee` int(10) unsigned NOT NULL,
  PRIMARY KEY (`num`),
  KEY `numTraversee` (`numTraversee`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`numTraversee`) REFERENCES `traversee` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES
(918145,'TIPREZ','15 rue de l\'industrie','19290','PEYRELEVADE',60003);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secteur`
--

DROP TABLE IF EXISTS `secteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secteur` (
  `id` tinyint(3) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secteur`
--

LOCK TABLES `secteur` WRITE;
/*!40000 ALTER TABLE `secteur` DISABLE KEYS */;
INSERT INTO `secteur` VALUES
(1,'Belle-Ile-En-Mer','belle-ile.jpg','Faire escale à Belle-Île, c’est accepter de perdre un peu de ses repères continentaux, de renouer avec une autre notion du temps, de sympathiser avec des habitants à l’accueil franc et naturel. C’est aussi, chaque jour, le bonheur d’avoir l’océan comme seul horizon.  <br><br>\r\nLa nature y est, partout, présente : site classé d’intérêt Natura 2 000, Belle-Île regorge de richesses naturelles aussi rares que protégées. Vous en apprécierez toute la beauté en sillonnant, notamment, les 84 km² de sentier côtier. <br><br>\r\nEn 5 jours, vous ferez le tour complet de l’île et apprécierez ses multiples facettes : sauvage ou bucolique, chahutée par des vagues tumultueuses ou bercée par des eaux couleurs Caraïbes, autant mer que campagne.  <br><br>\r\nEt cette richesse se trouve aussi dans l’assiette ! Si les produits de la mer seront souvent conviés à votre table, notamment le célèbre « pouce-pied », le terroir n’est pas en reste : viande des embruns, Agneau du Large, fromages et légumes 100% locaux… Votre escale sera aussi l’occasion de renouer avec les plaisirs de la table. <br><br>\r\nPour votre escale à la journée, favorisez les déplacements doux ! À pied, à vélo, en transport public voire en voiture électrique, vous trouverez forcément votre bonheur !','www.belle-ile.com'),
(2,'Houat et Hoëdic','houat.jpg','Des bateaux à la coque colorée, des casiers qui s’entassent sur les quais, des maisons aux volets bleus, une lande verdoyante et des falaises granitiques. Houat… else !<br> <br>\r\nCôté authenticité et dépaysement, l’île a de quoi vous servir. <br>\r\nVous allez adorer flâner dans les ruelles de son village, bordées de roses trémières. À l’est, bien abritée, la longue et magnifique plage de Treac’h-er-Goured vous invite au repos et à la baignade. L’eau est certes un peu fraîche, mais elle est aussi si claire…<br> Aventurez-vous aussi vers l’ouest de l’île, plus sauvage et vallonné, et dénichez l’une des jolies criques secrètes qui se cache au creux des falaises. Deux options pour y accéder : à pied par le sentier côtier, ou à vélo, nez au vent. N’oubliez pas de vous munir de votre pique-nique. Et revenez à temps pour assister au retour des pêcheurs dans le port de Saint-Gildas. Un vrai spectacle ! <br>Alors n’attendez plus, réservez votre billet pour une journée d’évasion sur l’île de Houat. <br><hr>\r\nUn peu de farniente à Tahiti Beach, ça vous tente ? Sable blanc, eau turquoise, les plages d’Hoëdic sont dignes de lagons. De quoi vous donner encore plus l’impression de bout du monde. Minuscule caillou, l’île est d’un calme saisissant. Ici pas une voiture qui ne circule, on ne se déplace qu’à pied. <br>\r\nDe toute façon, sur Hoëdic, rien n’est loin et surtout, rien ne presse… non ? <br>\r\nBaladez-vous sur ses sentiers, à travers sa végétation riche en couleurs et odeurs. Un parfum de curry vous titille les narines, c’est celui des immortelles des dunes. Filez jusqu’à la Maison Perdue ou vers la pointe du Vieux-Château, la plus sauvage de l’île. Les rochers couverts de lichen, l’océan… C’est encore plus beau au coucher du soleil ! <br>\r\nDe retour de balade, retrouvez les locaux au café. On en compte quatre dans le village, aussi chaleureux les uns que les autres. C’est ça aussi, le charme de la vie hoëdicaise. <br>\r\nÇa vous tente ? Embarquez dès maintenant pour une escapade au grand air sur l’île d’Hoëdic.','www.baiedequiberon.bzh'),
(3,'Ile de Groix','groix.jpg','C’est forcément à pied ou à vélo (plus de 40 km d’itinéraires cyclables) que vous vivrez l’aventure Groix, ce caillou paisible de 8 km sur 3 km. <br> \r\nAmateurs de beaux paysages, vous allez vous régaler !  <br><br>\r\nAprès les façades colorées de Port-Tudy et de l’Ecomusée, explorez le Bourg et ses petites rues : levez les yeux vers le clocher de l’église orné d’un thon, symbole de l’épopée thonière de l’île! <br>\r\n Ensuite, la campagne du cœur de l’île et les villages typiques. Les falaises abruptes et les étendues de lande. Le phare de Pen-Men sur le site de la réserve naturelle François Le Bail, paradis ornithologique. Le fameux Trou de l’enfer. \r\n <br>\r\n Pointe sud, le phare de la pointe des Chats qui surplombe un plateau impressionnant de micaschistes, grenats et glaucophanes. Les petits ports.  Sans oublier les plages. <br>\r\n La majestueuse Plage des grands sables, plage convexe où l’eau est turquoise et où vous pourrez profiter des activités nautiques. \r\n <br>La plage des sables rouges, symbole de « l’île aux grenats » qu’est Groix.<br>\r\n Et aussi la quinzaine de plages et petites criques, tout aussi paradisiaques : Locmaria, Poulziorec, Port-Mélite… <br><br>\r\n Les groisillons sont appelés les Greks, du nom des cafetières typiques utilisées dans les maisons. Ils vous accueillent toute l’année. <br>\r\n Qui voit Groix voit sa joie ! ','www.lorientbretagnesudtourisme.fr/');
/*!40000 ALTER TABLE `secteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarification`
--

DROP TABLE IF EXISTS `tarification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarification` (
  `idCategorie` varchar(2) NOT NULL,
  `idTypeBillet` tinyint(3) unsigned NOT NULL,
  `idPeriode` varchar(5) NOT NULL,
  `tarif` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`idTypeBillet`,`idCategorie`,`idPeriode`),
  KEY `numType` (`idTypeBillet`,`idCategorie`),
  KEY `tarification_ibfk_4` (`idPeriode`),
  CONSTRAINT `tarification_ibfk_3` FOREIGN KEY (`idTypeBillet`, `idCategorie`) REFERENCES `type_billet` (`idTypeBillet`, `idCategorie`) ON UPDATE CASCADE,
  CONSTRAINT `tarification_ibfk_4` FOREIGN KEY (`idPeriode`) REFERENCES `periode` (`idPeriode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarification`
--

LOCK TABLES `tarification` WRITE;
/*!40000 ALTER TABLE `tarification` DISABLE KEYS */;
INSERT INTO `tarification` VALUES
('PA',1,'HF',18.50),
('PA',1,'PN',17.00),
('VE',1,'HF',7.50),
('VE',1,'PN',7.50),
('PA',2,'HF',9.50),
('PA',2,'PN',9.50),
('VE',2,'HF',10.00),
('VE',2,'PN',10.00),
('PA',3,'HF',0.00),
('PA',3,'PN',0.00),
('VE',3,'HF',7.50),
('VE',3,'PN',7.50),
('PA',4,'HF',9.25),
('PA',4,'PN',8.50),
('VE',4,'HF',21.00),
('VE',4,'PN',21.00),
('PA',5,'HF',9.25),
('PA',5,'PN',8.50),
('VE',5,'HF',70.00),
('VE',5,'PN',60.00),
('PA',6,'HF',3.00),
('PA',6,'PN',3.00),
('VE',6,'HF',98.00),
('VE',6,'PN',87.00),
('VE',7,'HF',115.00),
('VE',7,'PN',104.00),
('VE',8,'HF',175.00),
('VE',8,'PN',158.00),
('VE',9,'HF',218.00),
('VE',9,'PN',191.00),
('VE',10,'HF',299.00),
('VE',10,'PN',299.00),
('VE',11,'HF',23.40),
('VE',11,'PN',23.40),
('VE',12,'HF',29.00),
('VE',12,'PN',29.00);
/*!40000 ALTER TABLE `tarification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traversee`
--

DROP TABLE IF EXISTS `traversee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traversee` (
  `num` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `codeLiaison` tinyint(3) unsigned NOT NULL,
  `idBateau` tinyint(3) unsigned NOT NULL,
  `sans_vehicule` tinyint(1) NOT NULL DEFAULT 0,
  `idPeriode` varchar(5) NOT NULL DEFAULT 'PN',
  PRIMARY KEY (`num`),
  KEY `codeLiaison` (`codeLiaison`),
  KEY `idBateau` (`idBateau`),
  KEY `idPeriode` (`idPeriode`),
  CONSTRAINT `traversee_ibfk_1` FOREIGN KEY (`codeLiaison`) REFERENCES `liaison` (`code`),
  CONSTRAINT `traversee_ibfk_2` FOREIGN KEY (`idBateau`) REFERENCES `bateau` (`id`),
  CONSTRAINT `traversee_ibfk_3` FOREIGN KEY (`idPeriode`) REFERENCES `periode` (`idPeriode`)
) ENGINE=InnoDB AUTO_INCREMENT=60497 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traversee`
--

LOCK TABLES `traversee` WRITE;
/*!40000 ALTER TABLE `traversee` DISABLE KEYS */;
INSERT INTO `traversee` VALUES
(60000,'2022-09-01','07:45:00',11,6,0,'PN'),
(60001,'2022-09-01','09:30:00',11,7,0,'PN'),
(60002,'2022-09-01','11:15:00',11,6,0,'PN'),
(60003,'2022-09-01','12:45:00',11,7,0,'PN'),
(60004,'2022-09-01','14:15:00',11,6,0,'PN'),
(60005,'2022-09-01','15:45:00',11,7,0,'PN'),
(60006,'2022-09-01','17:15:00',11,6,0,'PN'),
(60007,'2022-09-01','19:00:00',11,7,0,'PN'),
(60008,'2022-09-01','20:00:00',11,6,0,'PN'),
(60009,'2022-09-02','07:45:00',11,6,0,'PN'),
(60010,'2022-09-02','09:30:00',11,7,0,'PN'),
(60011,'2022-09-02','11:15:00',11,6,0,'PN'),
(60012,'2022-09-02','12:45:00',11,7,0,'PN'),
(60013,'2022-09-02','14:15:00',11,6,0,'PN'),
(60014,'2022-09-02','15:45:00',11,7,0,'PN'),
(60015,'2022-09-02','17:15:00',11,6,0,'PN'),
(60016,'2022-09-02','19:15:00',11,7,0,'PN'),
(60017,'2022-09-02','20:15:00',11,6,0,'PN'),
(60018,'2022-09-03','07:45:00',11,6,0,'HF'),
(60019,'2022-09-03','09:30:00',11,7,0,'HF'),
(60020,'2022-09-03','11:15:00',11,6,0,'HF'),
(60021,'2022-09-03','12:45:00',11,7,0,'HF'),
(60022,'2022-09-03','14:15:00',11,6,0,'HF'),
(60023,'2022-09-03','15:45:00',11,7,0,'HF'),
(60024,'2022-09-03','17:15:00',11,6,0,'HF'),
(60025,'2022-09-03','19:00:00',11,7,0,'HF'),
(60026,'2022-09-03','20:15:00',11,6,0,'HF'),
(60027,'2022-09-04','08:15:00',11,6,0,'HF'),
(60028,'2022-09-04','09:30:00',11,7,0,'HF'),
(60029,'2022-09-04','11:15:00',11,6,0,'HF'),
(60030,'2022-09-04','12:45:00',11,7,0,'HF'),
(60031,'2022-09-04','14:15:00',11,6,0,'HF'),
(60032,'2022-09-04','15:45:00',11,7,0,'HF'),
(60033,'2022-09-04','17:15:00',11,6,0,'HF'),
(60034,'2022-09-04','19:00:00',11,7,0,'HF'),
(60035,'2022-09-04','20:15:00',11,6,0,'HF'),
(60036,'2022-09-05','08:15:00',11,6,0,'PN'),
(60037,'2022-09-05','09:30:00',11,7,0,'PN'),
(60038,'2022-09-05','11:15:00',11,6,0,'PN'),
(60039,'2022-09-05','12:45:00',11,7,0,'PN'),
(60040,'2022-09-05','14:45:00',11,6,0,'PN'),
(60041,'2022-09-05','17:15:00',11,7,0,'PN'),
(60042,'2022-09-05','19:00:00',11,6,0,'PN'),
(60043,'2022-09-05','20:00:00',11,7,0,'PN'),
(60044,'2022-09-06','07:45:00',11,6,0,'PN'),
(60045,'2022-09-06','09:30:00',11,7,0,'PN'),
(60046,'2022-09-06','11:15:00',11,6,0,'PN'),
(60047,'2022-09-06','12:45:00',11,7,0,'PN'),
(60048,'2022-09-06','14:45:00',11,6,0,'PN'),
(60049,'2022-09-06','17:15:00',11,7,0,'PN'),
(60050,'2022-09-06','19:00:00',11,6,0,'PN'),
(60051,'2022-09-06','20:00:00',11,7,0,'PN'),
(60052,'2022-09-07','08:00:00',11,6,0,'PN'),
(60053,'2022-09-07','09:30:00',11,7,0,'PN'),
(60054,'2022-09-07','11:15:00',11,6,0,'PN'),
(60055,'2022-09-07','12:45:00',11,7,0,'PN'),
(60056,'2022-09-07','14:45:00',11,6,0,'PN'),
(60057,'2022-09-07','17:15:00',11,7,0,'PN'),
(60058,'2022-09-07','19:00:00',11,6,0,'PN'),
(60059,'2022-09-06','20:00:00',11,7,0,'PN'),
(60060,'2022-09-08','07:45:00',11,6,0,'PN'),
(60061,'2022-09-08','09:30:00',11,7,0,'PN'),
(60062,'2022-09-08','11:15:00',11,6,0,'PN'),
(60063,'2022-09-08','12:45:00',11,7,0,'PN'),
(60064,'2022-09-08','14:45:00',11,6,0,'PN'),
(60065,'2022-09-08','17:15:00',11,7,0,'PN'),
(60066,'2022-09-08','19:00:00',11,6,0,'PN'),
(60067,'2022-09-08','20:00:00',11,7,0,'PN'),
(60068,'2022-09-09','07:45:00',11,6,0,'PN'),
(60069,'2022-09-09','09:30:00',11,7,0,'PN'),
(60070,'2022-09-09','11:15:00',11,6,0,'PN'),
(60071,'2022-09-09','12:30:00',11,7,0,'PN'),
(60072,'2022-09-09','14:15:00',11,6,0,'PN'),
(60073,'2022-09-09','15:15:00',11,7,0,'PN'),
(60074,'2022-09-09','17:15:00',11,6,0,'PN'),
(60075,'2022-09-09','19:15:00',11,7,0,'PN'),
(60076,'2022-09-09','20:15:00',11,6,0,'PN'),
(60077,'2022-09-10','07:45:00',11,6,0,'HF'),
(60078,'2022-09-10','09:30:00',11,7,0,'HF'),
(60079,'2022-09-10','12:45:00',11,6,0,'HF'),
(60080,'2022-09-10','14:15:00',11,7,0,'HF'),
(60081,'2022-09-10','15:45:00',11,6,0,'HF'),
(60082,'2022-09-10','17:15:00',11,7,1,'HF'),
(60083,'2022-09-10','19:00:00',11,6,0,'HF'),
(60084,'2022-09-10','20:15:00',11,7,0,'HF'),
(60085,'2022-09-11','07:15:00',11,6,0,'HF'),
(60086,'2022-09-11','09:00:00',11,7,0,'HF'),
(60087,'2022-09-11','10:15:00',11,6,0,'HF'),
(60088,'2022-09-11','13:15:00',11,7,0,'HF'),
(60089,'2022-09-11','14:45:00',11,6,0,'HF'),
(60090,'2022-09-11','16:00:00',11,7,0,'HF'),
(60091,'2022-09-11','18:15:00',11,6,0,'HF'),
(60092,'2022-09-11','19:15:00',11,7,0,'HF'),
(60093,'2022-09-11','20:45:00',11,6,0,'HF'),
(60094,'2022-09-12','08:15:00',11,6,0,'PN'),
(60095,'2022-09-12','09:30:00',11,7,0,'PN'),
(60096,'2022-09-12','11:15:00',11,6,0,'PN'),
(60097,'2022-09-12','13:45:00',11,7,0,'PN'),
(60098,'2022-09-12','15:45:00',11,6,0,'PN'),
(60099,'2022-09-12','16:45:00',11,7,0,'PN'),
(60100,'2022-09-12','19:00:00',11,6,0,'PN'),
(60101,'2022-09-12','20:00:00',11,7,0,'PN'),
(60102,'2022-09-13','07:45:00',11,6,0,'PN'),
(60103,'2022-09-13','09:30:00',11,7,0,'PN'),
(60104,'2022-09-13','11:15:00',11,6,0,'PN'),
(60105,'2022-09-13','14:00:00',11,7,0,'PN'),
(60106,'2022-09-13','15:45:00',11,6,0,'PN'),
(60107,'2022-09-13','17:00:00',11,7,0,'PN'),
(60108,'2022-09-13','19:00:00',11,6,0,'PN'),
(60109,'2022-09-13','20:00:00',11,7,0,'PN'),
(60110,'2022-09-14','08:00:00',11,6,0,'PN'),
(60111,'2022-09-14','09:30:00',11,7,0,'PN'),
(60112,'2022-09-14','11:15:00',11,6,0,'PN'),
(60113,'2022-09-14','12:45:00',11,7,0,'PN'),
(60114,'2022-09-14','14:45:00',11,6,0,'PN'),
(60115,'2022-09-14','17:15:00',11,7,0,'PN'),
(60116,'2022-09-14','19:00:00',11,6,0,'PN'),
(60117,'2022-09-14','20:00:00',11,7,0,'PN'),
(60118,'2022-09-15','07:45:00',11,6,0,'PN'),
(60119,'2022-09-15','09:30:00',11,7,0,'PN'),
(60120,'2022-09-15','11:15:00',11,6,0,'PN'),
(60121,'2022-09-15','12:45:00',11,7,0,'PN'),
(60122,'2022-09-15','14:45:00',11,6,0,'PN'),
(60123,'2022-09-15','17:15:00',11,7,0,'PN'),
(60124,'2022-09-15','19:00:00',11,6,0,'PN'),
(60125,'2022-09-15','20:00:00',11,7,0,'PN'),
(60126,'2022-09-16','07:45:00',11,6,0,'PN'),
(60127,'2022-09-16','09:30:00',11,7,0,'PN'),
(60128,'2022-09-16','11:15:00',11,6,0,'PN'),
(60129,'2022-09-16','12:45:00',11,7,0,'PN'),
(60130,'2022-09-16','14:15:00',11,6,0,'PN'),
(60131,'2022-09-16','15:45:00',11,7,0,'PN'),
(60132,'2022-09-16','16:15:00',11,8,0,'PN'),
(60133,'2022-09-16','17:15:00',11,6,0,'PN'),
(60134,'2022-09-16','18:15:00',11,8,0,'PN'),
(60135,'2022-09-16','19:15:00',11,7,0,'PN'),
(60136,'2022-09-16','20:00:00',11,6,0,'PN'),
(60137,'2022-09-16','20:00:00',11,8,0,'PN'),
(60138,'2022-09-17','07:45:00',11,6,0,'PN'),
(60139,'2022-09-17','09:30:00',11,7,0,'PN'),
(60140,'2022-09-17','11:15:00',11,6,0,'PN'),
(60141,'2022-09-17','12:45:00',11,7,0,'PN'),
(60142,'2022-09-17','15:45:00',11,6,0,'PN'),
(60143,'2022-09-17','17:15:00',11,7,0,'PN'),
(60144,'2022-09-17','19:00:00',11,6,0,'PN'),
(60145,'2022-09-17','20:00:00',11,7,0,'PN'),
(60146,'2022-09-18','08:15:00',11,6,0,'PN'),
(60147,'2022-09-18','09:30:00',11,7,0,'PN'),
(60148,'2022-09-18','11:15:00',11,6,0,'PN'),
(60149,'2022-09-18','11:20:00',11,8,0,'PN'),
(60150,'2022-09-18','12:45:00',11,7,0,'PN'),
(60151,'2022-09-18','13:50:00',11,8,0,'PN'),
(60152,'2022-09-18','14:15:00',11,6,0,'PN'),
(60153,'2022-09-18','15:45:00',11,7,0,'PN'),
(60154,'2022-09-18','17:15:00',11,6,0,'PN'),
(60155,'2022-09-18','19:00:00',11,7,0,'PN'),
(60156,'2022-09-18','20:00:00',11,6,0,'PN'),
(60157,'2022-09-19','08:00:00',11,6,0,'PN'),
(60158,'2022-09-19','09:30:00',11,7,0,'PN'),
(60159,'2022-09-19','11:15:00',11,6,0,'PN'),
(60160,'2022-09-19','12:45:00',11,7,0,'PN'),
(60161,'2022-09-19','14:45:00',11,6,0,'PN'),
(60162,'2022-09-19','17:15:00',11,7,0,'PN'),
(60163,'2022-09-19','19:00:00',11,6,0,'PN'),
(60164,'2022-09-19','20:00:00',11,7,0,'PN'),
(60165,'2022-09-20','08:00:00',11,6,0,'PN'),
(60166,'2022-09-20','09:30:00',11,7,0,'PN'),
(60167,'2022-09-20','11:15:00',11,6,0,'PN'),
(60168,'2022-09-20','12:45:00',11,7,0,'PN'),
(60169,'2022-09-20','14:45:00',11,6,0,'PN'),
(60170,'2022-09-20','17:15:00',11,7,0,'PN'),
(60171,'2022-09-20','19:00:00',11,6,0,'PN'),
(60172,'2022-09-20','20:00:00',11,7,0,'PN'),
(60173,'2022-09-21','08:00:00',11,6,0,'PN'),
(60174,'2022-09-21','09:30:00',11,7,0,'PN'),
(60175,'2022-09-21','11:15:00',11,6,0,'PN'),
(60176,'2022-09-21','12:45:00',11,7,0,'PN'),
(60177,'2022-09-21','14:45:00',11,6,0,'PN'),
(60178,'2022-09-21','17:15:00',11,7,0,'PN'),
(60179,'2022-09-21','19:00:00',11,6,0,'PN'),
(60180,'2022-09-21','20:00:00',11,7,0,'PN'),
(60181,'2022-09-22','08:00:00',11,6,0,'PN'),
(60182,'2022-09-22','09:30:00',11,7,0,'PN'),
(60183,'2022-09-22','11:15:00',11,6,0,'PN'),
(60184,'2022-09-22','12:45:00',11,7,0,'PN'),
(60185,'2022-09-22','14:45:00',11,6,0,'PN'),
(60186,'2022-09-22','17:15:00',11,7,0,'PN'),
(60187,'2022-09-22','19:00:00',11,6,0,'PN'),
(60188,'2022-09-22','20:00:00',11,7,0,'PN'),
(60189,'2022-09-23','08:00:00',11,6,0,'PN'),
(60190,'2022-09-23','09:30:00',11,7,0,'PN'),
(60191,'2022-09-23','11:15:00',11,6,0,'PN'),
(60192,'2022-09-23','12:45:00',11,7,0,'PN'),
(60193,'2022-09-23','14:45:00',11,6,0,'PN'),
(60194,'2022-09-23','17:15:00',11,7,0,'PN'),
(60195,'2022-09-23','19:15:00',11,6,0,'PN'),
(60196,'2022-09-23','20:00:00',11,7,0,'PN'),
(60197,'2022-09-24','08:00:00',11,6,0,'HF'),
(60198,'2022-09-24','09:30:00',11,7,0,'HF'),
(60199,'2022-09-24','11:15:00',11,6,0,'HF'),
(60200,'2022-09-24','12:45:00',11,7,0,'HF'),
(60201,'2022-09-24','14:45:00',11,6,0,'HF'),
(60202,'2022-09-24','17:15:00',11,7,0,'HF'),
(60203,'2022-09-24','19:00:00',11,6,0,'HF'),
(60204,'2022-09-24','20:00:00',11,7,0,'HF'),
(60205,'2022-09-25','08:15:00',11,6,0,'HF'),
(60206,'2022-09-25','09:30:00',11,7,0,'HF'),
(60207,'2022-09-25','11:15:00',11,6,0,'HF'),
(60208,'2022-09-25','12:45:00',11,7,0,'HF'),
(60209,'2022-09-25','14:45:00',11,6,0,'HF'),
(60210,'2022-09-25','17:15:00',11,7,0,'HF'),
(60211,'2022-09-25','19:00:00',11,6,0,'HF'),
(60212,'2022-09-25','20:00:00',11,7,0,'HF'),
(60213,'2022-09-26','08:00:00',11,6,0,'PN'),
(60214,'2022-09-26','09:30:00',11,7,0,'PN'),
(60215,'2022-09-26','11:15:00',11,6,0,'PN'),
(60216,'2022-09-26','14:15:00',11,6,0,'PN'),
(60217,'2022-09-26','17:15:00',11,6,0,'PN'),
(60218,'2022-09-26','19:00:00',11,7,0,'PN'),
(60219,'2022-09-26','20:00:00',11,6,0,'PN'),
(60220,'2022-09-27','08:00:00',11,6,0,'PN'),
(60221,'2022-09-27','09:30:00',11,7,0,'PN'),
(60222,'2022-09-27','11:15:00',11,6,0,'PN'),
(60223,'2022-09-27','14:15:00',11,6,0,'PN'),
(60224,'2022-09-27','17:15:00',11,6,0,'PN'),
(60225,'2022-09-27','19:00:00',11,7,0,'PN'),
(60226,'2022-09-27','20:00:00',11,6,0,'PN'),
(60227,'2022-09-28','08:00:00',11,6,0,'PN'),
(60228,'2022-09-28','09:30:00',11,7,0,'PN'),
(60229,'2022-09-28','11:15:00',11,6,0,'PN'),
(60230,'2022-09-28','14:15:00',11,6,0,'PN'),
(60231,'2022-09-28','17:15:00',11,6,0,'PN'),
(60232,'2022-09-28','19:00:00',11,7,0,'PN'),
(60233,'2022-09-28','20:00:00',11,6,0,'PN'),
(60234,'2022-09-29','08:00:00',11,6,0,'PN'),
(60235,'2022-09-29','09:45:00',11,7,0,'PN'),
(60236,'2022-09-29','11:15:00',11,6,0,'PN'),
(60237,'2022-09-29','14:15:00',11,6,0,'PN'),
(60238,'2022-09-29','17:15:00',11,6,0,'PN'),
(60239,'2022-09-29','19:15:00',11,7,0,'PN'),
(60240,'2022-09-29','20:00:00',11,6,0,'PN'),
(60241,'2022-09-30','08:00:00',11,6,0,'PN'),
(60242,'2022-09-30','09:30:00',11,7,0,'PN'),
(60243,'2022-09-30','11:15:00',11,6,0,'PN'),
(60244,'2022-09-30','14:15:00',11,6,0,'PN'),
(60245,'2022-09-30','17:15:00',11,6,0,'PN'),
(60246,'2022-09-30','19:15:00',11,7,0,'PN'),
(60247,'2022-09-30','20:00:00',11,6,0,'PN'),
(60248,'2022-09-01','06:00:00',15,6,0,'PN'),
(60249,'2022-09-01','08:00:00',15,7,0,'PN'),
(60250,'2022-09-01','09:45:00',15,6,0,'PN'),
(60251,'2022-09-01','11:00:00',15,7,0,'PN'),
(60252,'2022-09-01','12:45:00',15,6,0,'PN'),
(60253,'2022-09-01','14:15:00',15,7,0,'PN'),
(60254,'2022-09-01','15:45:00',15,6,0,'PN'),
(60255,'2022-09-01','17:15:00',15,7,0,'PN'),
(60256,'2022-09-01','18:40:00',15,6,0,'PN'),
(60257,'2022-09-02','06:00:00',15,6,0,'PN'),
(60258,'2022-09-02','08:00:00',15,7,0,'PN'),
(60259,'2022-09-02','09:45:00',15,6,0,'PN'),
(60260,'2022-09-02','11:00:00',15,7,0,'PN'),
(60261,'2022-09-02','12:45:00',15,6,0,'PN'),
(60262,'2022-09-02','14:15:00',15,7,0,'PN'),
(60263,'2022-09-02','15:45:00',15,6,0,'PN'),
(60264,'2022-09-02','17:30:00',15,7,0,'PN'),
(60265,'2022-09-02','18:45:00',15,6,0,'PN'),
(60266,'2022-09-03','06:00:00',15,6,0,'HF'),
(60267,'2022-09-03','08:00:00',15,7,0,'HF'),
(60268,'2022-09-03','09:45:00',15,6,0,'HF'),
(60269,'2022-09-03','11:00:00',15,7,0,'HF'),
(60270,'2022-09-03','12:45:00',15,6,0,'HF'),
(60271,'2022-09-03','14:15:00',15,7,0,'HF'),
(60272,'2022-09-03','15:45:00',15,6,0,'HF'),
(60273,'2022-09-03','17:15:00',15,7,0,'HF'),
(60274,'2022-09-03','18:40:00',15,6,0,'HF'),
(60275,'2022-09-04','06:30:00',15,6,0,'HF'),
(60276,'2022-09-04','08:00:00',15,7,0,'HF'),
(60277,'2022-09-04','09:45:00',15,6,0,'HF'),
(60278,'2022-09-04','11:00:00',15,7,0,'HF'),
(60279,'2022-09-04','12:45:00',15,6,0,'HF'),
(60280,'2022-09-04','14:15:00',15,7,0,'HF'),
(60281,'2022-09-04','15:45:00',15,6,0,'HF'),
(60282,'2022-09-04','17:15:00',15,7,0,'HF'),
(60283,'2022-09-04','18:40:00',15,6,0,'HF'),
(60284,'2022-09-05','06:30:00',15,6,0,'PN'),
(60285,'2022-09-05','08:00:00',15,7,0,'PN'),
(60286,'2022-09-05','09:45:00',15,6,0,'PN'),
(60287,'2022-09-05','11:00:00',15,7,0,'PN'),
(60288,'2022-09-05','12:45:00',15,6,0,'PN'),
(60289,'2022-09-05','14:45:00',15,7,0,'PN'),
(60290,'2022-09-05','17:15:00',15,6,0,'PN'),
(60291,'2022-09-05','18:40:00',15,7,0,'PN'),
(60292,'2022-09-06','06:00:00',15,6,0,'PN'),
(60293,'2022-09-06','08:00:00',15,7,0,'PN'),
(60294,'2022-09-06','09:45:00',15,6,0,'PN'),
(60295,'2022-09-06','11:00:00',15,7,0,'PN'),
(60296,'2022-09-06','12:45:00',15,6,0,'PN'),
(60297,'2022-09-06','14:45:00',15,7,0,'PN'),
(60298,'2022-09-06','17:15:00',15,6,0,'PN'),
(60299,'2022-09-06','18:40:00',15,7,0,'PN'),
(60300,'2022-09-07','06:30:00',15,6,0,'PN'),
(60301,'2022-09-07','08:00:00',15,7,0,'PN'),
(60302,'2022-09-07','09:45:00',15,6,0,'PN'),
(60303,'2022-09-07','11:00:00',15,7,0,'PN'),
(60304,'2022-09-07','12:45:00',15,6,0,'PN'),
(60305,'2022-09-07','14:45:00',15,7,0,'PN'),
(60306,'2022-09-07','17:15:00',15,6,0,'PN'),
(60307,'2022-09-07','18:40:00',15,7,0,'PN'),
(60308,'2022-09-08','06:00:00',15,6,0,'PN'),
(60309,'2022-09-08','08:00:00',15,7,0,'PN'),
(60310,'2022-09-08','09:45:00',15,6,0,'PN'),
(60311,'2022-09-08','11:00:00',15,7,0,'PN'),
(60312,'2022-09-08','12:45:00',15,6,0,'PN'),
(60313,'2022-09-08','14:45:00',15,7,0,'PN'),
(60314,'2022-09-08','17:15:00',15,6,0,'PN'),
(60315,'2022-09-08','18:40:00',15,7,0,'PN'),
(60316,'2022-09-09','06:00:00',15,6,0,'PN'),
(60317,'2022-09-09','08:00:00',15,7,0,'PN'),
(60318,'2022-09-09','09:45:00',15,6,0,'PN'),
(60319,'2022-09-09','11:00:00',15,7,0,'PN'),
(60320,'2022-09-09','12:45:00',15,6,0,'PN'),
(60321,'2022-09-09','14:00:00',15,7,0,'PN'),
(60322,'2022-09-09','15:45:00',15,6,0,'PN'),
(60323,'2022-09-09','17:15:00',15,7,1,'PN'),
(60324,'2022-09-09','18:40:00',15,6,0,'PN'),
(60325,'2022-09-10','06:00:00',15,6,0,'HF'),
(60326,'2022-09-10','08:00:00',15,7,0,'HF'),
(60327,'2022-09-10','09:45:00',15,6,0,'HF'),
(60328,'2022-09-10','12:45:00',15,7,0,'HF'),
(60329,'2022-09-10','14:15:00',15,6,0,'HF'),
(60330,'2022-09-10','15:45:00',15,7,0,'HF'),
(60331,'2022-09-10','17:00:00',15,6,0,'HF'),
(60332,'2022-09-10','19:00:00',15,7,0,'HF'),
(60333,'2022-09-11','06:00:00',15,6,0,'HF'),
(60334,'2022-09-11','07:30:00',15,7,0,'HF'),
(60335,'2022-09-11','08:45:00',15,6,0,'HF'),
(60336,'2022-09-11','10:30:00',15,7,0,'HF'),
(60337,'2022-09-11','13:15:00',15,6,0,'HF'),
(60338,'2022-09-11','14:45:00',15,7,0,'HF'),
(60339,'2022-09-11','16:15:00',15,6,0,'HF'),
(60340,'2022-09-11','17:30:00',15,7,1,'HF'),
(60341,'2022-09-11','19:30:00',15,6,0,'HF'),
(60342,'2022-09-12','06:30:00',15,6,0,'PN'),
(60343,'2022-09-12','07:45:00',15,7,0,'PN'),
(60344,'2022-09-12','09:45:00',15,6,0,'PN'),
(60345,'2022-09-12','11:00:00',15,7,0,'PN'),
(60346,'2022-09-12','13:45:00',15,6,0,'PN'),
(60347,'2022-09-12','15:15:00',15,7,0,'PN'),
(60348,'2022-09-12','17:15:00',15,6,0,'PN'),
(60349,'2022-09-12','18:40:00',15,7,1,'PN'),
(60350,'2022-09-13','06:00:00',15,6,0,'PN'),
(60351,'2022-09-13','08:00:00',15,7,0,'PN'),
(60352,'2022-09-13','09:45:00',15,6,0,'PN'),
(60353,'2022-09-13','11:00:00',15,7,0,'PN'),
(60354,'2022-09-13','14:00:00',15,6,0,'PN'),
(60355,'2022-09-13','15:30:00',15,7,0,'PN'),
(60356,'2022-09-13','17:15:00',15,6,0,'PN'),
(60357,'2022-09-13','18:30:00',15,7,0,'PN'),
(60358,'2022-09-14','06:00:00',15,6,0,'PN'),
(60359,'2022-09-14','08:00:00',15,7,0,'PN'),
(60360,'2022-09-14','09:45:00',15,6,0,'PN'),
(60361,'2022-09-14','11:00:00',15,7,0,'PN'),
(60362,'2022-09-14','12:45:00',15,6,0,'PN'),
(60363,'2022-09-14','14:45:00',15,7,0,'PN'),
(60364,'2022-09-14','17:15:00',15,6,0,'PN'),
(60365,'2022-09-14','18:40:00',15,7,0,'PN'),
(60366,'2022-09-15','06:00:00',15,6,0,'PN'),
(60367,'2022-09-15','08:00:00',15,7,0,'PN'),
(60368,'2022-09-15','09:45:00',15,6,0,'PN'),
(60369,'2022-09-15','11:00:00',15,7,0,'PN'),
(60370,'2022-09-15','12:45:00',15,6,0,'PN'),
(60371,'2022-09-15','14:45:00',15,7,0,'PN'),
(60372,'2022-09-15','17:15:00',15,6,0,'PN'),
(60373,'2022-09-15','18:40:00',15,7,0,'PN'),
(60374,'2022-09-16','06:00:00',15,6,0,'PN'),
(60375,'2022-09-16','08:00:00',15,7,0,'PN'),
(60376,'2022-09-16','09:45:00',15,6,0,'PN'),
(60377,'2022-09-16','11:00:00',15,7,0,'PN'),
(60378,'2022-09-16','12:45:00',15,6,0,'PN'),
(60379,'2022-09-16','14:15:00',15,7,0,'PN'),
(60380,'2022-09-16','15:45:00',15,6,0,'PN'),
(60381,'2022-09-16','17:00:00',15,8,0,'PN'),
(60382,'2022-09-16','17:30:00',15,7,0,'PN'),
(60383,'2022-09-16','18:45:00',15,6,0,'PN'),
(60384,'2022-09-16','19:15:00',15,8,0,'PN'),
(60385,'2022-09-17','06:00:00',15,6,0,'PN'),
(60386,'2022-09-17','08:00:00',15,7,0,'PN'),
(60387,'2022-09-17','09:45:00',15,6,0,'PN'),
(60388,'2022-09-17','11:00:00',15,7,0,'PN'),
(60389,'2022-09-17','12:45:00',15,6,0,'PN'),
(60390,'2022-09-17','15:45:00',15,7,0,'PN'),
(60391,'2022-09-17','17:15:00',15,6,0,'PN'),
(60392,'2022-09-17','18:40:00',15,7,0,'PN'),
(60393,'2022-09-18','06:45:00',15,6,0,'PN'),
(60394,'2022-09-18','07:45:00',15,7,0,'PN'),
(60395,'2022-09-18','09:45:00',15,6,0,'PN'),
(60396,'2022-09-18','10:15:00',15,8,0,'PN'),
(60397,'2022-09-18','11:00:00',15,7,0,'PN'),
(60398,'2022-09-18','12:45:00',15,6,0,'PN'),
(60399,'2022-09-18','13:00:00',15,8,0,'PN'),
(60400,'2022-09-18','14:15:00',15,7,0,'PN'),
(60401,'2022-09-18','14:45:00',15,8,0,'PN'),
(60402,'2022-09-18','15:45:00',15,6,0,'PN'),
(60403,'2022-09-18','16:30:00',15,8,0,'PN'),
(60404,'2022-09-18','17:15:00',15,7,0,'PN'),
(60405,'2022-09-18','18:40:00',15,6,0,'PN'),
(60406,'2022-09-19','06:30:00',15,6,0,'PN'),
(60407,'2022-09-19','07:45:00',15,7,0,'PN'),
(60408,'2022-09-19','09:45:00',15,6,0,'PN'),
(60409,'2022-09-19','11:00:00',15,7,0,'PN'),
(60410,'2022-09-19','12:45:00',15,6,0,'PN'),
(60411,'2022-09-19','14:45:00',15,7,0,'PN'),
(60412,'2022-09-19','17:15:00',15,6,0,'PN'),
(60413,'2022-09-19','18:40:00',15,7,0,'PN'),
(60414,'2022-09-20','06:30:00',15,6,0,'PN'),
(60415,'2022-09-20','07:45:00',15,7,0,'PN'),
(60416,'2022-09-20','09:45:00',15,6,0,'PN'),
(60417,'2022-09-20','11:00:00',15,7,0,'PN'),
(60418,'2022-09-20','12:45:00',15,6,0,'PN'),
(60419,'2022-09-20','14:45:00',15,7,0,'PN'),
(60420,'2022-09-20','17:15:00',15,6,0,'PN'),
(60421,'2022-09-20','18:40:00',15,7,0,'PN'),
(60422,'2022-09-21','06:30:00',15,6,0,'PN'),
(60423,'2022-09-21','07:45:00',15,7,0,'PN'),
(60424,'2022-09-21','09:45:00',15,6,0,'PN'),
(60425,'2022-09-21','11:00:00',15,7,0,'PN'),
(60426,'2022-09-21','12:45:00',15,6,0,'PN'),
(60427,'2022-09-21','14:45:00',15,7,0,'PN'),
(60428,'2022-09-21','17:15:00',15,6,0,'PN'),
(60429,'2022-09-21','18:40:00',15,7,0,'PN'),
(60430,'2022-09-22','06:30:00',15,6,0,'PN'),
(60431,'2022-09-22','07:45:00',15,7,0,'PN'),
(60432,'2022-09-22','09:45:00',15,6,0,'PN'),
(60433,'2022-09-22','11:00:00',15,7,0,'PN'),
(60434,'2022-09-22','12:45:00',15,6,0,'PN'),
(60435,'2022-09-22','14:45:00',15,7,0,'PN'),
(60436,'2022-09-22','17:15:00',15,6,0,'PN'),
(60437,'2022-09-22','18:40:00',15,7,0,'PN'),
(60438,'2022-09-23','06:30:00',15,6,0,'PN'),
(60439,'2022-09-23','07:45:00',15,7,0,'PN'),
(60440,'2022-09-23','09:45:00',15,6,0,'PN'),
(60441,'2022-09-23','11:00:00',15,7,0,'PN'),
(60442,'2022-09-23','12:45:00',15,6,0,'PN'),
(60443,'2022-09-23','14:45:00',15,7,0,'PN'),
(60444,'2022-09-23','17:30:00',15,6,0,'PN'),
(60445,'2022-09-23','18:45:00',15,7,0,'PN'),
(60446,'2022-09-24','06:30:00',15,6,0,'HF'),
(60447,'2022-09-24','07:45:00',15,7,0,'HF'),
(60448,'2022-09-24','09:45:00',15,6,0,'HF'),
(60449,'2022-09-24','11:00:00',15,7,0,'HF'),
(60450,'2022-09-24','12:45:00',15,6,0,'HF'),
(60451,'2022-09-24','14:45:00',15,7,0,'HF'),
(60452,'2022-09-24','17:15:00',15,6,0,'HF'),
(60453,'2022-09-24','18:40:00',15,7,0,'HF'),
(60454,'2022-09-25','06:45:00',15,6,0,'HF'),
(60455,'2022-09-25','07:45:00',15,7,0,'HF'),
(60456,'2022-09-25','09:45:00',15,6,0,'HF'),
(60457,'2022-09-25','11:00:00',15,7,0,'HF'),
(60458,'2022-09-25','12:45:00',15,6,0,'HF'),
(60459,'2022-09-25','14:45:00',15,7,0,'HF'),
(60460,'2022-09-25','17:15:00',15,6,0,'HF'),
(60461,'2022-09-25','18:40:00',15,7,0,'HF'),
(60462,'2022-09-26','06:30:00',15,6,0,'PN'),
(60463,'2022-09-26','07:45:00',15,7,0,'PN'),
(60464,'2022-09-26','09:45:00',15,6,0,'PN'),
(60465,'2022-09-26','12:45:00',15,6,0,'PN'),
(60466,'2022-09-26','15:45:00',15,6,0,'PN'),
(60467,'2022-09-26','17:00:00',15,7,0,'PN'),
(60468,'2022-09-26','18:30:00',15,6,0,'PN'),
(60469,'2022-09-27','06:30:00',15,6,0,'PN'),
(60470,'2022-09-27','07:45:00',15,7,0,'PN'),
(60471,'2022-09-27','09:45:00',15,6,0,'PN'),
(60472,'2022-09-27','12:45:00',15,6,0,'PN'),
(60473,'2022-09-27','15:45:00',15,6,0,'PN'),
(60474,'2022-09-27','17:15:00',15,7,0,'PN'),
(60475,'2022-09-27','18:30:00',15,6,0,'PN'),
(60476,'2022-09-28','06:30:00',15,6,0,'PN'),
(60477,'2022-09-28','07:45:00',15,7,0,'PN'),
(60478,'2022-09-28','09:45:00',15,6,0,'PN'),
(60479,'2022-09-28','12:45:00',15,6,0,'PN'),
(60480,'2022-09-28','15:45:00',15,6,0,'PN'),
(60481,'2022-09-28','17:30:00',15,7,0,'PN'),
(60482,'2022-09-28','18:30:00',15,6,0,'PN'),
(60483,'2022-09-29','06:30:00',15,6,0,'PN'),
(60484,'2022-09-29','08:00:00',15,7,0,'PN'),
(60485,'2022-09-29','09:45:00',15,6,0,'PN'),
(60486,'2022-09-29','12:45:00',15,6,0,'PN'),
(60487,'2022-09-29','15:45:00',15,6,0,'PN'),
(60488,'2022-09-29','17:30:00',15,7,0,'PN'),
(60489,'2022-09-29','18:45:00',15,6,0,'PN'),
(60490,'2022-09-30','06:30:00',15,6,0,'PN'),
(60491,'2022-09-30','07:45:00',15,7,0,'PN'),
(60492,'2022-09-30','09:45:00',15,6,0,'PN'),
(60493,'2022-09-30','12:45:00',15,6,0,'PN'),
(60494,'2022-09-30','15:45:00',15,6,0,'PN'),
(60495,'2022-09-30','17:45:00',15,7,0,'PN'),
(60496,'2022-09-30','18:45:00',15,6,0,'PN');
/*!40000 ALTER TABLE `traversee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_billet`
--

DROP TABLE IF EXISTS `type_billet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_billet` (
  `idCategorie` varchar(2) NOT NULL,
  `idTypeBillet` tinyint(3) unsigned NOT NULL,
  `libelleTypeBillet` varchar(100) NOT NULL,
  PRIMARY KEY (`idTypeBillet`,`idCategorie`),
  KEY `lettreCategorie` (`idCategorie`),
  CONSTRAINT `type_billet_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_billet`
--

LOCK TABLES `type_billet` WRITE;
/*!40000 ALTER TABLE `type_billet` DISABLE KEYS */;
INSERT INTO `type_billet` VALUES
('PA',1,'Adulte'),
('VE',1,'Bicyclette '),
('PA',2,'Enfant de 4 à 18 ans'),
('VE',2,'Bicyclette électrique'),
('PA',3,'Enfant -4 ans'),
('VE',3,'Remorque de bicyclette'),
('PA',4,'PMR 50% du plein tarif à partir taux d’invalidité de 50%'),
('VE',4,'Cyclomoteur de 49 cm3 à 125 cm3'),
('PA',5,'PMR accompagnateur 50% du plein tarif si taux d’invalidé de 80%'),
('VE',5,'Scooter et motocyclette de +125 cm3'),
('PA',6,'Chien tenu en laisse'),
('VE',6,'Véhicule C1 (Longueur inférieure à 4,00 m)'),
('VE',7,'Véhicule C2 (Longueur de 4,00 m à 4,39 m )'),
('VE',8,'Véhicule C3 (Longueur de 4,40 m à 4,79 m )'),
('VE',9,'Véhicule C4 (Longueur de supérieure à 4,80 m)'),
('VE',10,'Véhicule C5 (Camping-car, véhicule hauteur de + de 2,10 m , remorque de longueur de + de 5,00 m)'),
('VE',11,'Chargement extérieur 1 (Hauteur de véhicule + galerie chargée inférieure ou égale à 2,10 m)'),
('VE',12,'Chargement extérieur 2 (Hauteur de véhicule + galerie chargée supérieurs à 2,10 m) ou porte-vélos');
/*!40000 ALTER TABLE `type_billet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-07 20:36:37
