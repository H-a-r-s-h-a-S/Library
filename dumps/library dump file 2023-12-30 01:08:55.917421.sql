-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `library`
--

/*!40000 DROP DATABASE IF EXISTS `library`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `library` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `library`;

--
-- Temporary view structure for view `author ages`
--

DROP TABLE IF EXISTS `author ages`;
/*!50001 DROP VIEW IF EXISTS `author ages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `author ages` AS SELECT 
 1 AS `name`,
 1 AS `dob`,
 1 AS `age`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  UNIQUE KEY `UC_AUTHORS_ID` (`id`,`name`,`dob`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--
-- ORDER BY:  `id`,`name`,`dob`

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Gillian Flynn','1971-02-24'),(2,'Ac Bhaktivedanta Swami Prabhupaada','1896-09-01'),(3,'Agatha Christie','1890-09-15'),(4,'Alexandre Dumas','1802-07-24'),(5,'Amish Tripathi','1974-10-18'),(6,'Anand Neelakantan','1973-12-05'),(7,'Anthony Horowitz','1955-04-05'),(8,'Chetan Bhagat','1974-04-22'),(9,'Clive Staples Lewis','1898-11-29'),(10,'Franklin W Dixon','1862-10-04'),(11,'Ian Fleming','1908-05-28'),(12,'J K Rowling','1965-07-31'),(13,'Paulo Coelho','1947-08-24'),(14,'R L Stine','1943-10-08'),(15,'Robin Sharma','1964-06-16'),(16,'Saisuthe','1942-08-20'),(17,'Steve Berry','1955-09-02'),(18,'William Arden','1924-01-15'),(19,'Megan & H. William Stine','1946-11-27'),(20,'Marc Brandel','1919-03-28'),(21,'Peter Lerangis','1955-08-19'),(22,'Robert Arthur','1909-11-10'),(23,'Nick West','1989-01-26'),(24,'M. V. Carey','1925-05-19'),(25,'M.V. Carey','1925-05-19'),(26,'Alex Irvine','1969-03-22'),(27,'Dan Brown','1964-06-22');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `authors born today`
--

DROP TABLE IF EXISTS `authors born today`;
/*!50001 DROP VIEW IF EXISTS `authors born today`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `authors born today` AS SELECT 
 1 AS `name`,
 1 AS `dob`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `name` varchar(100) DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `publisher_id` (`publisher_id`),
  KEY `genre_id` (`genre_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `books_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--
-- ORDER BY:  `id`

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('Gone Girl','9780297859406',1,1,463,2012,1088,1,1,1),('Bhagavad Gita As It Is','9780892131341',2,2,944,1968,1087,2,1,2),('After The Funeral','9780062073822',3,3,304,2011,1086,3,1,3),('A Murder Is Announced','9780062073631',3,3,320,2011,1085,3,1,4),('And Then There Were None','9780062073488',3,3,288,2001,1084,4,1,5),('Appointment With Death','9780006752516',3,3,192,1984,1083,5,1,6),('Big Four','9780006151708',3,3,160,2022,1082,6,1,7),('Black Coffee','9780006511373',3,3,304,1999,1081,4,1,8),('Cat Among The Pigeons','9780006132806',3,3,304,1991,1079,7,1,10),('Crooked House','9780006168645',3,3,288,2002,1078,4,1,11),('Curtain','9780007527601',3,3,238,1975,1077,8,1,12),('Dead Man\'s Folly','9780006151722',3,3,332,2012,1076,9,1,13),('Death On The Nile','9780006130062',3,3,352,2022,1074,7,1,15),('Dumb Witness','9780006137832',3,3,272,1986,1073,5,1,16),('Elephants Can Remember','9780062074034',3,3,198,1984,1072,10,1,17),('Evil Under The Sun','9780006139829',3,3,189,1957,1071,11,1,18),('Halloween Party','9780006161721',3,3,240,1991,1070,5,1,19),('Hercule Poirot\'s Christmas','9780006141266',3,3,256,1992,1069,7,1,20),('Hickory Dickory Dock','9780006170006',3,3,208,1996,1068,7,1,21),('Lord Edgware Dies','9780006165392',3,3,256,1986,1067,5,1,22),('Mrs Mcginty\'s Dead','9780006135265',3,3,192,1974,1066,12,1,23),('Murder In Mesopotamia','9780006128595',3,3,272,1987,1065,5,1,24),('Murder On The Orient Express','9780006137122',3,3,304,2017,1064,7,1,25),('Mysterious Affair At Styles','9783988287755',3,3,320,2023,1063,13,1,26),('Sad Cypress','9780006133087',3,3,256,2007,1061,15,1,28),('Taken At The Flood','9780006168898',3,3,256,1984,1060,5,1,29),('The Clocks','9780006161738',3,3,320,2011,1058,7,1,31),('The Hollow','9780006158219',3,3,272,1984,1057,5,1,32),('The Murder Of Roger Ackroyd','9780006136651',3,3,304,2011,1056,7,1,33),('The Murder On The Links','9783988287748',3,3,224,1985,1055,5,1,34),('The Mystery Of The Blue Train','9780006119838',3,3,384,2013,1054,9,1,35),('Third Girl','9780006151197',3,3,272,2000,1053,5,1,36),('Scion Of Ikshvaku','9789356290792',5,5,378,2015,1051,16,1,38),('Sita Warrior Of Mithila','9789356290914',5,5,376,2022,1050,7,1,39),('Raavan, Enemy Of Aryavarta','9789356290976',5,5,400,2022,1049,7,1,40),('Immortals Of Meluha','9789383260157',5,5,436,2010,1048,16,1,41),('The Secret Of The Nagas','9781780874043',5,5,396,2011,1047,16,1,42),('Oath Of The Vayuputras','9781681445021',5,5,575,2022,1046,7,1,43),('Asura Tale Of The Vanquished','9789381576052',6,5,504,2012,1045,17,1,44),('Ajaya - Roll Of The Dice','9788183225397',6,5,456,2013,1044,17,1,45),('Russian Roulette','9781406360288',7,6,432,2015,1043,18,1,46),('Nightshade','9780593115329',7,6,432,2021,1041,5,1,48),('Stormbreaker','9780142401651',7,6,304,2006,1040,5,1,49),('Point Blank','9780399250262',7,6,320,2006,1039,5,1,50),('Skeleton Key','9780142401026',7,6,368,2006,1038,5,1,51),('Eagle Strike','9780142402924',7,6,368,2006,1037,5,1,52),('Scorpia','9783473585267',7,6,416,2006,1036,5,1,53),('Ark Angel','9780142407387',7,6,352,2007,1035,5,1,54),('Snakehead','9781406360257',7,6,432,2008,1034,5,1,55),('Scorpia Rising','9783473585564',7,6,416,2011,1032,5,1,57),('3 Mistakes Of My Life','9788129113726',8,7,282,2014,1031,20,1,58),('Girl In Room 105','9781542040464',8,7,312,2018,1030,16,1,59),('Revolution 2020','9788129118806',8,7,296,2014,1028,20,1,61),('The Lion, The Witch And The Wardrobe','9780006716631',9,8,208,2008,1026,7,1,63),('Prince Caspian','9780007115563',9,8,240,2000,1025,7,1,64),('The Voyage Of The Dawn Treader','9780006716655',9,8,256,2008,1024,7,1,65),('The Silver Chair','9780006716686',9,8,256,2000,1023,7,1,66),('The Horse And His Boy','9780006716662',9,8,240,2000,1022,7,1,67),('The Magician\'s Nephew','9780007115556',9,8,208,2008,1021,7,1,68),('The Last Battle','9780006716693',9,8,240,2002,1020,7,1,69),('The Tower Treasure','9781557091444',10,9,160,2022,1019,6,1,70),('The House On The Cliff','9780448089027',10,9,192,2000,1018,23,1,71),('The Missing Chums','9780001605329',10,9,192,2017,1016,5,1,73),('Hunting For Hidden Gold','9780001605251',10,9,160,1976,1015,24,1,74),('The Shore Road Mystery','9780006917335',10,9,160,1992,1014,24,1,75),('The Secret Of The Caves','9780006923541',10,9,192,1992,1013,5,1,76),('The Mystery Of Cabin Island','9780006912149',10,9,192,1992,1012,5,1,77),('What Happened At Midnight','9780006910497',10,9,158,1975,1010,25,1,79),('Footprints Under The Window','9780006911449',10,9,160,1992,1008,24,1,81),('The Hidden Harbour Mystery','9780448189147',10,9,219,1935,1006,26,1,83),('The Sinister Signpost','9780006910503',10,9,160,1989,1005,7,1,84),('A Figure In Hiding','9780006928324',10,9,212,1937,1004,26,1,85),('The Secret Warning','9780006928331',10,9,192,1938,1003,26,1,86),('The Twisted Claw','9780006909927',10,9,160,1974,1002,24,1,87),('The Disappearing Floor','9780001605053',10,9,160,1974,1001,11,1,88),('The Mystery Of The Flying Express','9780448189208',10,9,160,1990,1000,27,1,89),('The Clue Of The Broken Blade','9780006925026',10,9,160,1977,999,11,1,90),('The Melted Coins','9780006909101',10,9,160,1974,997,11,1,92),('The Short Wave Mystery','9780006936664',10,9,192,1968,996,26,1,93),('The Secret Panel','9780006928362',10,9,160,1990,995,24,1,94),('The Secret Of Skull Mountain','9780006926559',10,9,192,1975,993,5,1,96),('The Sign Of The Crooked Arrow','9780448189284',10,9,160,1975,992,11,1,97),('The Secret Of The Lost Tunnel','9780006928379',10,9,160,1990,991,24,1,98),('The Wailing Siren Mystery','9780006913979',10,9,192,1951,990,5,1,99),('The Secret Of Wildcat Swamp','9780006925033',10,9,192,1952,989,5,1,100),('The Crisscross Shadow','9780006911456',10,9,192,1953,988,5,1,101),('The Yellow Feather Mystery','9780006912989',10,9,192,1954,987,5,1,102),('The Hooded Hawk Mystery','9780448189345',10,9,192,1955,986,5,1,103),('The Clue In The Embers','9780006910404',10,9,192,1956,985,5,1,104),('The Secret Of Pirates Hill','9780006915669',10,9,192,1957,984,5,1,105),('The Ghost At Skeleton Rock','9780006923091',10,9,192,1958,983,5,1,106),('Mystery At Devil\'s Paw','9780006923084',10,9,192,1959,982,5,1,107),('The Mystery Of The Chinese Junk','9780006921585',10,9,192,1959,981,5,1,108),('The Mystery Of The Desert Giant','9780006909323',10,9,192,1960,980,5,1,109),('The Mystery Of The Aztec Warrior','9780006908128',10,9,192,1964,977,5,1,112),('The Haunted Fort','9780006908142',10,9,192,1964,976,5,1,113),('The Mystery Of Spiral Bridge','9780006925279',10,9,192,1965,975,5,1,114),('The Secret Agent On Flight 101','9780006918677',10,9,192,1967,974,5,1,115),('The Mystery Of The Whale Tattoo','9780006908159',10,9,192,1967,973,5,1,116),('The Artic Patrol Mystery','9780006908135',10,9,160,1977,972,24,1,117),('The Bombay Boomerang','9780006928263',10,9,192,1970,971,5,1,118),('Danger On Vampire Trail','9780006928256',10,9,192,1971,970,5,1,119),('The Shattered Helmet','9780006928287',10,9,192,1973,968,5,1,121),('The Clue Of The Hissing Serpent','9780006928294',10,9,192,1974,967,5,1,122),('The Mysterious Caravan','9780006928249',10,9,192,1975,966,5,1,123),('The Firebird Rocket','9780448410456',10,9,192,1978,964,5,1,125),('The Sting Of The Scorpion','9780006928393',10,9,192,1978,963,5,1,126),('Casino Royale','9781840238433',11,6,224,2023,962,7,1,127),('The Tales Of Beedle The Bard','9781408883099',12,8,128,2008,961,28,1,128),('The Philosopher\'s Stone','9780439362139',12,8,223,1997,960,29,1,129),('The Chamber Of Secrets','9780439064873',12,8,352,2023,959,28,1,130),('The Prisoner Of Azkaban','9780439136358',12,8,464,2018,958,28,1,131),('The Goblet Of Fire','9780439139595',12,8,752,2002,957,28,1,132),('The Order Of The Phoenix','9780545582971',12,8,576,2022,956,28,1,133),('The Half Blood Prince','9780439785969',12,8,672,2005,955,28,1,134),('The Alchemist','9780008283643',13,10,197,2006,952,7,1,137),('Give Yourself Goosebumps Book02 Tick Tock, You\'re Dead','9780590566452',14,11,144,1995,950,31,1,139),('Give Yourself Goosebumps Book03 Trapped In Bat Wing Hall','9780590566469',14,11,176,2015,949,32,1,140),('Give Yourself Goosebumps Book05 Night In Werewolf Woods','9780590673198',14,11,136,1996,947,31,1,142),('Give Yourself Goosebumps Book07 Under The Magician\'s Spell','9780590673211',14,11,136,2015,945,32,1,144),('Give Yourself Goosebumps Book09 The Knight In Screaming Armor','9780590847667',14,11,144,1996,943,31,1,146),('Give Yourself Goosebumps Book10 Diary Of A Mad Mummy','9780590847674',14,11,136,1996,942,31,1,147),('Give Yourself Goosebumps Book11 Deep In The Jungle Of Doom','9780590114035',14,11,144,1996,941,28,1,148),('Give Yourself Goosebumps Book12 Welcome To The Wicked Wax Museum','9780439010061',14,11,137,1996,940,28,1,149),('Give Yourself Goosebumps Book13 Scream Of The Evil Genie','9780439011464',14,11,144,1997,939,28,1,150),('Give Yourself Goosebumps Book14 The Creepy Creations Of Professor Shock','9780590847742',14,11,144,1997,938,31,1,151),('Give Yourself Goosebumps Book15 Please Don\'t Feed The Vampire','9781407157344',14,11,137,1997,937,31,1,152),('Give Yourself Goosebumps Book16 Secret Agent Grandma','9780590847759',14,11,147,2015,936,32,1,153),('Give Yourself Goosebumps Book17 Little Comic Shop Of Horrors','9780590934831',14,11,140,1997,935,31,1,154),('Give Yourself Goosebumps Book18 Attack Of The Beastly Babysitter','9780439995184',14,11,152,1997,934,28,1,155),('Give Yourself Goosebumps Book19 Escape From Camp Run For Your Life','9780439995191',14,11,144,1997,933,28,1,156),('Give Yourself Goosebumps Book20 Toy Terror Batteries Included','9780590934923',14,11,140,1997,932,33,1,157),('Give Yourself Goosebumps Book21 The Twisted Tale Of Tiki Island','9780590935005',14,11,144,2010,931,33,1,158),('Give Yourself Goosebumps Book22 Return To The Carnival Of Horrors','9780590210621',14,11,144,2015,930,32,1,159),('Give Yourself Goosebumps Special Edition03 Trapped In The Circus Of Fear','9780590419208',14,11,144,1998,929,34,1,160),('Who Will Cry When You Die ?','9780006385783',15,12,248,2006,928,35,1,161),('The Monk Who Sold His Ferrari','9780002008594',15,12,224,1999,927,7,1,162),('Kadala Mutthu','9789383053483',16,13,210,2012,925,37,2,164),('The Templar Legacy','9780345476166',17,6,528,2007,924,5,1,165),('Govinda','9780143448112',NULL,NULL,320,2019,923,NULL,NULL,166),('Kaurava','9780143448129',NULL,NULL,400,2013,922,NULL,NULL,167),('Kurukshethra','9789350099957',NULL,NULL,456,2015,921,NULL,NULL,168),('Crime Busters 01 - Hot Wheels','9780394999593',18,9,144,1989,920,40,1,169),('Crime Busters 03 - Rough Stuff','9780006939337',NULL,NULL,144,1990,918,NULL,NULL,171),('Crime Busters 04 - Funny Business','9780006939344',NULL,NULL,144,1990,917,NULL,NULL,172),('Crime Busters 06 - Thriller Diller','9780394929361',19,9,144,1989,915,40,1,174),('Crime Busters 08 - Shoot The Works','9780679801573',NULL,NULL,134,1990,913,NULL,NULL,176),('Crime Busters 10 - Long Shot','9780006939474',19,9,144,1991,911,7,1,178),('Crime Busters 11 - Fatal Error','9780679905875',NULL,NULL,140,1990,910,NULL,NULL,179),('The Three Investigators 01 - The Secret Of Terror Castle','9780679811763',22,9,192,1991,909,40,1,180),('The Three Investigators 02 - The Mystery Of The Stuttering Parrot','9780679811718',22,9,192,1991,908,40,1,181),('The Three Investigators 03 - The Mystery Of The Whispering Mummy','9780394864037',22,9,192,1985,907,40,1,182),('The Three Investigators 04 - The Mystery Of The Green Ghost','9780394864044',22,9,160,1985,906,40,1,183),('The Three Investigators 06 - The Secret Of Skeleton Island','9780394864068',22,9,160,1985,904,40,1,185),('The Three Investigators 07 - The Mystery Of The Fiery Eye','9780394864075',22,9,176,1984,903,40,1,186),('The Three Investigators 08 - The Mystery Of The Silver Spider','9780394864082',22,9,176,1985,902,40,1,187),('The Three Investigators 09 - The Mystery Of The Screaming Clock','9780679821731',22,9,192,1991,901,40,1,188),('The Three Investigators 10 - The Mystery Of The Moaning Cave','9788189632007',18,9,168,1992,900,40,1,189),('The Three Investigators 13 - The Secret Of The Crooked Cat','9780394864136',18,9,168,1985,897,40,1,192),('The Three Investigators 14 - The Mystery Of The Coughing Dragon','9780006919254',23,9,202,1970,896,28,1,193),('The Three Investigators 15 - The Mystery Of The Flaming Footprints','9780006921042',24,9,160,1982,895,7,1,194),('The Three Investigators 17 - The Mystery Of The Singing Serpent','9780394824086',24,9,183,1972,894,41,1,195),('The Three Investigators 18 - The Mystery Of The Shrinking House','9780394824826',18,9,165,1985,893,41,1,196),('The Three Investigators 19 - The Secret Of Phantom Lake','9780394864198',18,9,141,1984,892,40,1,197),('The Three Investigators 23 - The Mystery Of The Invisible Dog','9780394864235',24,9,148,1984,888,40,1,201),('The Three Investigators 24 - The Mystery Of The Death Trap Mine','9780394864242',24,9,151,1985,887,40,1,202),('The Three Investigators 25 - The Mystery Of The Dancing Devil','9780394864259',18,9,134,1984,886,40,1,203),('The Three Investigators 26 - The Mystery Of The Headless Horse','9780394848617',18,9,144,1981,885,40,1,204),('The Three Investigators 28 - The Mystery Of The Deadly Double','9780394839028',18,9,147,1978,883,40,1,206),('The Three Investigators 29 - The Mystery Of The Sinister Scarecrow','9780394864297',24,9,151,1985,882,40,1,207),('The Three Investigators 30 - The Secret Of The Shark Reef','9780394842493',20,9,181,1979,881,40,1,208),('The Three Investigators 32 - The Mystery Of The Blazing Cliffs','9780394845043',24,9,180,1981,879,40,1,210),('The Three Investigators 34 - The Mystery Of Wandering Caveman','9780006925095',24,9,160,1985,877,40,1,212),('The Three Investigators 37 - The Mystery Of The Two-Toed Pigeon','9780394867809',20,9,160,1984,874,40,1,215),('The Three Investigators 38 - The Mystery Of The Smashing Glass','9780394865508',18,9,165,1984,873,40,1,216),('The Three Investigators 39 - The Mystery Of The Trail Of Terror','9780679821724',25,9,192,1991,872,40,1,217),('The Three Investigators 40 - The Mystery Of The Rogues\' Reunion','9780394969206',20,9,176,1985,871,40,1,218),('The Three Investigators 42 - The Mystery Of Wreckers\' Rock','9780394873756',18,9,184,1986,869,40,1,220),('Digital Fortress','9780312944926',27,14,544,2008,866,43,1,223),('The Da Vinci Code','9780307474278',27,14,464,2003,865,44,1,224),('Gone Girl','9780297859406',1,1,463,2012,864,1,1,225),('Bhagavad Gita As It Is','9780892131341',2,2,944,1968,863,2,1,226),('After The Funeral','9780062073822',3,3,304,2011,862,3,1,227),('A Murder Is Announced','9780062073631',3,3,320,2011,861,3,1,228),('And Then There Were None','9780062073488',3,3,288,2001,860,4,1,229),('Appointment With Death','9780006752516',3,3,192,1984,859,5,1,230),('Big Four','9780006151708',3,3,160,2022,858,6,1,231),('Black Coffee','9780006511373',3,3,304,1999,857,4,1,232),('Cat Among The Pigeons','9780006132806',3,3,304,1991,855,7,1,234),('Crooked House','9780006168645',3,3,288,2002,854,4,1,235),('Curtain','9780007527601',3,3,238,1975,853,8,1,236),('Dead Man\'s Folly','9780006151722',3,3,332,2012,852,9,1,237),('Death On The Nile','9780006130062',3,3,352,2022,850,7,1,239),('Dumb Witness','9780006137832',3,3,272,1986,849,5,1,240),('Elephants Can Remember','9780062074034',3,3,198,1984,848,10,1,241),('Evil Under The Sun','9780006139829',3,3,189,1957,847,11,1,242),('Halloween Party','9780006161721',3,3,240,1991,846,5,1,243),('Hercule Poirot\'s Christmas','9780006141266',3,3,256,1992,845,7,1,244),('Hickory Dickory Dock','9780006170006',3,3,208,1996,844,7,1,245),('Lord Edgware Dies','9780006165392',3,3,256,1986,843,5,1,246),('Mrs Mcginty\'s Dead','9780006135265',3,3,192,1974,842,12,1,247),('Murder In Mesopotamia','9780006128595',3,3,272,1987,841,5,1,248),('Murder On The Orient Express','9780006137122',3,3,304,2017,840,7,1,249),('Mysterious Affair At Styles','9783988287755',3,3,320,2023,839,13,1,250),('Sad Cypress','9780006133087',3,3,256,2007,837,15,1,252),('Taken At The Flood','9780006168898',3,3,256,1984,836,5,1,253),('The Clocks','9780006161738',3,3,320,2011,834,7,1,255),('The Hollow','9780006158219',3,3,272,1984,833,5,1,256),('The Murder Of Roger Ackroyd','9780006136651',3,3,304,2011,832,7,1,257),('The Murder On The Links','9783988287748',3,3,224,1985,831,5,1,258),('The Mystery Of The Blue Train','9780006119838',3,3,384,2013,830,9,1,259),('Third Girl','9780006151197',3,3,272,2000,829,5,1,260),('Scion Of Ikshvaku','9789356290792',5,5,378,2015,827,16,1,262),('Sita Warrior Of Mithila','9789356290914',5,5,376,2022,826,7,1,263),('Raavan, Enemy Of Aryavarta','9789356290976',5,5,400,2022,825,7,1,264),('Immortals Of Meluha','9789383260157',5,5,436,2010,824,16,1,265),('The Secret Of The Nagas','9781780874043',5,5,396,2011,823,16,1,266),('Oath Of The Vayuputras','9781681445021',5,5,575,2022,822,7,1,267),('Asura Tale Of The Vanquished','9789381576052',6,5,504,2012,821,17,1,268),('Ajaya - Roll Of The Dice','9788183225397',6,5,456,2013,820,17,1,269),('Russian Roulette','9781406360288',7,6,432,2015,819,18,1,270),('Nightshade','9780593115329',7,6,432,2021,817,5,1,272),('Stormbreaker','9780142401651',7,6,304,2006,816,5,1,273),('Point Blank','9780399250262',7,6,320,2006,815,5,1,274),('Skeleton Key','9780142401026',7,6,368,2006,814,5,1,275),('Eagle Strike','9780142402924',7,6,368,2006,813,5,1,276),('Scorpia','9783473585267',7,6,416,2006,812,5,1,277),('Ark Angel','9780142407387',7,6,352,2007,811,5,1,278),('Snakehead','9781406360257',7,6,432,2008,810,5,1,279),('Scorpia Rising','9783473585564',7,6,416,2011,808,5,1,281),('3 Mistakes Of My Life','9788129113726',8,7,282,2014,807,20,1,282),('Girl In Room 105','9781542040464',8,7,312,2018,806,16,1,283),('Revolution 2020','9788129118806',8,7,296,2014,804,20,1,285),('The Lion, The Witch And The Wardrobe','9780006716631',9,8,208,2008,802,7,1,287),('Prince Caspian','9780007115563',9,8,240,2000,801,7,1,288),('The Voyage Of The Dawn Treader','9780006716655',9,8,256,2008,800,7,1,289),('The Silver Chair','9780006716686',9,8,256,2000,799,7,1,290),('The Horse And His Boy','9780006716662',9,8,240,2000,798,7,1,291),('The Magician\'s Nephew','9780007115556',9,8,208,2008,797,7,1,292),('The Last Battle','9780006716693',9,8,240,2002,796,7,1,293),('The Tower Treasure','9781557091444',10,9,160,2022,795,6,1,294),('The House On The Cliff','9780448089027',10,9,192,2000,794,23,1,295),('The Missing Chums','9780001605329',10,9,192,2017,792,5,1,297),('Hunting For Hidden Gold','9780001605251',10,9,160,1976,791,24,1,298),('The Shore Road Mystery','9780006917335',10,9,160,1992,790,24,1,299),('The Secret Of The Caves','9780006923541',10,9,192,1992,789,5,1,300),('The Mystery Of Cabin Island','9780006912149',10,9,192,1992,788,5,1,301),('What Happened At Midnight','9780006910497',10,9,158,1975,786,25,1,303),('Footprints Under The Window','9780006911449',10,9,160,1992,784,24,1,305),('The Hidden Harbour Mystery','9780448189147',10,9,219,1935,782,26,1,307),('The Sinister Signpost','9780006910503',10,9,160,1989,781,7,1,308),('A Figure In Hiding','9780006928324',10,9,212,1937,780,26,1,309),('The Secret Warning','9780006928331',10,9,192,1938,779,26,1,310),('The Twisted Claw','9780006909927',10,9,160,1974,778,24,1,311),('The Disappearing Floor','9780001605053',10,9,160,1974,777,11,1,312),('The Mystery Of The Flying Express','9780448189208',10,9,160,1990,776,27,1,313),('The Clue Of The Broken Blade','9780006925026',10,9,160,1977,775,11,1,314),('The Melted Coins','9780006909101',10,9,160,1974,773,11,1,316),('The Short Wave Mystery','9780006936664',10,9,192,1968,772,26,1,317),('The Secret Panel','9780006928362',10,9,160,1990,771,24,1,318),('The Secret Of Skull Mountain','9780006926559',10,9,192,1975,769,5,1,320),('The Sign Of The Crooked Arrow','9780448189284',10,9,160,1975,768,11,1,321),('The Secret Of The Lost Tunnel','9780006928379',10,9,160,1990,767,24,1,322),('The Wailing Siren Mystery','9780006913979',10,9,192,1951,766,5,1,323),('The Secret Of Wildcat Swamp','9780006925033',10,9,192,1952,765,5,1,324),('The Crisscross Shadow','9780006911456',10,9,192,1953,764,5,1,325),('The Yellow Feather Mystery','9780006912989',10,9,192,1954,763,5,1,326),('The Hooded Hawk Mystery','9780448189345',10,9,192,1955,762,5,1,327),('The Clue In The Embers','9780006910404',10,9,192,1956,761,5,1,328),('The Secret Of Pirates Hill','9780006915669',10,9,192,1957,760,5,1,329),('The Ghost At Skeleton Rock','9780006923091',10,9,192,1958,759,5,1,330),('Mystery At Devil\'s Paw','9780006923084',10,9,192,1959,758,5,1,331),('The Mystery Of The Chinese Junk','9780006921585',10,9,192,1959,757,5,1,332),('The Mystery Of The Desert Giant','9780006909323',10,9,192,1960,756,5,1,333),('The Mystery Of The Aztec Warrior','9780006908128',10,9,192,1964,753,5,1,336),('The Haunted Fort','9780006908142',10,9,192,1964,752,5,1,337),('The Mystery Of Spiral Bridge','9780006925279',10,9,192,1965,751,5,1,338),('The Secret Agent On Flight 101','9780006918677',10,9,192,1967,750,5,1,339),('The Mystery Of The Whale Tattoo','9780006908159',10,9,192,1967,749,5,1,340),('The Artic Patrol Mystery','9780006908135',10,9,160,1977,748,24,1,341),('The Bombay Boomerang','9780006928263',10,9,192,1970,747,5,1,342),('Danger On Vampire Trail','9780006928256',10,9,192,1971,746,5,1,343),('The Shattered Helmet','9780006928287',10,9,192,1973,744,5,1,345),('The Clue Of The Hissing Serpent','9780006928294',10,9,192,1974,743,5,1,346),('The Mysterious Caravan','9780006928249',10,9,192,1975,742,5,1,347),('The Firebird Rocket','9780448410456',10,9,192,1978,740,5,1,349),('The Sting Of The Scorpion','9780006928393',10,9,192,1978,739,5,1,350),('Casino Royale','9781840238433',11,6,224,2023,738,7,1,351),('The Tales Of Beedle The Bard','9781408883099',12,8,128,2008,737,28,1,352),('The Philosopher\'s Stone','9780439362139',12,8,223,1997,736,29,1,353),('The Chamber Of Secrets','9780439064873',12,8,352,2023,735,28,1,354),('The Prisoner Of Azkaban','9780439136358',12,8,464,2018,734,28,1,355),('The Goblet Of Fire','9780439139595',12,8,752,2002,733,28,1,356),('The Order Of The Phoenix','9780545582971',12,8,576,2022,732,28,1,357),('The Half Blood Prince','9780439785969',12,8,672,2005,731,28,1,358),('The Alchemist','9780008283643',13,10,197,2006,728,7,1,361),('Give Yourself Goosebumps Book02 Tick Tock, You\'re Dead','9780590566452',14,11,144,1995,726,31,1,363),('Give Yourself Goosebumps Book03 Trapped In Bat Wing Hall','9780590566469',14,11,176,2015,725,32,1,364),('Give Yourself Goosebumps Book05 Night In Werewolf Woods','9780590673198',14,11,136,1996,723,31,1,366),('Give Yourself Goosebumps Book07 Under The Magician\'s Spell','9780590673211',14,11,136,2015,721,32,1,368),('Give Yourself Goosebumps Book09 The Knight In Screaming Armor','9780590847667',14,11,144,1996,719,31,1,370),('Give Yourself Goosebumps Book10 Diary Of A Mad Mummy','9780590847674',14,11,136,1996,718,31,1,371),('Give Yourself Goosebumps Book11 Deep In The Jungle Of Doom','9780590114035',14,11,144,1996,717,28,1,372),('Give Yourself Goosebumps Book12 Welcome To The Wicked Wax Museum','9780439010061',14,11,137,1996,716,28,1,373),('Give Yourself Goosebumps Book13 Scream Of The Evil Genie','9780439011464',14,11,144,1997,715,28,1,374),('Give Yourself Goosebumps Book14 The Creepy Creations Of Professor Shock','9780590847742',14,11,144,1997,714,31,1,375),('Give Yourself Goosebumps Book15 Please Don\'t Feed The Vampire','9781407157344',14,11,137,1997,713,31,1,376),('Give Yourself Goosebumps Book16 Secret Agent Grandma','9780590847759',14,11,147,2015,712,32,1,377),('Give Yourself Goosebumps Book17 Little Comic Shop Of Horrors','9780590934831',14,11,140,1997,711,31,1,378),('Give Yourself Goosebumps Book18 Attack Of The Beastly Babysitter','9780439995184',14,11,152,1997,710,28,1,379),('Give Yourself Goosebumps Book19 Escape From Camp Run For Your Life','9780439995191',14,11,144,1997,709,28,1,380),('Give Yourself Goosebumps Book20 Toy Terror Batteries Included','9780590934923',14,11,140,1997,708,33,1,381),('Give Yourself Goosebumps Book21 The Twisted Tale Of Tiki Island','9780590935005',14,11,144,2010,707,33,1,382),('Give Yourself Goosebumps Book22 Return To The Carnival Of Horrors','9780590210621',14,11,144,2015,706,32,1,383),('Give Yourself Goosebumps Special Edition03 Trapped In The Circus Of Fear','9780590419208',14,11,144,1998,705,34,1,384),('Who Will Cry When You Die ?','9780006385783',15,12,248,2006,704,35,1,385),('The Monk Who Sold His Ferrari','9780002008594',15,12,224,1999,703,7,1,386),('Kadala Mutthu','9789383053483',16,13,210,2012,701,37,2,388),('The Templar Legacy','9780345476166',17,6,528,2007,700,5,1,389),('Crime Busters 01 - Hot Wheels','9780394999593',18,9,144,1989,699,40,1,390),('Crime Busters 06 - Thriller Diller','9780394929361',19,9,144,1989,696,40,1,393),('Crime Busters 10 - Long Shot','9780006939474',19,9,144,1991,694,7,1,395),('The Three Investigators 01 - The Secret Of Terror Castle','9780679811763',22,9,192,1991,693,40,1,396),('The Three Investigators 02 - The Mystery Of The Stuttering Parrot','9780679811718',22,9,192,1991,692,40,1,397),('The Three Investigators 03 - The Mystery Of The Whispering Mummy','9780394864037',22,9,192,1985,691,40,1,398),('The Three Investigators 04 - The Mystery Of The Green Ghost','9780394864044',22,9,160,1985,690,40,1,399),('The Three Investigators 06 - The Secret Of Skeleton Island','9780394864068',22,9,160,1985,688,40,1,401),('The Three Investigators 07 - The Mystery Of The Fiery Eye','9780394864075',22,9,176,1984,687,40,1,402),('The Three Investigators 08 - The Mystery Of The Silver Spider','9780394864082',22,9,176,1985,686,40,1,403),('The Three Investigators 09 - The Mystery Of The Screaming Clock','9780679821731',22,9,192,1991,685,40,1,404),('The Three Investigators 10 - The Mystery Of The Moaning Cave','9788189632007',18,9,168,1992,684,40,1,405),('The Three Investigators 13 - The Secret Of The Crooked Cat','9780394864136',18,9,168,1985,681,40,1,408),('The Three Investigators 14 - The Mystery Of The Coughing Dragon','9780006919254',23,9,202,1970,680,28,1,409),('The Three Investigators 15 - The Mystery Of The Flaming Footprints','9780006921042',24,9,160,1982,679,7,1,410),('The Three Investigators 17 - The Mystery Of The Singing Serpent','9780394824086',24,9,183,1972,678,41,1,411),('The Three Investigators 18 - The Mystery Of The Shrinking House','9780394824826',18,9,165,1985,677,41,1,412),('The Three Investigators 19 - The Secret Of Phantom Lake','9780394864198',18,9,141,1984,676,40,1,413),('The Three Investigators 23 - The Mystery Of The Invisible Dog','9780394864235',24,9,148,1984,672,40,1,417),('The Three Investigators 24 - The Mystery Of The Death Trap Mine','9780394864242',24,9,151,1985,671,40,1,418),('The Three Investigators 25 - The Mystery Of The Dancing Devil','9780394864259',18,9,134,1984,670,40,1,419),('The Three Investigators 26 - The Mystery Of The Headless Horse','9780394848617',18,9,144,1981,669,40,1,420),('The Three Investigators 28 - The Mystery Of The Deadly Double','9780394839028',18,9,147,1978,667,40,1,422),('The Three Investigators 29 - The Mystery Of The Sinister Scarecrow','9780394864297',24,9,151,1985,666,40,1,423),('The Three Investigators 30 - The Secret Of The Shark Reef','9780394842493',20,9,181,1979,665,40,1,424),('The Three Investigators 32 - The Mystery Of The Blazing Cliffs','9780394845043',24,9,180,1981,663,40,1,426),('The Three Investigators 34 - The Mystery Of Wandering Caveman','9780006925095',24,9,160,1985,661,40,1,428),('The Three Investigators 37 - The Mystery Of The Two-Toed Pigeon','9780394867809',20,9,160,1984,658,40,1,431),('The Three Investigators 38 - The Mystery Of The Smashing Glass','9780394865508',18,9,165,1984,657,40,1,432),('The Three Investigators 39 - The Mystery Of The Trail Of Terror','9780679821724',25,9,192,1991,656,40,1,433),('The Three Investigators 40 - The Mystery Of The Rogues\' Reunion','9780394969206',20,9,176,1985,655,40,1,434),('The Three Investigators 42 - The Mystery Of Wreckers\' Rock','9780394873756',18,9,184,1986,653,40,1,436),('Digital Fortress','9780312944926',27,14,544,2008,650,43,1,439),('The Da Vinci Code','9780307474278',27,14,464,2003,649,44,1,440),('Gone Girl','9780297859406',1,1,463,2012,648,1,1,441),('Bhagavad Gita As It Is','9780892131341',2,2,944,1968,647,2,1,442),('After The Funeral','9780062073822',3,3,304,2011,646,3,1,443),('A Murder Is Announced','9780062073631',3,3,320,2011,645,3,1,444),('And Then There Were None','9780062073488',3,3,288,2001,644,4,1,445),('Appointment With Death','9780006752516',3,3,192,1984,643,5,1,446),('Big Four','9780006151708',3,3,160,2022,642,6,1,447),('Black Coffee','9780006511373',3,3,304,1999,641,4,1,448),('Cat Among The Pigeons','9780006132806',3,3,304,1991,639,7,1,450),('Crooked House','9780006168645',3,3,288,2002,638,4,1,451),('Curtain','9780007527601',3,3,238,1975,637,8,1,452),('Dead Man\'s Folly','9780006151722',3,3,332,2012,636,9,1,453),('Death On The Nile','9780006130062',3,3,352,2022,634,7,1,455),('Dumb Witness','9780006137832',3,3,272,1986,633,5,1,456),('Elephants Can Remember','9780062074034',3,3,198,1984,632,10,1,457),('Evil Under The Sun','9780006139829',3,3,189,1957,631,11,1,458),('Halloween Party','9780006161721',3,3,240,1991,630,5,1,459),('Hercule Poirot\'s Christmas','9780006141266',3,3,256,1992,629,7,1,460),('Hickory Dickory Dock','9780006170006',3,3,208,1996,628,7,1,461),('Lord Edgware Dies','9780006165392',3,3,256,1986,627,5,1,462),('Mrs Mcginty\'s Dead','9780006135265',3,3,192,1974,626,12,1,463),('Murder In Mesopotamia','9780006128595',3,3,272,1987,625,5,1,464),('Murder On The Orient Express','9780006137122',3,3,304,2017,624,7,1,465),('Mysterious Affair At Styles','9783988287755',3,3,320,2023,623,13,1,466),('Sad Cypress','9780006133087',3,3,256,2007,621,15,1,468),('Taken At The Flood','9780006168898',3,3,256,1984,620,5,1,469),('The Clocks','9780006161738',3,3,320,2011,618,7,1,471),('The Hollow','9780006158219',3,3,272,1984,617,5,1,472),('The Murder Of Roger Ackroyd','9780006136651',3,3,304,2011,616,7,1,473),('The Murder On The Links','9783988287748',3,3,224,1985,615,5,1,474),('The Mystery Of The Blue Train','9780006119838',3,3,384,2013,614,9,1,475),('Third Girl','9780006151197',3,3,272,2000,613,5,1,476),('Scion Of Ikshvaku','9789356290792',5,5,378,2015,611,16,1,478),('Sita Warrior Of Mithila','9789356290914',5,5,376,2022,610,7,1,479),('Raavan, Enemy Of Aryavarta','9789356290976',5,5,400,2022,609,7,1,480),('Immortals Of Meluha','9789383260157',5,5,436,2010,608,16,1,481),('The Secret Of The Nagas','9781780874043',5,5,396,2011,607,16,1,482),('Oath Of The Vayuputras','9781681445021',5,5,575,2022,606,7,1,483),('Asura Tale Of The Vanquished','9789381576052',6,5,504,2012,605,17,1,484),('Ajaya - Roll Of The Dice','9788183225397',6,5,456,2013,604,17,1,485),('Russian Roulette','9781406360288',7,6,432,2015,603,18,1,486),('Nightshade','9780593115329',7,6,432,2021,601,5,1,488),('Stormbreaker','9780142401651',7,6,304,2006,600,5,1,489),('Point Blank','9780399250262',7,6,320,2006,599,5,1,490),('Skeleton Key','9780142401026',7,6,368,2006,598,5,1,491),('Eagle Strike','9780142402924',7,6,368,2006,597,5,1,492),('Scorpia','9783473585267',7,6,416,2006,596,5,1,493),('Ark Angel','9780142407387',7,6,352,2007,595,5,1,494),('Snakehead','9781406360257',7,6,432,2008,594,5,1,495),('Scorpia Rising','9783473585564',7,6,416,2011,592,5,1,497),('3 Mistakes Of My Life','9788129113726',8,7,282,2014,591,20,1,498),('Girl In Room 105','9781542040464',8,7,312,2018,590,16,1,499),('Revolution 2020','9788129118806',8,7,296,2014,588,20,1,501),('The Lion, The Witch And The Wardrobe','9780006716631',9,8,208,2008,586,7,1,503),('Prince Caspian','9780007115563',9,8,240,2000,585,7,1,504),('The Voyage Of The Dawn Treader','9780006716655',9,8,256,2008,584,7,1,505),('The Silver Chair','9780006716686',9,8,256,2000,583,7,1,506),('The Horse And His Boy','9780006716662',9,8,240,2000,582,7,1,507),('The Magician\'s Nephew','9780007115556',9,8,208,2008,581,7,1,508),('The Last Battle','9780006716693',9,8,240,2002,580,7,1,509),('The Tower Treasure','9781557091444',10,9,160,2022,579,6,1,510),('The House On The Cliff','9780448089027',10,9,192,2000,578,23,1,511),('The Missing Chums','9780001605329',10,9,192,2017,576,5,1,513),('Hunting For Hidden Gold','9780001605251',10,9,160,1976,575,24,1,514),('The Shore Road Mystery','9780006917335',10,9,160,1992,574,24,1,515),('The Secret Of The Caves','9780006923541',10,9,192,1992,573,5,1,516),('The Mystery Of Cabin Island','9780006912149',10,9,192,1992,572,5,1,517),('What Happened At Midnight','9780006910497',10,9,158,1975,570,25,1,519),('Footprints Under The Window','9780006911449',10,9,160,1992,568,24,1,521),('The Hidden Harbour Mystery','9780448189147',10,9,219,1935,566,26,1,523),('The Sinister Signpost','9780006910503',10,9,160,1989,565,7,1,524),('A Figure In Hiding','9780006928324',10,9,212,1937,564,26,1,525),('The Secret Warning','9780006928331',10,9,192,1938,563,26,1,526),('The Twisted Claw','9780006909927',10,9,160,1974,562,24,1,527),('The Disappearing Floor','9780001605053',10,9,160,1974,561,11,1,528),('The Mystery Of The Flying Express','9780448189208',10,9,160,1990,560,27,1,529),('The Clue Of The Broken Blade','9780006925026',10,9,160,1977,559,11,1,530),('The Melted Coins','9780006909101',10,9,160,1974,557,11,1,532),('The Short Wave Mystery','9780006936664',10,9,192,1968,556,26,1,533),('The Secret Panel','9780006928362',10,9,160,1990,555,24,1,534),('The Secret Of Skull Mountain','9780006926559',10,9,192,1975,553,5,1,536),('The Sign Of The Crooked Arrow','9780448189284',10,9,160,1975,552,11,1,537),('The Secret Of The Lost Tunnel','9780006928379',10,9,160,1990,551,24,1,538),('The Wailing Siren Mystery','9780006913979',10,9,192,1951,550,5,1,539),('The Secret Of Wildcat Swamp','9780006925033',10,9,192,1952,549,5,1,540),('The Crisscross Shadow','9780006911456',10,9,192,1953,548,5,1,541),('The Yellow Feather Mystery','9780006912989',10,9,192,1954,547,5,1,542),('The Hooded Hawk Mystery','9780448189345',10,9,192,1955,546,5,1,543),('The Clue In The Embers','9780006910404',10,9,192,1956,545,5,1,544),('The Secret Of Pirates Hill','9780006915669',10,9,192,1957,544,5,1,545),('The Ghost At Skeleton Rock','9780006923091',10,9,192,1958,543,5,1,546),('Mystery At Devil\'s Paw','9780006923084',10,9,192,1959,542,5,1,547),('The Mystery Of The Chinese Junk','9780006921585',10,9,192,1959,541,5,1,548),('The Mystery Of The Desert Giant','9780006909323',10,9,192,1960,540,5,1,549),('The Mystery Of The Aztec Warrior','9780006908128',10,9,192,1964,537,5,1,552),('The Haunted Fort','9780006908142',10,9,192,1964,536,5,1,553),('The Mystery Of Spiral Bridge','9780006925279',10,9,192,1965,535,5,1,554),('The Secret Agent On Flight 101','9780006918677',10,9,192,1967,534,5,1,555),('The Mystery Of The Whale Tattoo','9780006908159',10,9,192,1967,533,5,1,556),('The Artic Patrol Mystery','9780006908135',10,9,160,1977,532,24,1,557),('The Bombay Boomerang','9780006928263',10,9,192,1970,531,5,1,558),('Danger On Vampire Trail','9780006928256',10,9,192,1971,530,5,1,559),('The Shattered Helmet','9780006928287',10,9,192,1973,528,5,1,561),('The Clue Of The Hissing Serpent','9780006928294',10,9,192,1974,527,5,1,562),('The Mysterious Caravan','9780006928249',10,9,192,1975,526,5,1,563),('The Firebird Rocket','9780448410456',10,9,192,1978,524,5,1,565),('The Sting Of The Scorpion','9780006928393',10,9,192,1978,523,5,1,566),('Casino Royale','9781840238433',11,6,224,2023,522,7,1,567),('The Tales Of Beedle The Bard','9781408883099',12,8,128,2008,521,28,1,568),('The Philosopher\'s Stone','9780439362139',12,8,223,1997,520,29,1,569),('The Chamber Of Secrets','9780439064873',12,8,352,2023,519,28,1,570),('The Prisoner Of Azkaban','9780439136358',12,8,464,2018,518,28,1,571),('The Goblet Of Fire','9780439139595',12,8,752,2002,517,28,1,572),('The Order Of The Phoenix','9780545582971',12,8,576,2022,516,28,1,573),('The Half Blood Prince','9780439785969',12,8,672,2005,515,28,1,574),('The Alchemist','9780008283643',13,10,197,2006,512,7,1,577),('Give Yourself Goosebumps Book02 Tick Tock, You\'re Dead','9780590566452',14,11,144,1995,510,31,1,579),('Give Yourself Goosebumps Book03 Trapped In Bat Wing Hall','9780590566469',14,11,176,2015,509,32,1,580),('Give Yourself Goosebumps Book05 Night In Werewolf Woods','9780590673198',14,11,136,1996,507,31,1,582),('Give Yourself Goosebumps Book07 Under The Magician\'s Spell','9780590673211',14,11,136,2015,505,32,1,584),('Give Yourself Goosebumps Book09 The Knight In Screaming Armor','9780590847667',14,11,144,1996,503,31,1,586),('Give Yourself Goosebumps Book10 Diary Of A Mad Mummy','9780590847674',14,11,136,1996,502,31,1,587),('Give Yourself Goosebumps Book11 Deep In The Jungle Of Doom','9780590114035',14,11,144,1996,501,28,1,588),('Give Yourself Goosebumps Book12 Welcome To The Wicked Wax Museum','9780439010061',14,11,137,1996,500,28,1,589),('Give Yourself Goosebumps Book13 Scream Of The Evil Genie','9780439011464',14,11,144,1997,499,28,1,590),('Give Yourself Goosebumps Book14 The Creepy Creations Of Professor Shock','9780590847742',14,11,144,1997,498,31,1,591),('Give Yourself Goosebumps Book15 Please Don\'t Feed The Vampire','9781407157344',14,11,137,1997,497,31,1,592),('Give Yourself Goosebumps Book16 Secret Agent Grandma','9780590847759',14,11,147,2015,496,32,1,593),('Give Yourself Goosebumps Book17 Little Comic Shop Of Horrors','9780590934831',14,11,140,1997,495,31,1,594),('Give Yourself Goosebumps Book18 Attack Of The Beastly Babysitter','9780439995184',14,11,152,1997,494,28,1,595),('Give Yourself Goosebumps Book19 Escape From Camp Run For Your Life','9780439995191',14,11,144,1997,493,28,1,596),('Give Yourself Goosebumps Book20 Toy Terror Batteries Included','9780590934923',14,11,140,1997,492,33,1,597),('Give Yourself Goosebumps Book21 The Twisted Tale Of Tiki Island','9780590935005',14,11,144,2010,491,33,1,598),('Give Yourself Goosebumps Book22 Return To The Carnival Of Horrors','9780590210621',14,11,144,2015,490,32,1,599),('Give Yourself Goosebumps Special Edition03 Trapped In The Circus Of Fear','9780590419208',14,11,144,1998,489,34,1,600),('Who Will Cry When You Die ?','9780006385783',15,12,248,2006,488,35,1,601),('The Monk Who Sold His Ferrari','9780002008594',15,12,224,1999,487,7,1,602),('Kadala Mutthu','9789383053483',16,13,210,2012,485,37,2,604),('The Templar Legacy','9780345476166',17,6,528,2007,484,5,1,605),('Crime Busters 01 - Hot Wheels','9780394999593',18,9,144,1989,483,40,1,606),('Crime Busters 06 - Thriller Diller','9780394929361',19,9,144,1989,480,40,1,609),('Crime Busters 10 - Long Shot','9780006939474',19,9,144,1991,478,7,1,611),('The Three Investigators 01 - The Secret Of Terror Castle','9780679811763',22,9,192,1991,477,40,1,612),('The Three Investigators 02 - The Mystery Of The Stuttering Parrot','9780679811718',22,9,192,1991,476,40,1,613),('The Three Investigators 03 - The Mystery Of The Whispering Mummy','9780394864037',22,9,192,1985,475,40,1,614),('The Three Investigators 04 - The Mystery Of The Green Ghost','9780394864044',22,9,160,1985,474,40,1,615),('The Three Investigators 06 - The Secret Of Skeleton Island','9780394864068',22,9,160,1985,472,40,1,617),('The Three Investigators 07 - The Mystery Of The Fiery Eye','9780394864075',22,9,176,1984,471,40,1,618),('The Three Investigators 08 - The Mystery Of The Silver Spider','9780394864082',22,9,176,1985,470,40,1,619),('The Three Investigators 09 - The Mystery Of The Screaming Clock','9780679821731',22,9,192,1991,469,40,1,620),('The Three Investigators 10 - The Mystery Of The Moaning Cave','9788189632007',18,9,168,1992,468,40,1,621),('The Three Investigators 13 - The Secret Of The Crooked Cat','9780394864136',18,9,168,1985,465,40,1,624),('The Three Investigators 14 - The Mystery Of The Coughing Dragon','9780006919254',23,9,202,1970,464,28,1,625),('The Three Investigators 15 - The Mystery Of The Flaming Footprints','9780006921042',24,9,160,1982,463,7,1,626),('The Three Investigators 17 - The Mystery Of The Singing Serpent','9780394824086',24,9,183,1972,462,41,1,627),('The Three Investigators 18 - The Mystery Of The Shrinking House','9780394824826',18,9,165,1985,461,41,1,628),('The Three Investigators 19 - The Secret Of Phantom Lake','9780394864198',18,9,141,1984,460,40,1,629),('The Three Investigators 23 - The Mystery Of The Invisible Dog','9780394864235',24,9,148,1984,456,40,1,633),('The Three Investigators 24 - The Mystery Of The Death Trap Mine','9780394864242',24,9,151,1985,455,40,1,634),('The Three Investigators 25 - The Mystery Of The Dancing Devil','9780394864259',18,9,134,1984,454,40,1,635),('The Three Investigators 26 - The Mystery Of The Headless Horse','9780394848617',18,9,144,1981,453,40,1,636),('The Three Investigators 28 - The Mystery Of The Deadly Double','9780394839028',18,9,147,1978,451,40,1,638),('The Three Investigators 29 - The Mystery Of The Sinister Scarecrow','9780394864297',24,9,151,1985,450,40,1,639),('The Three Investigators 30 - The Secret Of The Shark Reef','9780394842493',20,9,181,1979,449,40,1,640),('The Three Investigators 32 - The Mystery Of The Blazing Cliffs','9780394845043',24,9,180,1981,447,40,1,642),('The Three Investigators 34 - The Mystery Of Wandering Caveman','9780006925095',24,9,160,1985,445,40,1,644),('The Three Investigators 37 - The Mystery Of The Two-Toed Pigeon','9780394867809',20,9,160,1984,442,40,1,647),('The Three Investigators 38 - The Mystery Of The Smashing Glass','9780394865508',18,9,165,1984,441,40,1,648),('The Three Investigators 39 - The Mystery Of The Trail Of Terror','9780679821724',25,9,192,1991,440,40,1,649),('The Three Investigators 40 - The Mystery Of The Rogues\' Reunion','9780394969206',20,9,176,1985,439,40,1,650),('The Three Investigators 42 - The Mystery Of Wreckers\' Rock','9780394873756',18,9,184,1986,437,40,1,652),('Digital Fortress','9780312944926',27,14,544,2008,434,43,1,655),('The Da Vinci Code','9780307474278',27,14,464,2003,433,44,1,656),('Gone Girl','9780297859406',1,1,463,2012,432,1,1,657),('Bhagavad Gita As It Is','9780892131341',2,2,944,1968,431,2,1,658),('After The Funeral','9780062073822',3,3,304,2011,430,3,1,659),('A Murder Is Announced','9780062073631',3,3,320,2011,429,3,1,660),('And Then There Were None','9780062073488',3,3,288,2001,428,4,1,661),('Appointment With Death','9780006752516',3,3,192,1984,427,5,1,662),('Big Four','9780006151708',3,3,160,2022,426,6,1,663),('Black Coffee','9780006511373',3,3,304,1999,425,4,1,664),('Cat Among The Pigeons','9780006132806',3,3,304,1991,423,7,1,666),('Crooked House','9780006168645',3,3,288,2002,422,4,1,667),('Curtain','9780007527601',3,3,238,1975,421,8,1,668),('Dead Man\'s Folly','9780006151722',3,3,332,2012,420,9,1,669),('Death On The Nile','9780006130062',3,3,352,2022,418,7,1,671),('Dumb Witness','9780006137832',3,3,272,1986,417,5,1,672),('Elephants Can Remember','9780062074034',3,3,198,1984,416,10,1,673),('Evil Under The Sun','9780006139829',3,3,189,1957,415,11,1,674),('Halloween Party','9780006161721',3,3,240,1991,414,5,1,675),('Hercule Poirot\'s Christmas','9780006141266',3,3,256,1992,413,7,1,676),('Hickory Dickory Dock','9780006170006',3,3,208,1996,412,7,1,677),('Lord Edgware Dies','9780006165392',3,3,256,1986,411,5,1,678),('Mrs Mcginty\'s Dead','9780006135265',3,3,192,1974,410,12,1,679),('Murder In Mesopotamia','9780006128595',3,3,272,1987,409,5,1,680),('Murder On The Orient Express','9780006137122',3,3,304,2017,408,7,1,681),('Mysterious Affair At Styles','9783988287755',3,3,320,2023,407,13,1,682),('Sad Cypress','9780006133087',3,3,256,2007,405,15,1,684),('Taken At The Flood','9780006168898',3,3,256,1984,404,5,1,685),('The Clocks','9780006161738',3,3,320,2011,402,7,1,687),('The Hollow','9780006158219',3,3,272,1984,401,5,1,688),('The Murder Of Roger Ackroyd','9780006136651',3,3,304,2011,400,7,1,689),('The Murder On The Links','9783988287748',3,3,224,1985,399,5,1,690),('The Mystery Of The Blue Train','9780006119838',3,3,384,2013,398,9,1,691),('Third Girl','9780006151197',3,3,272,2000,397,5,1,692),('Scion Of Ikshvaku','9789356290792',5,5,378,2015,395,16,1,694),('Sita Warrior Of Mithila','9789356290914',5,5,376,2022,394,7,1,695),('Raavan, Enemy Of Aryavarta','9789356290976',5,5,400,2022,393,7,1,696),('Immortals Of Meluha','9789383260157',5,5,436,2010,392,16,1,697),('The Secret Of The Nagas','9781780874043',5,5,396,2011,391,16,1,698),('Oath Of The Vayuputras','9781681445021',5,5,575,2022,390,7,1,699),('Asura Tale Of The Vanquished','9789381576052',6,5,504,2012,389,17,1,700),('Ajaya - Roll Of The Dice','9788183225397',6,5,456,2013,388,17,1,701),('Russian Roulette','9781406360288',7,6,432,2015,387,18,1,702),('Nightshade','9780593115329',7,6,432,2021,385,5,1,704),('Stormbreaker','9780142401651',7,6,304,2006,384,5,1,705),('Point Blank','9780399250262',7,6,320,2006,383,5,1,706),('Skeleton Key','9780142401026',7,6,368,2006,382,5,1,707),('Eagle Strike','9780142402924',7,6,368,2006,381,5,1,708),('Scorpia','9783473585267',7,6,416,2006,380,5,1,709),('Ark Angel','9780142407387',7,6,352,2007,379,5,1,710),('Snakehead','9781406360257',7,6,432,2008,378,5,1,711),('Scorpia Rising','9783473585564',7,6,416,2011,376,5,1,713),('3 Mistakes Of My Life','9788129113726',8,7,282,2014,375,20,1,714),('Girl In Room 105','9781542040464',8,7,312,2018,374,16,1,715),('Revolution 2020','9788129118806',8,7,296,2014,372,20,1,717),('The Lion, The Witch And The Wardrobe','9780006716631',9,8,208,2008,370,7,1,719),('Prince Caspian','9780007115563',9,8,240,2000,369,7,1,720),('The Voyage Of The Dawn Treader','9780006716655',9,8,256,2008,368,7,1,721),('The Silver Chair','9780006716686',9,8,256,2000,367,7,1,722),('The Horse And His Boy','9780006716662',9,8,240,2000,366,7,1,723),('The Magician\'s Nephew','9780007115556',9,8,208,2008,365,7,1,724),('The Last Battle','9780006716693',9,8,240,2002,364,7,1,725),('The Tower Treasure','9781557091444',10,9,160,2022,363,6,1,726),('The House On The Cliff','9780448089027',10,9,192,2000,362,23,1,727),('The Missing Chums','9780001605329',10,9,192,2017,360,5,1,729),('Hunting For Hidden Gold','9780001605251',10,9,160,1976,359,24,1,730),('The Shore Road Mystery','9780006917335',10,9,160,1992,358,24,1,731),('The Secret Of The Caves','9780006923541',10,9,192,1992,357,5,1,732),('The Mystery Of Cabin Island','9780006912149',10,9,192,1992,356,5,1,733),('What Happened At Midnight','9780006910497',10,9,158,1975,354,25,1,735),('Footprints Under The Window','9780006911449',10,9,160,1992,352,24,1,737),('The Hidden Harbour Mystery','9780448189147',10,9,219,1935,350,26,1,739),('The Sinister Signpost','9780006910503',10,9,160,1989,349,7,1,740),('A Figure In Hiding','9780006928324',10,9,212,1937,348,26,1,741),('The Secret Warning','9780006928331',10,9,192,1938,347,26,1,742),('The Twisted Claw','9780006909927',10,9,160,1974,346,24,1,743),('The Disappearing Floor','9780001605053',10,9,160,1974,345,11,1,744),('The Mystery Of The Flying Express','9780448189208',10,9,160,1990,344,27,1,745),('The Clue Of The Broken Blade','9780006925026',10,9,160,1977,343,11,1,746),('The Melted Coins','9780006909101',10,9,160,1974,341,11,1,748),('The Short Wave Mystery','9780006936664',10,9,192,1968,340,26,1,749),('The Secret Panel','9780006928362',10,9,160,1990,339,24,1,750),('The Secret Of Skull Mountain','9780006926559',10,9,192,1975,337,5,1,752),('The Sign Of The Crooked Arrow','9780448189284',10,9,160,1975,336,11,1,753),('The Secret Of The Lost Tunnel','9780006928379',10,9,160,1990,335,24,1,754),('The Wailing Siren Mystery','9780006913979',10,9,192,1951,334,5,1,755),('The Secret Of Wildcat Swamp','9780006925033',10,9,192,1952,333,5,1,756),('The Crisscross Shadow','9780006911456',10,9,192,1953,332,5,1,757),('The Yellow Feather Mystery','9780006912989',10,9,192,1954,331,5,1,758),('The Hooded Hawk Mystery','9780448189345',10,9,192,1955,330,5,1,759),('The Clue In The Embers','9780006910404',10,9,192,1956,329,5,1,760),('The Secret Of Pirates Hill','9780006915669',10,9,192,1957,328,5,1,761),('The Ghost At Skeleton Rock','9780006923091',10,9,192,1958,327,5,1,762),('Mystery At Devil\'s Paw','9780006923084',10,9,192,1959,326,5,1,763),('The Mystery Of The Chinese Junk','9780006921585',10,9,192,1959,325,5,1,764),('The Mystery Of The Desert Giant','9780006909323',10,9,192,1960,324,5,1,765),('The Mystery Of The Aztec Warrior','9780006908128',10,9,192,1964,321,5,1,768),('The Haunted Fort','9780006908142',10,9,192,1964,320,5,1,769),('The Mystery Of Spiral Bridge','9780006925279',10,9,192,1965,319,5,1,770),('The Secret Agent On Flight 101','9780006918677',10,9,192,1967,318,5,1,771),('The Mystery Of The Whale Tattoo','9780006908159',10,9,192,1967,317,5,1,772),('The Artic Patrol Mystery','9780006908135',10,9,160,1977,316,24,1,773),('The Bombay Boomerang','9780006928263',10,9,192,1970,315,5,1,774),('Danger On Vampire Trail','9780006928256',10,9,192,1971,314,5,1,775),('The Shattered Helmet','9780006928287',10,9,192,1973,312,5,1,777),('The Clue Of The Hissing Serpent','9780006928294',10,9,192,1974,311,5,1,778),('The Mysterious Caravan','9780006928249',10,9,192,1975,310,5,1,779),('The Firebird Rocket','9780448410456',10,9,192,1978,308,5,1,781),('The Sting Of The Scorpion','9780006928393',10,9,192,1978,307,5,1,782),('Casino Royale','9781840238433',11,6,224,2023,306,7,1,783),('The Tales Of Beedle The Bard','9781408883099',12,8,128,2008,305,28,1,784),('The Philosopher\'s Stone','9780439362139',12,8,223,1997,304,29,1,785),('The Chamber Of Secrets','9780439064873',12,8,352,2023,303,28,1,786),('The Prisoner Of Azkaban','9780439136358',12,8,464,2018,302,28,1,787),('The Goblet Of Fire','9780439139595',12,8,752,2002,301,28,1,788),('The Order Of The Phoenix','9780545582971',12,8,576,2022,300,28,1,789),('The Half Blood Prince','9780439785969',12,8,672,2005,299,28,1,790),('The Alchemist','9780008283643',13,10,197,2006,296,7,1,793),('Give Yourself Goosebumps Book02 Tick Tock, You\'re Dead','9780590566452',14,11,144,1995,294,31,1,795),('Give Yourself Goosebumps Book03 Trapped In Bat Wing Hall','9780590566469',14,11,176,2015,293,32,1,796),('Give Yourself Goosebumps Book05 Night In Werewolf Woods','9780590673198',14,11,136,1996,291,31,1,798),('Give Yourself Goosebumps Book07 Under The Magician\'s Spell','9780590673211',14,11,136,2015,289,32,1,800),('Give Yourself Goosebumps Book09 The Knight In Screaming Armor','9780590847667',14,11,144,1996,287,31,1,802),('Give Yourself Goosebumps Book10 Diary Of A Mad Mummy','9780590847674',14,11,136,1996,286,31,1,803),('Give Yourself Goosebumps Book11 Deep In The Jungle Of Doom','9780590114035',14,11,144,1996,285,28,1,804),('Give Yourself Goosebumps Book12 Welcome To The Wicked Wax Museum','9780439010061',14,11,137,1996,284,28,1,805),('Give Yourself Goosebumps Book13 Scream Of The Evil Genie','9780439011464',14,11,144,1997,283,28,1,806),('Give Yourself Goosebumps Book14 The Creepy Creations Of Professor Shock','9780590847742',14,11,144,1997,282,31,1,807),('Give Yourself Goosebumps Book15 Please Don\'t Feed The Vampire','9781407157344',14,11,137,1997,281,31,1,808),('Give Yourself Goosebumps Book16 Secret Agent Grandma','9780590847759',14,11,147,2015,280,32,1,809),('Give Yourself Goosebumps Book17 Little Comic Shop Of Horrors','9780590934831',14,11,140,1997,279,31,1,810),('Give Yourself Goosebumps Book18 Attack Of The Beastly Babysitter','9780439995184',14,11,152,1997,278,28,1,811),('Give Yourself Goosebumps Book19 Escape From Camp Run For Your Life','9780439995191',14,11,144,1997,277,28,1,812),('Give Yourself Goosebumps Book20 Toy Terror Batteries Included','9780590934923',14,11,140,1997,276,33,1,813),('Give Yourself Goosebumps Book21 The Twisted Tale Of Tiki Island','9780590935005',14,11,144,2010,275,33,1,814),('Give Yourself Goosebumps Book22 Return To The Carnival Of Horrors','9780590210621',14,11,144,2015,274,32,1,815),('Give Yourself Goosebumps Special Edition03 Trapped In The Circus Of Fear','9780590419208',14,11,144,1998,273,34,1,816),('Who Will Cry When You Die ?','9780006385783',15,12,248,2006,272,35,1,817),('The Monk Who Sold His Ferrari','9780002008594',15,12,224,1999,271,7,1,818),('Kadala Mutthu','9789383053483',16,13,210,2012,269,37,2,820),('The Templar Legacy','9780345476166',17,6,528,2007,268,5,1,821),('Crime Busters 01 - Hot Wheels','9780394999593',18,9,144,1989,267,40,1,822),('Crime Busters 06 - Thriller Diller','9780394929361',19,9,144,1989,264,40,1,825),('Crime Busters 10 - Long Shot','9780006939474',19,9,144,1991,262,7,1,827),('The Three Investigators 01 - The Secret Of Terror Castle','9780679811763',22,9,192,1991,261,40,1,828),('The Three Investigators 02 - The Mystery Of The Stuttering Parrot','9780679811718',22,9,192,1991,260,40,1,829),('The Three Investigators 03 - The Mystery Of The Whispering Mummy','9780394864037',22,9,192,1985,259,40,1,830),('The Three Investigators 04 - The Mystery Of The Green Ghost','9780394864044',22,9,160,1985,258,40,1,831),('The Three Investigators 06 - The Secret Of Skeleton Island','9780394864068',22,9,160,1985,256,40,1,833),('The Three Investigators 07 - The Mystery Of The Fiery Eye','9780394864075',22,9,176,1984,255,40,1,834),('The Three Investigators 08 - The Mystery Of The Silver Spider','9780394864082',22,9,176,1985,254,40,1,835),('The Three Investigators 09 - The Mystery Of The Screaming Clock','9780679821731',22,9,192,1991,253,40,1,836),('The Three Investigators 10 - The Mystery Of The Moaning Cave','9788189632007',18,9,168,1992,252,40,1,837),('The Three Investigators 13 - The Secret Of The Crooked Cat','9780394864136',18,9,168,1985,249,40,1,840),('The Three Investigators 14 - The Mystery Of The Coughing Dragon','9780006919254',23,9,202,1970,248,28,1,841),('The Three Investigators 15 - The Mystery Of The Flaming Footprints','9780006921042',24,9,160,1982,247,7,1,842),('The Three Investigators 17 - The Mystery Of The Singing Serpent','9780394824086',24,9,183,1972,246,41,1,843),('The Three Investigators 18 - The Mystery Of The Shrinking House','9780394824826',18,9,165,1985,245,41,1,844),('The Three Investigators 19 - The Secret Of Phantom Lake','9780394864198',18,9,141,1984,244,40,1,845),('The Three Investigators 23 - The Mystery Of The Invisible Dog','9780394864235',24,9,148,1984,240,40,1,849),('The Three Investigators 24 - The Mystery Of The Death Trap Mine','9780394864242',24,9,151,1985,239,40,1,850),('The Three Investigators 25 - The Mystery Of The Dancing Devil','9780394864259',18,9,134,1984,238,40,1,851),('The Three Investigators 26 - The Mystery Of The Headless Horse','9780394848617',18,9,144,1981,237,40,1,852),('The Three Investigators 28 - The Mystery Of The Deadly Double','9780394839028',18,9,147,1978,235,40,1,854),('The Three Investigators 29 - The Mystery Of The Sinister Scarecrow','9780394864297',24,9,151,1985,234,40,1,855),('The Three Investigators 30 - The Secret Of The Shark Reef','9780394842493',20,9,181,1979,233,40,1,856),('The Three Investigators 32 - The Mystery Of The Blazing Cliffs','9780394845043',24,9,180,1981,231,40,1,858),('The Three Investigators 34 - The Mystery Of Wandering Caveman','9780006925095',24,9,160,1985,229,40,1,860),('The Three Investigators 37 - The Mystery Of The Two-Toed Pigeon','9780394867809',20,9,160,1984,226,40,1,863),('The Three Investigators 38 - The Mystery Of The Smashing Glass','9780394865508',18,9,165,1984,225,40,1,864),('The Three Investigators 39 - The Mystery Of The Trail Of Terror','9780679821724',25,9,192,1991,224,40,1,865),('The Three Investigators 40 - The Mystery Of The Rogues\' Reunion','9780394969206',20,9,176,1985,223,40,1,866),('The Three Investigators 42 - The Mystery Of Wreckers\' Rock','9780394873756',18,9,184,1986,221,40,1,868),('Digital Fortress','9780312944926',27,14,544,2008,218,43,1,871),('The Da Vinci Code','9780307474278',27,14,464,2003,217,44,1,872),('Gone Girl','9780297859406',1,1,463,2012,216,1,1,873),('Bhagavad Gita As It Is','9780892131341',2,2,944,1968,215,2,1,874),('After The Funeral','9780062073822',3,3,304,2011,214,3,1,875),('A Murder Is Announced','9780062073631',3,3,320,2011,213,3,1,876),('And Then There Were None','9780062073488',3,3,288,2001,212,4,1,877),('Appointment With Death','9780006752516',3,3,192,1984,211,5,1,878),('Big Four','9780006151708',3,3,160,2022,210,6,1,879),('Black Coffee','9780006511373',3,3,304,1999,209,4,1,880),('Cat Among The Pigeons','9780006132806',3,3,304,1991,207,7,1,882),('Crooked House','9780006168645',3,3,288,2002,206,4,1,883),('Curtain','9780007527601',3,3,238,1975,205,8,1,884),('Dead Man\'s Folly','9780006151722',3,3,332,2012,204,9,1,885),('Death On The Nile','9780006130062',3,3,352,2022,202,7,1,887),('Dumb Witness','9780006137832',3,3,272,1986,201,5,1,888),('Elephants Can Remember','9780062074034',3,3,198,1984,200,10,1,889),('Evil Under The Sun','9780006139829',3,3,189,1957,199,11,1,890),('Halloween Party','9780006161721',3,3,240,1991,198,5,1,891),('Hercule Poirot\'s Christmas','9780006141266',3,3,256,1992,197,7,1,892),('Hickory Dickory Dock','9780006170006',3,3,208,1996,196,7,1,893),('Lord Edgware Dies','9780006165392',3,3,256,1986,195,5,1,894),('Mrs Mcginty\'s Dead','9780006135265',3,3,192,1974,194,12,1,895),('Murder In Mesopotamia','9780006128595',3,3,272,1987,193,5,1,896),('Murder On The Orient Express','9780006137122',3,3,304,2017,192,7,1,897),('Mysterious Affair At Styles','9783988287755',3,3,320,2023,191,13,1,898),('Sad Cypress','9780006133087',3,3,256,2007,189,15,1,900),('Taken At The Flood','9780006168898',3,3,256,1984,188,5,1,901),('The Clocks','9780006161738',3,3,320,2011,186,7,1,903),('The Hollow','9780006158219',3,3,272,1984,185,5,1,904),('The Murder Of Roger Ackroyd','9780006136651',3,3,304,2011,184,7,1,905),('The Murder On The Links','9783988287748',3,3,224,1985,183,5,1,906),('The Mystery Of The Blue Train','9780006119838',3,3,384,2013,182,9,1,907),('Third Girl','9780006151197',3,3,272,2000,181,5,1,908),('Scion Of Ikshvaku','9789356290792',5,5,378,2015,179,16,1,910),('Sita Warrior Of Mithila','9789356290914',5,5,376,2022,178,7,1,911),('Raavan, Enemy Of Aryavarta','9789356290976',5,5,400,2022,177,7,1,912),('Immortals Of Meluha','9789383260157',5,5,436,2010,176,16,1,913),('The Secret Of The Nagas','9781780874043',5,5,396,2011,175,16,1,914),('Oath Of The Vayuputras','9781681445021',5,5,575,2022,174,7,1,915),('Asura Tale Of The Vanquished','9789381576052',6,5,504,2012,173,17,1,916),('Ajaya - Roll Of The Dice','9788183225397',6,5,456,2013,172,17,1,917),('Russian Roulette','9781406360288',7,6,432,2015,171,18,1,918),('Nightshade','9780593115329',7,6,432,2021,169,5,1,920),('Stormbreaker','9780142401651',7,6,304,2006,168,5,1,921),('Point Blank','9780399250262',7,6,320,2006,167,5,1,922),('Skeleton Key','9780142401026',7,6,368,2006,166,5,1,923),('Eagle Strike','9780142402924',7,6,368,2006,165,5,1,924),('Scorpia','9783473585267',7,6,416,2006,164,5,1,925),('Ark Angel','9780142407387',7,6,352,2007,163,5,1,926),('Snakehead','9781406360257',7,6,432,2008,162,5,1,927),('Scorpia Rising','9783473585564',7,6,416,2011,160,5,1,929),('3 Mistakes Of My Life','9788129113726',8,7,282,2014,159,20,1,930),('Girl In Room 105','9781542040464',8,7,312,2018,158,16,1,931),('Revolution 2020','9788129118806',8,7,296,2014,156,20,1,933),('The Lion, The Witch And The Wardrobe','9780006716631',9,8,208,2008,154,7,1,935),('Prince Caspian','9780007115563',9,8,240,2000,153,7,1,936),('The Voyage Of The Dawn Treader','9780006716655',9,8,256,2008,152,7,1,937),('The Silver Chair','9780006716686',9,8,256,2000,151,7,1,938),('The Horse And His Boy','9780006716662',9,8,240,2000,150,7,1,939),('The Magician\'s Nephew','9780007115556',9,8,208,2008,149,7,1,940),('The Last Battle','9780006716693',9,8,240,2002,148,7,1,941),('The Tower Treasure','9781557091444',10,9,160,2022,147,6,1,942),('The House On The Cliff','9780448089027',10,9,192,2000,146,23,1,943),('The Missing Chums','9780001605329',10,9,192,2017,144,5,1,945),('Hunting For Hidden Gold','9780001605251',10,9,160,1976,143,24,1,946),('The Shore Road Mystery','9780006917335',10,9,160,1992,142,24,1,947),('The Secret Of The Caves','9780006923541',10,9,192,1992,141,5,1,948),('The Mystery Of Cabin Island','9780006912149',10,9,192,1992,140,5,1,949),('What Happened At Midnight','9780006910497',10,9,158,1975,138,25,1,951),('Footprints Under The Window','9780006911449',10,9,160,1992,136,24,1,953),('The Hidden Harbour Mystery','9780448189147',10,9,219,1935,134,26,1,955),('The Sinister Signpost','9780006910503',10,9,160,1989,133,7,1,956),('A Figure In Hiding','9780006928324',10,9,212,1937,132,26,1,957),('The Secret Warning','9780006928331',10,9,192,1938,131,26,1,958),('The Twisted Claw','9780006909927',10,9,160,1974,130,24,1,959),('The Disappearing Floor','9780001605053',10,9,160,1974,129,11,1,960),('The Mystery Of The Flying Express','9780448189208',10,9,160,1990,128,27,1,961),('The Clue Of The Broken Blade','9780006925026',10,9,160,1977,127,11,1,962),('The Melted Coins','9780006909101',10,9,160,1974,125,11,1,964),('The Short Wave Mystery','9780006936664',10,9,192,1968,124,26,1,965),('The Secret Panel','9780006928362',10,9,160,1990,123,24,1,966),('The Secret Of Skull Mountain','9780006926559',10,9,192,1975,121,5,1,968),('The Sign Of The Crooked Arrow','9780448189284',10,9,160,1975,120,11,1,969),('The Secret Of The Lost Tunnel','9780006928379',10,9,160,1990,119,24,1,970),('The Wailing Siren Mystery','9780006913979',10,9,192,1951,118,5,1,971),('The Secret Of Wildcat Swamp','9780006925033',10,9,192,1952,117,5,1,972),('The Crisscross Shadow','9780006911456',10,9,192,1953,116,5,1,973),('The Yellow Feather Mystery','9780006912989',10,9,192,1954,115,5,1,974),('The Hooded Hawk Mystery','9780448189345',10,9,192,1955,114,5,1,975),('The Clue In The Embers','9780006910404',10,9,192,1956,113,5,1,976),('The Secret Of Pirates Hill','9780006915669',10,9,192,1957,112,5,1,977),('The Ghost At Skeleton Rock','9780006923091',10,9,192,1958,111,5,1,978),('Mystery At Devil\'s Paw','9780006923084',10,9,192,1959,110,5,1,979),('The Mystery Of The Chinese Junk','9780006921585',10,9,192,1959,109,5,1,980),('The Mystery Of The Desert Giant','9780006909323',10,9,192,1960,108,5,1,981),('The Mystery Of The Aztec Warrior','9780006908128',10,9,192,1964,105,5,1,984),('The Haunted Fort','9780006908142',10,9,192,1964,104,5,1,985),('The Mystery Of Spiral Bridge','9780006925279',10,9,192,1965,103,5,1,986),('The Secret Agent On Flight 101','9780006918677',10,9,192,1967,102,5,1,987),('The Mystery Of The Whale Tattoo','9780006908159',10,9,192,1967,101,5,1,988),('The Artic Patrol Mystery','9780006908135',10,9,160,1977,100,24,1,989),('The Bombay Boomerang','9780006928263',10,9,192,1970,99,5,1,990),('Danger On Vampire Trail','9780006928256',10,9,192,1971,98,5,1,991),('The Shattered Helmet','9780006928287',10,9,192,1973,96,5,1,993),('The Clue Of The Hissing Serpent','9780006928294',10,9,192,1974,95,5,1,994),('The Mysterious Caravan','9780006928249',10,9,192,1975,94,5,1,995),('The Firebird Rocket','9780448410456',10,9,192,1978,92,5,1,997),('The Sting Of The Scorpion','9780006928393',10,9,192,1978,91,5,1,998),('Casino Royale','9781840238433',11,6,224,2023,90,7,1,999),('The Tales Of Beedle The Bard','9781408883099',12,8,128,2008,89,28,1,1000),('The Philosopher\'s Stone','9780439362139',12,8,223,1997,88,29,1,1001),('The Chamber Of Secrets','9780439064873',12,8,352,2023,87,28,1,1002),('The Prisoner Of Azkaban','9780439136358',12,8,464,2018,86,28,1,1003),('The Goblet Of Fire','9780439139595',12,8,752,2002,85,28,1,1004),('The Order Of The Phoenix','9780545582971',12,8,576,2022,84,28,1,1005),('The Half Blood Prince','9780439785969',12,8,672,2005,83,28,1,1006),('The Alchemist','9780008283643',13,10,197,2006,80,7,1,1009),('Give Yourself Goosebumps Book02 Tick Tock, You\'re Dead','9780590566452',14,11,144,1995,78,31,1,1011),('Give Yourself Goosebumps Book03 Trapped In Bat Wing Hall','9780590566469',14,11,176,2015,77,32,1,1012),('Give Yourself Goosebumps Book05 Night In Werewolf Woods','9780590673198',14,11,136,1996,75,31,1,1014),('Give Yourself Goosebumps Book07 Under The Magician\'s Spell','9780590673211',14,11,136,2015,73,32,1,1016),('Give Yourself Goosebumps Book09 The Knight In Screaming Armor','9780590847667',14,11,144,1996,71,31,1,1018),('Give Yourself Goosebumps Book10 Diary Of A Mad Mummy','9780590847674',14,11,136,1996,70,31,1,1019),('Give Yourself Goosebumps Book11 Deep In The Jungle Of Doom','9780590114035',14,11,144,1996,69,28,1,1020),('Give Yourself Goosebumps Book12 Welcome To The Wicked Wax Museum','9780439010061',14,11,137,1996,68,28,1,1021),('Give Yourself Goosebumps Book13 Scream Of The Evil Genie','9780439011464',14,11,144,1997,67,28,1,1022),('Give Yourself Goosebumps Book14 The Creepy Creations Of Professor Shock','9780590847742',14,11,144,1997,66,31,1,1023),('Give Yourself Goosebumps Book15 Please Don\'t Feed The Vampire','9781407157344',14,11,137,1997,65,31,1,1024),('Give Yourself Goosebumps Book16 Secret Agent Grandma','9780590847759',14,11,147,2015,64,32,1,1025),('Give Yourself Goosebumps Book17 Little Comic Shop Of Horrors','9780590934831',14,11,140,1997,63,31,1,1026),('Give Yourself Goosebumps Book18 Attack Of The Beastly Babysitter','9780439995184',14,11,152,1997,62,28,1,1027),('Give Yourself Goosebumps Book19 Escape From Camp Run For Your Life','9780439995191',14,11,144,1997,61,28,1,1028),('Give Yourself Goosebumps Book20 Toy Terror Batteries Included','9780590934923',14,11,140,1997,60,33,1,1029),('Give Yourself Goosebumps Book21 The Twisted Tale Of Tiki Island','9780590935005',14,11,144,2010,59,33,1,1030),('Give Yourself Goosebumps Book22 Return To The Carnival Of Horrors','9780590210621',14,11,144,2015,58,32,1,1031),('Give Yourself Goosebumps Special Edition03 Trapped In The Circus Of Fear','9780590419208',14,11,144,1998,57,34,1,1032),('Who Will Cry When You Die ?','9780006385783',15,12,248,2006,56,35,1,1033),('The Monk Who Sold His Ferrari','9780002008594',15,12,224,1999,55,7,1,1034),('Kadala Mutthu','9789383053483',16,13,210,2012,53,37,2,1036),('The Templar Legacy','9780345476166',17,6,528,2007,52,5,1,1037),('Crime Busters 01 - Hot Wheels','9780394999593',18,9,144,1989,51,40,1,1038),('Crime Busters 06 - Thriller Diller','9780394929361',19,9,144,1989,48,40,1,1041),('Crime Busters 10 - Long Shot','9780006939474',19,9,144,1991,46,7,1,1043),('The Three Investigators 01 - The Secret Of Terror Castle','9780679811763',22,9,192,1991,45,40,1,1044),('The Three Investigators 02 - The Mystery Of The Stuttering Parrot','9780679811718',22,9,192,1991,44,40,1,1045),('The Three Investigators 03 - The Mystery Of The Whispering Mummy','9780394864037',22,9,192,1985,43,40,1,1046),('The Three Investigators 04 - The Mystery Of The Green Ghost','9780394864044',22,9,160,1985,42,40,1,1047),('The Three Investigators 06 - The Secret Of Skeleton Island','9780394864068',22,9,160,1985,40,40,1,1049),('The Three Investigators 07 - The Mystery Of The Fiery Eye','9780394864075',22,9,176,1984,39,40,1,1050),('The Three Investigators 08 - The Mystery Of The Silver Spider','9780394864082',22,9,176,1985,38,40,1,1051),('The Three Investigators 09 - The Mystery Of The Screaming Clock','9780679821731',22,9,192,1991,37,40,1,1052),('The Three Investigators 10 - The Mystery Of The Moaning Cave','9788189632007',18,9,168,1992,36,40,1,1053),('The Three Investigators 13 - The Secret Of The Crooked Cat','9780394864136',18,9,168,1985,33,40,1,1056),('The Three Investigators 14 - The Mystery Of The Coughing Dragon','9780006919254',23,9,202,1970,32,28,1,1057),('The Three Investigators 15 - The Mystery Of The Flaming Footprints','9780006921042',24,9,160,1982,31,7,1,1058),('The Three Investigators 17 - The Mystery Of The Singing Serpent','9780394824086',24,9,183,1972,30,41,1,1059),('The Three Investigators 18 - The Mystery Of The Shrinking House','9780394824826',18,9,165,1985,29,41,1,1060),('The Three Investigators 19 - The Secret Of Phantom Lake','9780394864198',18,9,141,1984,28,40,1,1061),('The Three Investigators 23 - The Mystery Of The Invisible Dog','9780394864235',24,9,148,1984,24,40,1,1065),('The Three Investigators 24 - The Mystery Of The Death Trap Mine','9780394864242',24,9,151,1985,23,40,1,1066),('The Three Investigators 25 - The Mystery Of The Dancing Devil','9780394864259',18,9,134,1984,22,40,1,1067),('The Three Investigators 26 - The Mystery Of The Headless Horse','9780394848617',18,9,144,1981,21,40,1,1068),('The Three Investigators 28 - The Mystery Of The Deadly Double','9780394839028',18,9,147,1978,19,40,1,1070),('The Three Investigators 29 - The Mystery Of The Sinister Scarecrow','9780394864297',24,9,151,1985,18,40,1,1071),('The Three Investigators 30 - The Secret Of The Shark Reef','9780394842493',20,9,181,1979,17,40,1,1072),('The Three Investigators 32 - The Mystery Of The Blazing Cliffs','9780394845043',24,9,180,1981,15,40,1,1074),('The Three Investigators 34 - The Mystery Of Wandering Caveman','9780006925095',24,9,160,1985,13,40,1,1076),('The Three Investigators 37 - The Mystery Of The Two-Toed Pigeon','9780394867809',20,9,160,1984,10,40,1,1079),('The Three Investigators 38 - The Mystery Of The Smashing Glass','9780394865508',18,9,165,1984,9,40,1,1080),('The Three Investigators 39 - The Mystery Of The Trail Of Terror','9780679821724',25,9,192,1991,8,40,1,1081),('The Three Investigators 40 - The Mystery Of The Rogues\' Reunion','9780394969206',20,9,176,1985,7,40,1,1082),('The Three Investigators 42 - The Mystery Of Wreckers\' Rock','9780394873756',18,9,184,1986,5,40,1,1084),('Digital Fortress','9780312944926',27,14,544,2008,2,43,1,1087),('The Da Vinci Code','9780307474278',27,14,464,2003,1,44,1,1088);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `books currently available`
--

DROP TABLE IF EXISTS `books currently available`;
/*!50001 DROP VIEW IF EXISTS `books currently available`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `books currently available` AS SELECT 
 1 AS `name`,
 1 AS `copies available`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `books currently borrowed`
--

DROP TABLE IF EXISTS `books currently borrowed`;
/*!50001 DROP VIEW IF EXISTS `books currently borrowed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `books currently borrowed` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `return_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `categorized books`
--

DROP TABLE IF EXISTS `categorized books`;
/*!50001 DROP VIEW IF EXISTS `categorized books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `categorized books` AS SELECT 
 1 AS `author`,
 1 AS `book`,
 1 AS `genre`,
 1 AS `year`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  UNIQUE KEY `UC_CUSTOMERS_ID` (`id`,`name`,`phone`,`email`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--
-- ORDER BY:  `id`,`name`,`phone`,`email`

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Matthew Horton','001449873548641900','barneselizabeth@gmail.com',6),(2,'Greg Harrington','00137894863989994','andrew50@gmail.net',3),(3,'Scott Hudson','4056592586997','jose48@gmail.com',5),(4,'Janet Morton','254599418320188','ncook@gmail.net',4),(5,'Shawn Martinez','5212672267','roberta81@gmail.net',2),(6,'Stephanie Decker','9514735438267','terri96@gmail.com',1),(7,'Cole Fields','555982005990431','cjordan@gmail.org',7),(8,'Randy Cabrera','916.780.0055','amandabishop@gmail.com',5),(9,'Barry Jacobs','(264)938764607167','gonzalezsean@gmail.com',5),(10,'Joshua Macdonald','7132852518','cynthia23@gmail.org',2),(11,'Jessica Abbott','6472943888','youngsara@gmail.org',6),(12,'Dr. Joseph Arellano','8162918553','taylorjohn@gmail.com',4),(13,'Gary Baker','001613959943128330','mpoole@gmail.org',1),(14,'Kaitlin Mitchell','+16982866332524','phyllis36@gmail.net',3),(15,'Margaret Johnson','408.400.3205','elizabethwhite@gmail.org',2),(16,'Sandra Cooper','001787209152868539','lisajohnson@gmail.com',6),(17,'Scott Bates','(473)8877296827','martinezbenjamin@gmail.org',4),(18,'Tara Perez DVM','529.799.2164','cooperrobert@gmail.org',4),(19,'Tina Parrish','0015226694278','thompsonvincent@gmail.com',2),(20,'Cheyenne Sanders','(456)5655375','elijah55@gmail.org',2),(21,'Jennifer Kent','(527)52696115295','donnaboyle@gmail.org',7),(22,'Brian Brown','3232076806716','rhill@gmail.com',1),(23,'Collin Hill','+14514248113','burtonkayla@gmail.com',4),(24,'Christy Snyder','(214)563643332107','mlopez@gmail.org',5),(25,'David Alexander DVM','+165151314663283','walkerjames@gmail.com',1),(26,'Anthony Pitts','(676)8616464','hardyjenny@gmail.net',5),(27,'Curtis Goodwin','868.480.8648','petersonvanessa@gmail.org',3),(28,'Deborah Bryant','(956)6100323070','shawnicole@gmail.com',5),(29,'Lisa Phillips','771.645.38702759','smithcheryl@gmail.com',8),(30,'Russell Villanueva','8566827633','michelle29@gmail.com',5),(31,'Natasha Perry','001612712241748877','pdominguez@gmail.org',5),(32,'Deborah Cross','0014745802144624','angela32@gmail.com',1),(33,'Aaron Woods','00194189258079788','alvingarner@gmail.net',2),(34,'Matthew Ramirez','(430)8283948931','teresafoster@gmail.com',3),(35,'Anthony Wilson','4016656315','jeffrey60@gmail.org',8),(36,'Douglas Cunningham','8477980135','timothy70@gmail.net',7),(37,'Pamela Bennett','5876851985436','rjohnston@gmail.net',8),(38,'Stephen White','+17327842221','jessica90@gmail.net',8),(39,'Troy Blankenship','(271)6276402','cynthia66@gmail.com',1),(40,'Dr. Bryce Weiss','357.574.0120127','vvega@gmail.com',5),(41,'Edward Watkins','(443)6613559','rebecca70@gmail.com',6),(42,'Timothy Riley','991685674238363','dana79@gmail.net',1),(43,'Kendra Walker','0013033732544','mprice@gmail.org',7),(44,'Mrs. Leslie Mcguire MD','988.889.315569816','rodney17@gmail.com',6),(45,'Laurie Thompson','2106162772','jacob12@gmail.com',3),(46,'Kathleen Johnson','+158932914373510','sylviahudson@gmail.net',8),(47,'Jo Moore','2014101010231','raymatthew@gmail.net',6),(48,'Melanie Waters','5149556399','wrightmarie@gmail.com',5),(49,'Joseph Baker','+19617603112478','zfrey@gmail.com',8),(50,'Tracy Lane','640.761.3322','simpsongerald@gmail.com',2),(51,'John Ingram','+148974215504682','ronald79@gmail.net',4),(52,'Ryan Walsh','927.636.6384437','gcarson@gmail.com',3),(53,'John Johnson','+1408856395274744','christopher95@gmail.org',2),(54,'Rebecca Jones','7222801867','xgomez@gmail.net',8),(55,'Rebecca Lewis','886479957047316','mark44@gmail.net',1),(56,'Danny Jones','(527)871663342555','megancochran@gmail.com',8),(57,'Mark Martin','(829)79970906907','ygomez@gmail.net',6),(58,'Taylor Gutierrez','8577957664','piercejason@gmail.org',4),(59,'Matthew Nixon','(730)8858670','pwilliams@gmail.net',4),(60,'Victoria Johnson','0016333300397','brucepatricia@gmail.net',2),(61,'Mary Perez','467.561.4525','hobrien@gmail.com',7),(62,'Samantha Morgan','427.616.066455649','ocummings@gmail.com',4),(63,'Seth Carroll','00158062321226860','joshua25@gmail.org',5),(64,'Steven Williams','(223)3134480','mileslaura@gmail.com',5),(65,'Holly Williams','+13106596714443','mclay@gmail.net',7),(66,'Mark Gonzalez','(813)795965694891','grichards@gmail.net',3),(67,'Jorge Smith','(214)857583300885','erobinson@gmail.com',7),(68,'David Ballard','+15126037090','samanthahinton@gmail.com',7),(69,'Timothy Murphy','(722)4887924089','wolfregina@gmail.com',4),(70,'Wayne Howell','7187755299455','wwright@gmail.org',1),(71,'Kayla Carlson','(368)713541867513','brownmichael@gmail.com',1),(72,'Shannon Warren MD','+14095623206','sheilasanders@gmail.com',3),(73,'Kathy Fisher','40184376437419','garrettkevin@gmail.org',7),(74,'Carlos Thomas','(653)2613797','zwilliams@gmail.org',7),(75,'Gary Harris','0013463777337492','higginsjill@gmail.org',1),(76,'Elizabeth Garrison','(619)8669106','sthomas@gmail.com',8),(77,'Jacob Spencer','7882354057539','travis39@gmail.org',8),(78,'Justin Smith','(593)3244566184','hburns@gmail.com',6),(79,'Alan Campos','(454)9175064','rachelweeks@gmail.net',3),(80,'Adam Fleming','381.668.645279170','hdodson@gmail.org',8),(81,'Christie Johnson','+16014657760675','robin49@gmail.net',2),(82,'Donna Taylor','29978555820339','ncollins@gmail.com',6),(83,'James Pope','411854462811321','simspeggy@gmail.com',5),(84,'John Reed','611.977.5270','justin07@gmail.net',6),(85,'Ruben Williams','562.613.98957783','hnorton@gmail.org',4),(86,'Jonathan Sexton','8812843762','mendozaeric@gmail.net',3),(87,'Amber Castillo','(835)3389989496','clarktracy@gmail.org',2),(88,'Mathew Cabrera','(980)9113002','karen72@gmail.net',5),(89,'Rose Richardson','442.352.3525973','andrea37@gmail.net',8),(90,'Peggy Lee','6917127181','millerjustin@gmail.org',7),(91,'Melanie White','+18493744826410','christinajacobs@gmail.net',7),(92,'Heather Pittman','001255484595784311','tiffany47@gmail.org',7),(93,'Shelia Pollard','8959348669900','jennifer60@gmail.org',1),(94,'Kristin Hughes','+12863446139270','ywilliams@gmail.net',6),(95,'Jessica Scott','(603)5007161','kirkharding@gmail.net',5),(96,'Brandy Brooks','933762999842846','estradakevin@gmail.org',6),(97,'Erin Montgomery','955.223.407462939','xrowe@gmail.net',4),(98,'Courtney Rogers','9845224924','jmeyers@gmail.org',5),(99,'Brett Robinson','0013774591353','obrienmatthew@gmail.org',5),(100,'Tina Thomas','(722)2413032','alexandertina@gmail.com',8),(101,'Tara Johnson','0015253191065792','wheelerjennifer@gmail.org',5),(102,'Ms. Kathleen Johnson','2318384789','sholt@gmail.com',1),(103,'Dennis Barton','+19125873155','jennifer29@gmail.com',4),(104,'Douglas Maxwell','3607013974','rachel36@gmail.com',5),(105,'Cheryl Jackson','80892446936699','edward81@gmail.net',5),(106,'Christopher Livingston','(698)4817782','michaelgordon@gmail.org',7),(107,'Stephen Rose','5245510464','lgross@gmail.com',5),(108,'John Black','9784279364496','farmertara@gmail.net',1),(109,'Joseph Hernandez','+198871919017900','jenkinserica@gmail.net',1),(110,'Scott Yates','202.828.618421929','bradleymoses@gmail.net',2),(111,'Sydney Boyer','99635949591609','jonesjoseph@gmail.net',4),(112,'Brandon Garcia','+155749476218409','aaron98@gmail.com',5),(113,'Tiffany Doyle','0016658452357','wardjames@gmail.net',3),(114,'Eric Bruce','+17786427300','cbeck@gmail.com',7),(115,'Michael Williams','(659)8487822637','bakerdavid@gmail.com',8),(116,'Kara Jenkins','209.237.844856151','michaellarson@gmail.com',4),(117,'Alexander Burns','59392502828203','tonijohnson@gmail.net',1),(118,'Jason Hayes','+1573353819761212','sburns@gmail.org',1),(119,'Christopher Perez','885.428.59635432','matthewsamanda@gmail.com',3),(120,'Alexandra Carlson','474.663.1586','iwatts@gmail.com',8),(121,'Sandra Hernandez','999.226.60112962','frodriguez@gmail.org',6),(122,'Michael Ortiz','+177231182117130','stacy26@gmail.net',4),(123,'Katrina Huang','639.314.174287524','richardskevin@gmail.com',1),(124,'Diane Burke','340.265.1433088','iwillis@gmail.net',2),(125,'Eric Johnson','(311)95155203541','james58@gmail.org',3),(126,'Deborah Martin','+16565297653740','vblevins@gmail.org',2),(127,'Allen Nguyen','(987)3642699','john03@gmail.net',7),(128,'Jeffrey Martinez','0015196255512','fmurray@gmail.com',7),(129,'Heidi Hughes','+1924947079215085','levycarolyn@gmail.org',1),(130,'Dawn Brock','0014213773654078','berrymicheal@gmail.com',4),(131,'Cindy Russell','+154561034645215','johnhernandez@gmail.net',5),(132,'Mary Hudson','(402)26458848765','willisbenjamin@gmail.org',4),(133,'Sarah Madden','2969360011515','gsnow@gmail.com',3),(134,'Diane Ryan','3739509173','reedjessica@gmail.org',1),(135,'Kevin George','(306)760911825400','brittneykirk@gmail.org',1),(136,'April Hendricks','68556479243524','bryanfrye@gmail.com',7),(137,'Raymond Ferguson','9386051645701','mackenziedeleon@gmail.com',8),(138,'Karen Price','+1928441276706316','dawn45@gmail.net',2),(139,'Christopher Garrett','768.662.43072057','tiffanywells@gmail.org',5),(140,'Jeffrey Harrington','420.504.3362','franklinjohn@gmail.org',4),(141,'Rita Harris','391.564.027389537','mistyallen@gmail.com',7),(142,'Kristina Leach','357.774.9678','thomas20@gmail.net',8),(143,'Jason Cooper','280.871.4447','matthew97@gmail.org',5),(144,'Cynthia Simmons','8925932002','nhall@gmail.net',6),(145,'Eric Flores','8493502939','michelle83@gmail.org',4),(146,'Erin Harrison','5838354020','christian43@gmail.net',6),(147,'Victoria Schmidt','2165068202','hwalton@gmail.com',4),(148,'Elizabeth Miller','983.240.04636901','steven52@gmail.net',7),(149,'Travis Soto','+16185305702','nathangutierrez@gmail.org',6),(150,'Bobby Lewis','750.654.3021','rossashlee@gmail.net',4),(151,'Amanda Potter','+16746932825654','oreed@gmail.com',4),(152,'Wendy Raymond','7334881346','kochcarrie@gmail.com',1),(153,'Rachael Rodriguez','69448084637564','zevans@gmail.com',3),(154,'Rita Rice','476372008988728','hnelson@gmail.com',8),(155,'Amanda Farmer','777.643.042433607','rose38@gmail.net',1),(156,'Tara Shaw','404712034433958','davidhernandez@gmail.org',8),(157,'Albert Mora','(256)8469854','sarah41@gmail.net',5),(158,'Melissa Porter','295.897.19696868','ahoffman@gmail.com',6),(159,'Erin Stephenson','0016404026680','garciadarlene@gmail.com',4),(160,'Brent Solis','(916)8313743','dixonjulie@gmail.com',6),(161,'Sarah Olsen','483.804.756909491','mmontgomery@gmail.org',3),(162,'Aaron Peterson','340826272326950','nbarnes@gmail.com',4),(163,'Sarah Romero','+1558441927413574','leonardjackson@gmail.net',6),(164,'Scott Nelson','967.877.9048','larryporter@gmail.com',6),(165,'David Madden','+13102243021784','sloananthony@gmail.net',4),(166,'Renee Williams','407.558.9334676','mark30@gmail.com',2),(167,'Brian Campbell','(887)211627520844','martinezkristopher@gmail.net',3),(168,'Barbara Elliott','001786776943721859','mcompton@gmail.net',4),(169,'Vincent Davis','(607)993386053490','timothybrooks@gmail.com',2),(170,'Gabriel Bray','809.263.948203492','heberttyler@gmail.net',2),(171,'Leslie Kramer','2592303235','russell57@gmail.com',5),(172,'Jonathan Barron','3265185750','janiceroberts@gmail.net',3),(173,'Scott Moore','31077338784028','amanda22@gmail.com',3),(174,'Ann Gutierrez','(414)2502161','jamesfrye@gmail.com',7),(175,'Jordan Reed','0013269387630586','erika81@gmail.net',4),(176,'Erica Ward','(683)9378868','lrichards@gmail.com',5),(177,'Matthew Boone','6585276782','wheath@gmail.org',8),(178,'Darlene Hart','6004644043068','hernandezsarah@gmail.com',6),(179,'Kimberly Anderson','(582)41080951005','stephen89@gmail.org',8),(180,'Dawn Wiley','+15082700309','danielle49@gmail.com',3),(181,'Michael Thomas','89341621089070','pzavala@gmail.org',5),(182,'Heather Ayers','00128770176970195','mackthomas@gmail.com',8),(183,'Alyssa Williams','001341868428754116','ucordova@gmail.net',2),(184,'Robert Baker','96826605569310','bcarter@gmail.org',1),(185,'John Bray','556.816.0448','jennifer90@gmail.com',5),(186,'Kelly Wells','(386)28324074531','cabrerajustin@gmail.com',1),(187,'Shawn Rios','929.696.0459599','ballmelissa@gmail.org',1),(188,'Meagan Little','5933290928','gibsongregory@gmail.com',1),(189,'Aaron Flores','7953638906','vlove@gmail.net',5),(190,'Robert Nguyen','+129591928014829','tanya91@gmail.com',6),(191,'Lisa Jones','00173349917020572','thomasderek@gmail.net',2),(192,'Jacob Griffin','00155425349536164','phillipthomas@gmail.org',1),(193,'Robert Allen','+1619248440762676','jennifer11@gmail.org',6),(194,'Craig Dunn','(927)98515940349','jjohnson@gmail.org',3),(195,'Tracy Bennett','(837)28035880577','vstevens@gmail.org',3),(196,'Christine Jones','001598587083848775','whitesheila@gmail.com',6),(197,'Gary Zhang','0015722756410498','krista27@gmail.com',8),(198,'Joanna Johnson','001878604120634814','sarahwilliams@gmail.com',7),(199,'Erika Pope','001410737382733342','lydiawilliams@gmail.com',5),(200,'Ana Rios','731.857.79296973','phall@gmail.org',4);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_staging`
--

DROP TABLE IF EXISTS `data_staging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_staging` (
  `author` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `book` varchar(100) DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_staging`
--

LOCK TABLES `data_staging` WRITE;
/*!40000 ALTER TABLE `data_staging` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_staging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donations`
--

DROP TABLE IF EXISTS `donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donations` (
  `donor_name` varchar(100) DEFAULT NULL,
  `isbn` varchar(13) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donations`
--
-- ORDER BY:  `id`

LOCK TABLES `donations` WRITE;
/*!40000 ALTER TABLE `donations` DISABLE KEYS */;
INSERT INTO `donations` VALUES ('Jason Miller','156891296X',9),('Thomas Rojas','127432078X',25),('Aaron Martin','082655802X',37),('Stephanie Tapia','160369482X',46),('Mackenzie Ortega','026164758X',50);
/*!40000 ALTER TABLE `donations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  UNIQUE KEY `UC_GENRES_ID` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--
-- ORDER BY:  `id`,`name`

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Crime Thriller'),(2,'Hindu Religious Text'),(3,'Murder Thriller'),(4,'Historical Fiction'),(5,'Spiritual Fiction'),(6,'Fiction'),(7,'Realistic Fiction'),(8,'Fantasy'),(9,'Children’s Mysteries'),(10,'Adventure'),(11,'Children’s Horror'),(12,'Self-Help Book'),(13,'Drama'),(14,'Science Fiction');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `date` date DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `income_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `income_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES ('2023-05-20',128,7),('2023-03-01',162,4),('2023-04-09',120,8),('2023-01-03',25,1),('2023-06-22',198,7),('2023-01-20',196,6),('2023-04-23',37,8),('2023-01-05',86,3),('2023-01-04',140,4),('2023-01-15',100,8),('2023-04-19',121,6),('2023-10-22',146,6),('2023-04-15',109,1),('2023-08-05',97,4),('2023-09-08',27,3),('2023-05-03',74,7),('2023-02-04',156,8),('2023-04-15',157,5),('2023-03-25',75,1),('2023-01-02',77,8),('2023-03-02',65,7),('2023-09-13',89,8),('2023-02-22',134,1),('2023-04-14',99,5),('2023-01-25',41,6),('2023-05-29',107,5),('2023-02-07',161,3),('2023-12-14',72,3),('2023-01-23',42,1),('2023-04-16',84,6),('2023-01-18',51,4),('2023-03-31',135,1),('2023-02-22',14,3),('2023-04-21',10,2),('2023-01-23',19,2),('2023-03-26',136,7),('2023-10-27',34,3),('2023-02-10',174,7),('2023-01-21',35,8),('2023-08-15',20,2),('2023-11-21',45,3),('2023-09-26',105,5),('2023-10-22',81,2),('2023-07-10',53,2),('2023-10-31',190,6),('2023-08-17',170,2),('2023-05-12',96,6),('2023-05-23',48,5),('2023-07-04',58,4),('2023-12-12',188,1),('2023-07-27',167,3),('2023-01-04',145,4),('2023-03-23',148,7),('2023-04-06',79,3),('2023-07-14',108,1),('2023-07-09',87,2),('2023-11-12',191,2),('2023-04-25',50,2),('2023-09-14',166,2),('2023-07-10',49,8),('2023-06-27',33,2),('2023-05-19',9,5),('2023-05-03',92,7),('2023-09-15',60,2),('2023-02-23',184,1),('2023-06-21',44,6),('2023-06-20',139,5),('2023-08-22',111,4),('2023-04-06',52,3),('2023-04-11',171,5),('2023-05-11',158,6),('2023-08-10',159,4),('2023-06-02',11,6),('2023-04-13',40,5),('2023-10-07',102,1),('2023-01-31',117,1),('2023-08-09',113,3),('2023-03-31',153,3),('2023-11-16',189,5),('2023-05-12',90,7),('2023-09-19',62,4),('2023-02-22',67,7),('2023-09-14',59,4),('2023-11-06',125,3),('2023-03-14',131,5),('2023-05-21',55,1),('2023-08-20',178,6),('2023-09-19',71,1),('2023-05-20',82,6),('2023-04-04',200,4),('2023-09-29',129,1),('2023-03-28',195,3),('2023-04-24',130,4),('2023-06-29',106,7),('2023-08-23',164,6),('2023-08-26',28,5),('2023-04-18',133,3);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  UNIQUE KEY `UC_LANGUAGES_ID` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--
-- ORDER BY:  `id`,`name`

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English'),(2,'Kannada');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rack_no` tinyint(2) unsigned zerofill DEFAULT NULL,
  `shelf_no` tinyint(2) unsigned zerofill DEFAULT NULL,
  `row_no` tinyint(2) unsigned zerofill DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  UNIQUE KEY `UC_LOCATIONS_ID` (`id`,`rack_no`,`shelf_no`,`row_no`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--
-- ORDER BY:  `id`,`rack_no`,`shelf_no`,`row_no`

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,01,01,01,1088),(2,01,01,02,1087),(5,01,01,05,1084),(7,01,01,07,1082),(8,01,01,08,1081),(9,01,01,09,1080),(10,01,01,10,1079),(13,01,01,13,1076),(15,01,01,15,1074),(17,01,01,17,1072),(18,01,01,18,1071),(19,01,01,19,1070),(21,01,02,01,1068),(22,01,02,02,1067),(23,01,02,03,1066),(24,01,02,04,1065),(28,01,02,08,1061),(29,01,02,09,1060),(30,01,02,10,1059),(31,01,02,11,1058),(32,01,02,12,1057),(33,01,02,13,1056),(36,01,02,16,1053),(37,01,02,17,1052),(38,01,02,18,1051),(39,01,02,19,1050),(40,01,02,20,1049),(42,01,03,02,1047),(43,01,03,03,1046),(44,01,03,04,1045),(45,01,03,05,1044),(46,01,03,06,1043),(48,01,03,08,1041),(51,01,03,11,1038),(52,01,03,12,1037),(53,01,03,13,1036),(55,01,03,15,1034),(56,01,03,16,1033),(57,01,03,17,1032),(58,01,03,18,1031),(59,01,03,19,1030),(60,01,03,20,1029),(61,01,04,01,1028),(62,01,04,02,1027),(63,01,04,03,1026),(64,01,04,04,1025),(65,01,04,05,1024),(66,01,04,06,1023),(67,01,04,07,1022),(68,01,04,08,1021),(69,01,04,09,1020),(70,01,04,10,1019),(71,01,04,11,1018),(73,01,04,13,1016),(75,01,04,15,1014),(77,01,04,17,1012),(78,01,04,18,1011),(80,01,04,20,1009),(83,01,05,03,1006),(84,01,05,04,1005),(85,01,05,05,1004),(86,01,05,06,1003),(87,01,05,07,1002),(88,01,05,08,1001),(89,01,05,09,1000),(90,01,05,10,999),(91,01,05,11,998),(92,01,05,12,997),(94,01,05,14,995),(95,01,05,15,994),(96,01,05,16,993),(98,01,05,18,991),(99,01,05,19,990),(100,01,05,20,989),(101,02,01,01,988),(102,02,01,02,987),(103,02,01,03,986),(104,02,01,04,985),(105,02,01,05,984),(108,02,01,08,981),(109,02,01,09,980),(110,02,01,10,979),(111,02,01,11,978),(112,02,01,12,977),(113,02,01,13,976),(114,02,01,14,975),(115,02,01,15,974),(116,02,01,16,973),(117,02,01,17,972),(118,02,01,18,971),(119,02,01,19,970),(120,02,01,20,969),(121,02,02,01,968),(123,02,02,03,966),(124,02,02,04,965),(125,02,02,05,964),(127,02,02,07,962),(128,02,02,08,961),(129,02,02,09,960),(130,02,02,10,959),(131,02,02,11,958),(132,02,02,12,957),(133,02,02,13,956),(134,02,02,14,955),(136,02,02,16,953),(138,02,02,18,951),(140,02,02,20,949),(141,02,03,01,948),(142,02,03,02,947),(143,02,03,03,946),(144,02,03,04,945),(146,02,03,06,943),(147,02,03,07,942),(148,02,03,08,941),(149,02,03,09,940),(150,02,03,10,939),(151,02,03,11,938),(152,02,03,12,937),(153,02,03,13,936),(154,02,03,14,935),(156,02,03,16,933),(158,02,03,18,931),(159,02,03,19,930),(160,02,03,20,929),(162,02,04,02,927),(163,02,04,03,926),(164,02,04,04,925),(165,02,04,05,924),(166,02,04,06,923),(167,02,04,07,922),(168,02,04,08,921),(169,02,04,09,920),(171,02,04,11,918),(172,02,04,12,917),(173,02,04,13,916),(174,02,04,14,915),(175,02,04,15,914),(176,02,04,16,913),(177,02,04,17,912),(178,02,04,18,911),(179,02,04,19,910),(181,02,05,01,908),(182,02,05,02,907),(183,02,05,03,906),(184,02,05,04,905),(185,02,05,05,904),(186,02,05,06,903),(188,02,05,08,901),(189,02,05,09,900),(191,02,05,11,898),(192,02,05,12,897),(193,02,05,13,896),(194,02,05,14,895),(195,02,05,15,894),(196,02,05,16,893),(197,02,05,17,892),(198,02,05,18,891),(199,02,05,19,890),(200,02,05,20,889),(201,03,01,01,888),(202,03,01,02,887),(204,03,01,04,885),(205,03,01,05,884),(206,03,01,06,883),(207,03,01,07,882),(209,03,01,09,880),(210,03,01,10,879),(211,03,01,11,878),(212,03,01,12,877),(213,03,01,13,876),(214,03,01,14,875),(215,03,01,15,874),(216,03,01,16,873),(217,03,01,17,872),(218,03,01,18,871),(221,03,02,01,868),(223,03,02,03,866),(224,03,02,04,865),(225,03,02,05,864),(226,03,02,06,863),(229,03,02,09,860),(231,03,02,11,858),(233,03,02,13,856),(234,03,02,14,855),(235,03,02,15,854),(237,03,02,17,852),(238,03,02,18,851),(239,03,02,19,850),(240,03,02,20,849),(244,03,03,04,845),(245,03,03,05,844),(246,03,03,06,843),(247,03,03,07,842),(248,03,03,08,841),(249,03,03,09,840),(252,03,03,12,837),(253,03,03,13,836),(254,03,03,14,835),(255,03,03,15,834),(256,03,03,16,833),(258,03,03,18,831),(259,03,03,19,830),(260,03,03,20,829),(261,03,04,01,828),(262,03,04,02,827),(264,03,04,04,825),(267,03,04,07,822),(268,03,04,08,821),(269,03,04,09,820),(271,03,04,11,818),(272,03,04,12,817),(273,03,04,13,816),(274,03,04,14,815),(275,03,04,15,814),(276,03,04,16,813),(277,03,04,17,812),(278,03,04,18,811),(279,03,04,19,810),(280,03,04,20,809),(281,03,05,01,808),(282,03,05,02,807),(283,03,05,03,806),(284,03,05,04,805),(285,03,05,05,804),(286,03,05,06,803),(287,03,05,07,802),(289,03,05,09,800),(291,03,05,11,798),(293,03,05,13,796),(294,03,05,14,795),(296,03,05,16,793),(299,03,05,19,790),(300,03,05,20,789),(301,04,01,01,788),(302,04,01,02,787),(303,04,01,03,786),(304,04,01,04,785),(305,04,01,05,784),(306,04,01,06,783),(307,04,01,07,782),(308,04,01,08,781),(310,04,01,10,779),(311,04,01,11,778),(312,04,01,12,777),(314,04,01,14,775),(315,04,01,15,774),(316,04,01,16,773),(317,04,01,17,772),(318,04,01,18,771),(319,04,01,19,770),(320,04,01,20,769),(321,04,02,01,768),(324,04,02,04,765),(325,04,02,05,764),(326,04,02,06,763),(327,04,02,07,762),(328,04,02,08,761),(329,04,02,09,760),(330,04,02,10,759),(331,04,02,11,758),(332,04,02,12,757),(333,04,02,13,756),(334,04,02,14,755),(335,04,02,15,754),(336,04,02,16,753),(337,04,02,17,752),(339,04,02,19,750),(340,04,02,20,749),(341,04,03,01,748),(343,04,03,03,746),(344,04,03,04,745),(345,04,03,05,744),(346,04,03,06,743),(347,04,03,07,742),(348,04,03,08,741),(349,04,03,09,740),(350,04,03,10,739),(352,04,03,12,737),(354,04,03,14,735),(356,04,03,16,733),(357,04,03,17,732),(358,04,03,18,731),(359,04,03,19,730),(360,04,03,20,729),(362,04,04,02,727),(363,04,04,03,726),(364,04,04,04,725),(365,04,04,05,724),(366,04,04,06,723),(367,04,04,07,722),(368,04,04,08,721),(369,04,04,09,720),(370,04,04,10,719),(372,04,04,12,717),(374,04,04,14,715),(375,04,04,15,714),(376,04,04,16,713),(378,04,04,18,711),(379,04,04,19,710),(380,04,04,20,709),(381,04,05,01,708),(382,04,05,02,707),(383,04,05,03,706),(384,04,05,04,705),(385,04,05,05,704),(387,04,05,07,702),(388,04,05,08,701),(389,04,05,09,700),(390,04,05,10,699),(391,04,05,11,698),(392,04,05,12,697),(393,04,05,13,696),(394,04,05,14,695),(395,04,05,15,694),(397,04,05,17,692),(398,04,05,18,691),(399,04,05,19,690),(400,04,05,20,689),(401,05,01,01,688),(402,05,01,02,687),(404,05,01,04,685),(405,05,01,05,684),(407,05,01,07,682),(408,05,01,08,681),(409,05,01,09,680),(410,05,01,10,679),(411,05,01,11,678),(412,05,01,12,677),(413,05,01,13,676),(414,05,01,14,675),(415,05,01,15,674),(416,05,01,16,673),(417,05,01,17,672),(418,05,01,18,671),(420,05,01,20,669),(421,05,02,01,668),(422,05,02,02,667),(423,05,02,03,666),(425,05,02,05,664),(426,05,02,06,663),(427,05,02,07,662),(428,05,02,08,661),(429,05,02,09,660),(430,05,02,10,659),(431,05,02,11,658),(432,05,02,12,657),(433,05,02,13,656),(434,05,02,14,655),(437,05,02,17,652),(439,05,02,19,650),(440,05,02,20,649),(441,05,03,01,648),(442,05,03,02,647),(445,05,03,05,644),(447,05,03,07,642),(449,05,03,09,640),(450,05,03,10,639),(451,05,03,11,638),(453,05,03,13,636),(454,05,03,14,635),(455,05,03,15,634),(456,05,03,16,633),(460,05,03,20,629),(461,05,04,01,628),(462,05,04,02,627),(463,05,04,03,626),(464,05,04,04,625),(465,05,04,05,624),(468,05,04,08,621),(469,05,04,09,620),(470,05,04,10,619),(471,05,04,11,618),(472,05,04,12,617),(474,05,04,14,615),(475,05,04,15,614),(476,05,04,16,613),(477,05,04,17,612),(478,05,04,18,611),(480,05,04,20,609),(483,05,05,03,606),(484,05,05,04,605),(485,05,05,05,604),(487,05,05,07,602),(488,05,05,08,601),(489,05,05,09,600),(490,05,05,10,599),(491,05,05,11,598),(492,05,05,12,597),(493,05,05,13,596),(494,05,05,14,595),(495,05,05,15,594),(496,05,05,16,593),(497,05,05,17,592),(498,05,05,18,591),(499,05,05,19,590),(500,05,05,20,589),(501,06,01,01,588),(502,06,01,02,587),(503,06,01,03,586),(505,06,01,05,584),(507,06,01,07,582),(509,06,01,09,580),(510,06,01,10,579),(512,06,01,12,577),(515,06,01,15,574),(516,06,01,16,573),(517,06,01,17,572),(518,06,01,18,571),(519,06,01,19,570),(520,06,01,20,569),(521,06,02,01,568),(522,06,02,02,567),(523,06,02,03,566),(524,06,02,04,565),(526,06,02,06,563),(527,06,02,07,562),(528,06,02,08,561),(530,06,02,10,559),(531,06,02,11,558),(532,06,02,12,557),(533,06,02,13,556),(534,06,02,14,555),(535,06,02,15,554),(536,06,02,16,553),(537,06,02,17,552),(540,06,02,20,549),(541,06,03,01,548),(542,06,03,02,547),(543,06,03,03,546),(544,06,03,04,545),(545,06,03,05,544),(546,06,03,06,543),(547,06,03,07,542),(548,06,03,08,541),(549,06,03,09,540),(550,06,03,10,539),(551,06,03,11,538),(552,06,03,12,537),(553,06,03,13,536),(555,06,03,15,534),(556,06,03,16,533),(557,06,03,17,532),(559,06,03,19,530),(560,06,03,20,529),(561,06,04,01,528),(562,06,04,02,527),(563,06,04,03,526),(564,06,04,04,525),(565,06,04,05,524),(566,06,04,06,523),(568,06,04,08,521),(570,06,04,10,519),(572,06,04,12,517),(573,06,04,13,516),(574,06,04,14,515),(575,06,04,15,514),(576,06,04,16,513),(578,06,04,18,511),(579,06,04,19,510),(580,06,04,20,509),(581,06,05,01,508),(582,06,05,02,507),(583,06,05,03,506),(584,06,05,04,505),(585,06,05,05,504),(586,06,05,06,503),(588,06,05,08,501),(590,06,05,10,499),(591,06,05,11,498),(592,06,05,12,497),(594,06,05,14,495),(595,06,05,15,494),(596,06,05,16,493),(597,06,05,17,492),(598,06,05,18,491),(599,06,05,19,490),(600,06,05,20,489),(601,07,01,01,488),(603,07,01,03,486),(604,07,01,04,485),(605,07,01,05,484),(606,07,01,06,483),(607,07,01,07,482),(608,07,01,08,481),(609,07,01,09,480),(610,07,01,10,479),(611,07,01,11,478),(613,07,01,13,476),(614,07,01,14,475),(615,07,01,15,474),(616,07,01,16,473),(617,07,01,17,472),(618,07,01,18,471),(620,07,01,20,469),(621,07,02,01,468),(623,07,02,03,466),(624,07,02,04,465),(625,07,02,05,464),(626,07,02,06,463),(627,07,02,07,462),(628,07,02,08,461),(629,07,02,09,460),(630,07,02,10,459),(631,07,02,11,458),(632,07,02,12,457),(633,07,02,13,456),(634,07,02,14,455),(636,07,02,16,453),(637,07,02,17,452),(638,07,02,18,451),(639,07,02,19,450),(641,07,03,01,448),(642,07,03,02,447),(643,07,03,03,446),(644,07,03,04,445),(645,07,03,05,444),(646,07,03,06,443),(647,07,03,07,442),(648,07,03,08,441),(649,07,03,09,440),(650,07,03,10,439),(653,07,03,13,436),(655,07,03,15,434),(656,07,03,16,433),(657,07,03,17,432),(658,07,03,18,431),(661,07,04,01,428),(663,07,04,03,426),(665,07,04,05,424),(666,07,04,06,423),(667,07,04,07,422),(669,07,04,09,420),(670,07,04,10,419),(671,07,04,11,418),(672,07,04,12,417),(676,07,04,16,413),(677,07,04,17,412),(678,07,04,18,411),(679,07,04,19,410),(680,07,04,20,409),(681,07,05,01,408),(684,07,05,04,405),(685,07,05,05,404),(686,07,05,06,403),(687,07,05,07,402),(688,07,05,08,401),(690,07,05,10,399),(691,07,05,11,398),(692,07,05,12,397),(693,07,05,13,396),(694,07,05,14,395),(696,07,05,16,393),(699,07,05,19,390),(700,07,05,20,389),(701,08,01,01,388),(703,08,01,03,386),(704,08,01,04,385),(705,08,01,05,384),(706,08,01,06,383),(707,08,01,07,382),(708,08,01,08,381),(709,08,01,09,380),(710,08,01,10,379),(711,08,01,11,378),(712,08,01,12,377),(713,08,01,13,376),(714,08,01,14,375),(715,08,01,15,374),(716,08,01,16,373),(717,08,01,17,372),(718,08,01,18,371),(719,08,01,19,370),(721,08,02,01,368),(723,08,02,03,366),(725,08,02,05,364),(726,08,02,06,363),(728,08,02,08,361),(731,08,02,11,358),(732,08,02,12,357),(733,08,02,13,356),(734,08,02,14,355),(735,08,02,15,354),(736,08,02,16,353),(737,08,02,17,352),(738,08,02,18,351),(739,08,02,19,350),(740,08,02,20,349),(742,08,03,02,347),(743,08,03,03,346),(744,08,03,04,345),(746,08,03,06,343),(747,08,03,07,342),(748,08,03,08,341),(749,08,03,09,340),(750,08,03,10,339),(751,08,03,11,338),(752,08,03,12,337),(753,08,03,13,336),(756,08,03,16,333),(757,08,03,17,332),(758,08,03,18,331),(759,08,03,19,330),(760,08,03,20,329),(761,08,04,01,328),(762,08,04,02,327),(763,08,04,03,326),(764,08,04,04,325),(765,08,04,05,324),(766,08,04,06,323),(767,08,04,07,322),(768,08,04,08,321),(769,08,04,09,320),(771,08,04,11,318),(772,08,04,12,317),(773,08,04,13,316),(775,08,04,15,314),(776,08,04,16,313),(777,08,04,17,312),(778,08,04,18,311),(779,08,04,19,310),(780,08,04,20,309),(781,08,05,01,308),(782,08,05,02,307),(784,08,05,04,305),(786,08,05,06,303),(788,08,05,08,301),(789,08,05,09,300),(790,08,05,10,299),(791,08,05,11,298),(792,08,05,12,297),(794,08,05,14,295),(795,08,05,15,294),(796,08,05,16,293),(797,08,05,17,292),(798,08,05,18,291),(799,08,05,19,290),(800,08,05,20,289),(801,09,01,01,288),(802,09,01,02,287),(804,09,01,04,285),(806,09,01,06,283),(807,09,01,07,282),(808,09,01,08,281),(810,09,01,10,279),(811,09,01,11,278),(812,09,01,12,277),(813,09,01,13,276),(814,09,01,14,275),(815,09,01,15,274),(816,09,01,16,273),(817,09,01,17,272),(819,09,01,19,270),(820,09,01,20,269),(821,09,02,01,268),(822,09,02,02,267),(823,09,02,03,266),(824,09,02,04,265),(825,09,02,05,264),(826,09,02,06,263),(827,09,02,07,262),(829,09,02,09,260),(830,09,02,10,259),(831,09,02,11,258),(832,09,02,12,257),(833,09,02,13,256),(834,09,02,14,255),(836,09,02,16,253),(837,09,02,17,252),(839,09,02,19,250),(840,09,02,20,249),(841,09,03,01,248),(842,09,03,02,247),(843,09,03,03,246),(844,09,03,04,245),(845,09,03,05,244),(846,09,03,06,243),(847,09,03,07,242),(848,09,03,08,241),(849,09,03,09,240),(850,09,03,10,239),(852,09,03,12,237),(853,09,03,13,236),(854,09,03,14,235),(855,09,03,15,234),(857,09,03,17,232),(858,09,03,18,231),(859,09,03,19,230),(860,09,03,20,229),(861,09,04,01,228),(862,09,04,02,227),(863,09,04,03,226),(864,09,04,04,225),(865,09,04,05,224),(866,09,04,06,223),(869,09,04,09,220),(871,09,04,11,218),(872,09,04,12,217),(873,09,04,13,216),(874,09,04,14,215),(877,09,04,17,212),(879,09,04,19,210),(881,09,05,01,208),(882,09,05,02,207),(883,09,05,03,206),(885,09,05,05,204),(886,09,05,06,203),(887,09,05,07,202),(888,09,05,08,201),(892,09,05,12,197),(893,09,05,13,196),(894,09,05,14,195),(895,09,05,15,194),(896,09,05,16,193),(897,09,05,17,192),(900,09,05,20,189),(901,10,01,01,188),(902,10,01,02,187),(903,10,01,03,186),(904,10,01,04,185),(906,10,01,06,183),(907,10,01,07,182),(908,10,01,08,181),(909,10,01,09,180),(910,10,01,10,179),(911,10,01,11,178),(913,10,01,13,176),(915,10,01,15,174),(917,10,01,17,172),(918,10,01,18,171),(920,10,01,20,169),(921,10,02,01,168),(922,10,02,02,167),(923,10,02,03,166),(924,10,02,04,165),(925,10,02,05,164),(927,10,02,07,162),(928,10,02,08,161),(929,10,02,09,160),(930,10,02,10,159),(931,10,02,11,158),(932,10,02,12,157),(933,10,02,13,156),(934,10,02,14,155),(935,10,02,15,154),(936,10,02,16,153),(937,10,02,17,152),(938,10,02,18,151),(939,10,02,19,150),(940,10,02,20,149),(941,10,03,01,148),(942,10,03,02,147),(943,10,03,03,146),(945,10,03,05,144),(947,10,03,07,142),(949,10,03,09,140),(950,10,03,10,139),(952,10,03,12,137),(955,10,03,15,134),(956,10,03,16,133),(957,10,03,17,132),(958,10,03,18,131),(959,10,03,19,130),(960,10,03,20,129),(961,10,04,01,128),(962,10,04,02,127),(963,10,04,03,126),(964,10,04,04,125),(966,10,04,06,123),(967,10,04,07,122),(968,10,04,08,121),(970,10,04,10,119),(971,10,04,11,118),(972,10,04,12,117),(973,10,04,13,116),(974,10,04,14,115),(975,10,04,15,114),(976,10,04,16,113),(977,10,04,17,112),(980,10,04,20,109),(981,10,05,01,108),(982,10,05,02,107),(983,10,05,03,106),(984,10,05,04,105),(985,10,05,05,104),(986,10,05,06,103),(987,10,05,07,102),(988,10,05,08,101),(989,10,05,09,100),(990,10,05,10,99),(991,10,05,11,98),(992,10,05,12,97),(993,10,05,13,96),(995,10,05,15,94),(996,10,05,16,93),(997,10,05,17,92),(999,10,05,19,90),(1000,10,05,20,89),(1001,11,01,01,88),(1002,11,01,02,87),(1003,11,01,03,86),(1004,11,01,04,85),(1005,11,01,05,84),(1006,11,01,06,83),(1008,11,01,08,81),(1010,11,01,10,79),(1012,11,01,12,77),(1013,11,01,13,76),(1014,11,01,14,75),(1015,11,01,15,74),(1016,11,01,16,73),(1018,11,01,18,71),(1019,11,01,19,70),(1020,11,01,20,69),(1021,11,02,01,68),(1022,11,02,02,67),(1023,11,02,03,66),(1024,11,02,04,65),(1025,11,02,05,64),(1026,11,02,06,63),(1028,11,02,08,61),(1030,11,02,10,59),(1031,11,02,11,58),(1032,11,02,12,57),(1034,11,02,14,55),(1035,11,02,15,54),(1036,11,02,16,53),(1037,11,02,17,52),(1038,11,02,18,51),(1039,11,02,19,50),(1040,11,02,20,49),(1041,11,03,01,48),(1043,11,03,03,46),(1044,11,03,04,45),(1045,11,03,05,44),(1046,11,03,06,43),(1047,11,03,07,42),(1048,11,03,08,41),(1049,11,03,09,40),(1050,11,03,10,39),(1051,11,03,11,38),(1053,11,03,13,36),(1054,11,03,14,35),(1055,11,03,15,34),(1056,11,03,16,33),(1057,11,03,17,32),(1058,11,03,18,31),(1060,11,03,20,29),(1061,11,04,01,28),(1063,11,04,03,26),(1064,11,04,04,25),(1065,11,04,05,24),(1066,11,04,06,23),(1067,11,04,07,22),(1068,11,04,08,21),(1069,11,04,09,20),(1070,11,04,10,19),(1071,11,04,11,18),(1072,11,04,12,17),(1073,11,04,13,16),(1074,11,04,14,15),(1076,11,04,16,13),(1077,11,04,17,12),(1078,11,04,18,11),(1079,11,04,19,10),(1081,11,05,01,8),(1082,11,05,02,7),(1083,11,05,03,6),(1084,11,05,04,5),(1085,11,05,05,4),(1086,11,05,06,3),(1087,11,05,07,2),(1088,11,05,08,1),(1089,11,05,09,NULL),(1090,11,05,10,NULL),(1091,11,05,11,NULL),(1092,11,05,12,NULL),(1093,11,05,13,NULL),(1094,11,05,14,NULL),(1095,11,05,15,NULL),(1096,11,05,16,NULL),(1097,11,05,17,NULL),(1098,11,05,18,NULL),(1099,11,05,19,NULL),(1100,11,05,20,NULL),(1101,12,01,01,NULL),(1102,12,01,02,NULL),(1103,12,01,03,NULL),(1104,12,01,04,NULL),(1105,12,01,05,NULL),(1106,12,01,06,NULL),(1107,12,01,07,NULL),(1108,12,01,08,NULL),(1109,12,01,09,NULL),(1110,12,01,10,NULL),(1111,12,01,11,NULL),(1112,12,01,12,NULL),(1113,12,01,13,NULL),(1114,12,01,14,NULL),(1115,12,01,15,NULL),(1116,12,01,16,NULL),(1117,12,01,17,NULL),(1118,12,01,18,NULL),(1119,12,01,19,NULL),(1120,12,01,20,NULL),(1121,12,02,01,NULL),(1122,12,02,02,NULL),(1123,12,02,03,NULL),(1124,12,02,04,NULL),(1125,12,02,05,NULL),(1126,12,02,06,NULL),(1127,12,02,07,NULL),(1128,12,02,08,NULL),(1129,12,02,09,NULL),(1130,12,02,10,NULL),(1131,12,02,11,NULL),(1132,12,02,12,NULL),(1133,12,02,13,NULL),(1134,12,02,14,NULL),(1135,12,02,15,NULL),(1136,12,02,16,NULL),(1137,12,02,17,NULL),(1138,12,02,18,NULL),(1139,12,02,19,NULL),(1140,12,02,20,NULL),(1141,12,03,01,NULL),(1142,12,03,02,NULL),(1143,12,03,03,NULL),(1144,12,03,04,NULL),(1145,12,03,05,NULL),(1146,12,03,06,NULL),(1147,12,03,07,NULL),(1148,12,03,08,NULL),(1149,12,03,09,NULL),(1150,12,03,10,NULL),(1151,12,03,11,NULL),(1152,12,03,12,NULL),(1153,12,03,13,NULL),(1154,12,03,14,NULL),(1155,12,03,15,NULL),(1156,12,03,16,NULL),(1157,12,03,17,NULL),(1158,12,03,18,NULL),(1159,12,03,19,NULL),(1160,12,03,20,NULL),(1161,12,04,01,NULL),(1162,12,04,02,NULL),(1163,12,04,03,NULL),(1164,12,04,04,NULL),(1165,12,04,05,NULL),(1166,12,04,06,NULL),(1167,12,04,07,NULL),(1168,12,04,08,NULL),(1169,12,04,09,NULL),(1170,12,04,10,NULL),(1171,12,04,11,NULL),(1172,12,04,12,NULL),(1173,12,04,13,NULL),(1174,12,04,14,NULL),(1175,12,04,15,NULL),(1176,12,04,16,NULL),(1177,12,04,17,NULL),(1178,12,04,18,NULL),(1179,12,04,19,NULL),(1180,12,04,20,NULL),(1181,12,05,01,NULL),(1182,12,05,02,NULL),(1183,12,05,03,NULL),(1184,12,05,04,NULL),(1185,12,05,05,NULL),(1186,12,05,06,NULL),(1187,12,05,07,NULL),(1188,12,05,08,NULL),(1189,12,05,09,NULL),(1190,12,05,10,NULL),(1191,12,05,11,NULL),(1192,12,05,12,NULL),(1193,12,05,13,NULL),(1194,12,05,14,NULL),(1195,12,05,15,NULL),(1196,12,05,16,NULL),(1197,12,05,17,NULL),(1198,12,05,18,NULL),(1199,12,05,19,NULL),(1200,12,05,20,NULL),(1201,13,01,01,NULL),(1202,13,01,02,NULL),(1203,13,01,03,NULL),(1204,13,01,04,NULL),(1205,13,01,05,NULL),(1206,13,01,06,NULL),(1207,13,01,07,NULL),(1208,13,01,08,NULL),(1209,13,01,09,NULL),(1210,13,01,10,NULL),(1211,13,01,11,NULL),(1212,13,01,12,NULL),(1213,13,01,13,NULL),(1214,13,01,14,NULL),(1215,13,01,15,NULL),(1216,13,01,16,NULL),(1217,13,01,17,NULL),(1218,13,01,18,NULL),(1219,13,01,19,NULL),(1220,13,01,20,NULL),(1221,13,02,01,NULL),(1222,13,02,02,NULL),(1223,13,02,03,NULL),(1224,13,02,04,NULL),(1225,13,02,05,NULL),(1226,13,02,06,NULL),(1227,13,02,07,NULL),(1228,13,02,08,NULL),(1229,13,02,09,NULL),(1230,13,02,10,NULL),(1231,13,02,11,NULL),(1232,13,02,12,NULL),(1233,13,02,13,NULL),(1234,13,02,14,NULL),(1235,13,02,15,NULL),(1236,13,02,16,NULL),(1237,13,02,17,NULL),(1238,13,02,18,NULL),(1239,13,02,19,NULL),(1240,13,02,20,NULL),(1241,13,03,01,NULL),(1242,13,03,02,NULL),(1243,13,03,03,NULL),(1244,13,03,04,NULL),(1245,13,03,05,NULL),(1246,13,03,06,NULL),(1247,13,03,07,NULL),(1248,13,03,08,NULL),(1249,13,03,09,NULL),(1250,13,03,10,NULL),(1251,13,03,11,NULL),(1252,13,03,12,NULL),(1253,13,03,13,NULL),(1254,13,03,14,NULL),(1255,13,03,15,NULL),(1256,13,03,16,NULL),(1257,13,03,17,NULL),(1258,13,03,18,NULL),(1259,13,03,19,NULL),(1260,13,03,20,NULL),(1261,13,04,01,NULL),(1262,13,04,02,NULL),(1263,13,04,03,NULL),(1264,13,04,04,NULL),(1265,13,04,05,NULL),(1266,13,04,06,NULL),(1267,13,04,07,NULL),(1268,13,04,08,NULL),(1269,13,04,09,NULL),(1270,13,04,10,NULL),(1271,13,04,11,NULL),(1272,13,04,12,NULL),(1273,13,04,13,NULL),(1274,13,04,14,NULL),(1275,13,04,15,NULL),(1276,13,04,16,NULL),(1277,13,04,17,NULL),(1278,13,04,18,NULL),(1279,13,04,19,NULL),(1280,13,04,20,NULL),(1281,13,05,01,NULL),(1282,13,05,02,NULL),(1283,13,05,03,NULL),(1284,13,05,04,NULL),(1285,13,05,05,NULL),(1286,13,05,06,NULL),(1287,13,05,07,NULL),(1288,13,05,08,NULL),(1289,13,05,09,NULL),(1290,13,05,10,NULL),(1291,13,05,11,NULL),(1292,13,05,12,NULL),(1293,13,05,13,NULL),(1294,13,05,14,NULL),(1295,13,05,15,NULL),(1296,13,05,16,NULL),(1297,13,05,17,NULL),(1298,13,05,18,NULL),(1299,13,05,19,NULL),(1300,13,05,20,NULL),(1301,14,01,01,NULL),(1302,14,01,02,NULL),(1303,14,01,03,NULL),(1304,14,01,04,NULL),(1305,14,01,05,NULL),(1306,14,01,06,NULL),(1307,14,01,07,NULL),(1308,14,01,08,NULL),(1309,14,01,09,NULL),(1310,14,01,10,NULL),(1311,14,01,11,NULL),(1312,14,01,12,NULL),(1313,14,01,13,NULL),(1314,14,01,14,NULL),(1315,14,01,15,NULL),(1316,14,01,16,NULL),(1317,14,01,17,NULL),(1318,14,01,18,NULL),(1319,14,01,19,NULL),(1320,14,01,20,NULL),(1321,14,02,01,NULL),(1322,14,02,02,NULL),(1323,14,02,03,NULL),(1324,14,02,04,NULL),(1325,14,02,05,NULL),(1326,14,02,06,NULL),(1327,14,02,07,NULL),(1328,14,02,08,NULL),(1329,14,02,09,NULL),(1330,14,02,10,NULL),(1331,14,02,11,NULL),(1332,14,02,12,NULL),(1333,14,02,13,NULL),(1334,14,02,14,NULL),(1335,14,02,15,NULL),(1336,14,02,16,NULL),(1337,14,02,17,NULL),(1338,14,02,18,NULL),(1339,14,02,19,NULL),(1340,14,02,20,NULL),(1341,14,03,01,NULL),(1342,14,03,02,NULL),(1343,14,03,03,NULL),(1344,14,03,04,NULL),(1345,14,03,05,NULL),(1346,14,03,06,NULL),(1347,14,03,07,NULL),(1348,14,03,08,NULL),(1349,14,03,09,NULL),(1350,14,03,10,NULL),(1351,14,03,11,NULL),(1352,14,03,12,NULL),(1353,14,03,13,NULL),(1354,14,03,14,NULL),(1355,14,03,15,NULL),(1356,14,03,16,NULL),(1357,14,03,17,NULL),(1358,14,03,18,NULL),(1359,14,03,19,NULL),(1360,14,03,20,NULL),(1361,14,04,01,NULL),(1362,14,04,02,NULL),(1363,14,04,03,NULL),(1364,14,04,04,NULL),(1365,14,04,05,NULL),(1366,14,04,06,NULL),(1367,14,04,07,NULL),(1368,14,04,08,NULL),(1369,14,04,09,NULL),(1370,14,04,10,NULL),(1371,14,04,11,NULL),(1372,14,04,12,NULL),(1373,14,04,13,NULL),(1374,14,04,14,NULL),(1375,14,04,15,NULL),(1376,14,04,16,NULL),(1377,14,04,17,NULL),(1378,14,04,18,NULL),(1379,14,04,19,NULL),(1380,14,04,20,NULL),(1381,14,05,01,NULL),(1382,14,05,02,NULL),(1383,14,05,03,NULL),(1384,14,05,04,NULL),(1385,14,05,05,NULL),(1386,14,05,06,NULL),(1387,14,05,07,NULL),(1388,14,05,08,NULL),(1389,14,05,09,NULL),(1390,14,05,10,NULL),(1391,14,05,11,NULL),(1392,14,05,12,NULL),(1393,14,05,13,NULL),(1394,14,05,14,NULL),(1395,14,05,15,NULL),(1396,14,05,16,NULL),(1397,14,05,17,NULL),(1398,14,05,18,NULL),(1399,14,05,19,NULL),(1400,14,05,20,NULL),(1401,15,01,01,NULL),(1402,15,01,02,NULL),(1403,15,01,03,NULL),(1404,15,01,04,NULL),(1405,15,01,05,NULL),(1406,15,01,06,NULL),(1407,15,01,07,NULL),(1408,15,01,08,NULL),(1409,15,01,09,NULL),(1410,15,01,10,NULL),(1411,15,01,11,NULL),(1412,15,01,12,NULL),(1413,15,01,13,NULL),(1414,15,01,14,NULL),(1415,15,01,15,NULL),(1416,15,01,16,NULL),(1417,15,01,17,NULL),(1418,15,01,18,NULL),(1419,15,01,19,NULL),(1420,15,01,20,NULL),(1421,15,02,01,NULL),(1422,15,02,02,NULL),(1423,15,02,03,NULL),(1424,15,02,04,NULL),(1425,15,02,05,NULL),(1426,15,02,06,NULL),(1427,15,02,07,NULL),(1428,15,02,08,NULL),(1429,15,02,09,NULL),(1430,15,02,10,NULL),(1431,15,02,11,NULL),(1432,15,02,12,NULL),(1433,15,02,13,NULL),(1434,15,02,14,NULL),(1435,15,02,15,NULL),(1436,15,02,16,NULL),(1437,15,02,17,NULL),(1438,15,02,18,NULL),(1439,15,02,19,NULL),(1440,15,02,20,NULL),(1441,15,03,01,NULL),(1442,15,03,02,NULL),(1443,15,03,03,NULL),(1444,15,03,04,NULL),(1445,15,03,05,NULL),(1446,15,03,06,NULL),(1447,15,03,07,NULL),(1448,15,03,08,NULL),(1449,15,03,09,NULL),(1450,15,03,10,NULL),(1451,15,03,11,NULL),(1452,15,03,12,NULL),(1453,15,03,13,NULL),(1454,15,03,14,NULL),(1455,15,03,15,NULL),(1456,15,03,16,NULL),(1457,15,03,17,NULL),(1458,15,03,18,NULL),(1459,15,03,19,NULL),(1460,15,03,20,NULL),(1461,15,04,01,NULL),(1462,15,04,02,NULL),(1463,15,04,03,NULL),(1464,15,04,04,NULL),(1465,15,04,05,NULL),(1466,15,04,06,NULL),(1467,15,04,07,NULL),(1468,15,04,08,NULL),(1469,15,04,09,NULL),(1470,15,04,10,NULL),(1471,15,04,11,NULL),(1472,15,04,12,NULL),(1473,15,04,13,NULL),(1474,15,04,14,NULL),(1475,15,04,15,NULL),(1476,15,04,16,NULL),(1477,15,04,17,NULL),(1478,15,04,18,NULL),(1479,15,04,19,NULL),(1480,15,04,20,NULL),(1481,15,05,01,NULL),(1482,15,05,02,NULL),(1483,15,05,03,NULL),(1484,15,05,04,NULL),(1485,15,05,05,NULL),(1486,15,05,06,NULL),(1487,15,05,07,NULL),(1488,15,05,08,NULL),(1489,15,05,09,NULL),(1490,15,05,10,NULL),(1491,15,05,11,NULL),(1492,15,05,12,NULL),(1493,15,05,13,NULL),(1494,15,05,14,NULL),(1495,15,05,15,NULL),(1496,15,05,16,NULL),(1497,15,05,17,NULL),(1498,15,05,18,NULL),(1499,15,05,19,NULL),(1500,15,05,20,NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_history`
--

DROP TABLE IF EXISTS `membership_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_history` (
  `customer_id` int DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `membership_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `membership_history_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_history`
--

LOCK TABLES `membership_history` WRITE;
/*!40000 ALTER TABLE `membership_history` DISABLE KEYS */;
INSERT INTO `membership_history` VALUES (25,1,'2023-01-03','2023-04-03'),(109,1,'2023-04-15','2023-07-14'),(75,1,'2023-03-25','2023-06-23'),(134,1,'2023-02-22','2023-05-23'),(42,1,'2023-01-23','2023-04-23'),(135,1,'2023-03-31','2023-06-29'),(188,1,'2023-12-12','2024-03-11'),(108,1,'2023-07-14','2023-10-12'),(184,1,'2023-02-23','2023-05-24'),(102,1,'2023-10-07','2024-01-05'),(117,1,'2023-01-31','2023-05-01'),(55,1,'2023-05-21','2023-08-19'),(71,1,'2023-09-19','2023-12-18'),(129,1,'2023-09-29','2023-12-28'),(10,2,'2023-04-21','2023-07-20'),(19,2,'2023-01-23','2023-04-23'),(20,2,'2023-08-15','2023-11-13'),(81,2,'2023-10-22','2024-01-20'),(53,2,'2023-07-10','2023-10-08'),(170,2,'2023-08-17','2023-11-15'),(87,2,'2023-07-09','2023-10-07'),(191,2,'2023-11-12','2024-02-10'),(50,2,'2023-04-25','2023-07-24'),(166,2,'2023-09-14','2023-12-13'),(33,2,'2023-06-27','2023-09-25'),(60,2,'2023-09-15','2023-12-14'),(86,3,'2023-01-05','2023-04-05'),(27,3,'2023-09-08','2023-12-07'),(161,3,'2023-02-07','2023-05-08'),(72,3,'2023-12-14','2024-03-13'),(14,3,'2023-02-22','2023-05-23'),(34,3,'2023-10-27','2024-01-25'),(45,3,'2023-11-21','2024-02-19'),(167,3,'2023-07-27','2023-10-25'),(79,3,'2023-04-06','2023-07-05'),(52,3,'2023-04-06','2023-07-05'),(113,3,'2023-08-09','2023-11-07'),(153,3,'2023-03-31','2023-06-29'),(125,3,'2023-11-06','2024-02-04'),(195,3,'2023-03-28','2023-06-26'),(133,3,'2023-04-18','2023-07-17'),(162,4,'2023-03-01','2023-05-30'),(140,4,'2023-01-04','2023-04-04'),(97,4,'2023-08-05','2023-11-03'),(51,4,'2023-01-18','2023-04-18'),(58,4,'2023-07-04','2023-10-02'),(145,4,'2023-01-04','2023-04-04'),(111,4,'2023-08-22','2023-11-20'),(159,4,'2023-08-10','2023-11-08'),(62,4,'2023-09-19','2023-12-18'),(59,4,'2023-09-14','2023-12-13'),(200,4,'2023-04-04','2023-07-03'),(130,4,'2023-04-24','2023-07-23'),(157,5,'2023-04-15','2024-04-14'),(99,5,'2023-04-14','2024-04-13'),(107,5,'2023-05-29','2024-05-28'),(105,5,'2023-09-26','2024-09-25'),(48,5,'2023-05-23','2024-05-22'),(9,5,'2023-05-19','2024-05-18'),(139,5,'2023-06-20','2024-06-19'),(171,5,'2023-04-11','2024-04-10'),(40,5,'2023-04-13','2024-04-12'),(189,5,'2023-11-16','2024-11-15'),(131,5,'2023-03-14','2024-03-13'),(28,5,'2023-08-26','2024-08-25'),(196,6,'2023-01-20','2024-01-20'),(121,6,'2023-04-19','2024-04-18'),(146,6,'2023-10-22','2024-10-21'),(41,6,'2023-01-25','2024-01-25'),(84,6,'2023-04-16','2024-04-15'),(190,6,'2023-10-31','2024-10-30'),(96,6,'2023-05-12','2024-05-11'),(44,6,'2023-06-21','2024-06-20'),(158,6,'2023-05-11','2024-05-10'),(11,6,'2023-06-02','2024-06-01'),(178,6,'2023-08-20','2024-08-19'),(82,6,'2023-05-20','2024-05-19'),(164,6,'2023-08-23','2024-08-22'),(128,7,'2023-05-20','2024-05-19'),(198,7,'2023-06-22','2024-06-21'),(74,7,'2023-05-03','2024-05-02'),(65,7,'2023-03-02','2024-03-01'),(136,7,'2023-03-26','2024-03-25'),(174,7,'2023-02-10','2024-02-10'),(148,7,'2023-03-23','2024-03-22'),(92,7,'2023-05-03','2024-05-02'),(90,7,'2023-05-12','2024-05-11'),(67,7,'2023-02-22','2024-02-22'),(106,7,'2023-06-29','2024-06-28'),(120,8,'2023-04-09','2024-04-08'),(37,8,'2023-04-23','2024-04-22'),(100,8,'2023-01-15','2024-01-15'),(156,8,'2023-02-04','2024-02-04'),(77,8,'2023-01-02','2024-01-02'),(89,8,'2023-09-13','2024-09-12'),(35,8,'2023-01-21','2024-01-21'),(49,8,'2023-07-10','2024-07-09');
/*!40000 ALTER TABLE `membership_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `number of books by a genre`
--

DROP TABLE IF EXISTS `number of books by a genre`;
/*!50001 DROP VIEW IF EXISTS `number of books by a genre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `number of books by a genre` AS SELECT 
 1 AS `name`,
 1 AS `number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `number of books by a publisher`
--

DROP TABLE IF EXISTS `number of books by a publisher`;
/*!50001 DROP VIEW IF EXISTS `number of books by a publisher`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `number of books by a publisher` AS SELECT 
 1 AS `name`,
 1 AS `number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `number of books by an author`
--

DROP TABLE IF EXISTS `number of books by an author`;
/*!50001 DROP VIEW IF EXISTS `number of books by an author`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `number of books by an author` AS SELECT 
 1 AS `name`,
 1 AS `number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `number of books by year`
--

DROP TABLE IF EXISTS `number of books by year`;
/*!50001 DROP VIEW IF EXISTS `number of books by year`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `number of books by year` AS SELECT 
 1 AS `year`,
 1 AS `number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `number of copies of books`
--

DROP TABLE IF EXISTS `number of copies of books`;
/*!50001 DROP VIEW IF EXISTS `number of copies of books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `number of copies of books` AS SELECT 
 1 AS `name`,
 1 AS `copies`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `days` tinyint(2) unsigned zerofill DEFAULT NULL,
  `books` tinyint(1) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `validity` varchar(10) DEFAULT NULL,
  UNIQUE KEY `UC_PLANS_ID` (`id`,`cost`,`validity`,`days`,`books`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--
-- ORDER BY:  `id`,`cost`,`validity`,`days`,`books`

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,15,1,100.00,'90'),(2,15,2,200.00,'90'),(3,15,3,300.00,'90'),(4,15,4,400.00,'90'),(5,15,1,350.00,'365'),(6,15,2,700.00,'365'),(7,15,3,1050.00,'365'),(8,15,4,1400.00,'365');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  UNIQUE KEY `UC_PUBLISHERS_ID` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--
-- ORDER BY:  `id`,`name`

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'Crown Publishing Group'),(2,'Bhaktivedant Book Trust'),(3,'William Morrow Paperbacks'),(4,'St. Martin’s Press'),(5,'Penguin Random House'),(6,'Dover Publications'),(7,'Harpercollins Pulishers'),(8,'P M A Communications W Clement Stone'),(9,'Harpercollins'),(10,'Bantam'),(11,'Collins'),(12,'Fontana'),(13,'Pan Macmillan'),(14,'Collins Crime Club'),(15,'Black Dog & Leventhal Publishers'),(16,'Amazon Publishing'),(17,'Leadstart Publishing Pvt'),(18,'Walker Books Ltd'),(19,'Philomel Books'),(20,'Rupa & Company'),(21,'Rupa Publications Pvt'),(22,'Rupa Publications India'),(23,'Penguin Usa'),(24,'Armada'),(25,'Armada Bks'),(26,'Grosset And Dunlap'),(27,'Harpertrophy'),(28,'Scholastic'),(29,'Bloomsbury Publishing'),(30,'Little Brown'),(31,'Scholastic Incorporated'),(32,'Scholastic Paperbacks'),(33,'Scholastic India'),(34,'Scholastic Inc.'),(35,'Jaico Publishing House'),(36,'Sudha Enterprises'),(37,'Vasantha Prakashana'),(40,'Random House Books For Young Readers'),(41,'Random House Children’s Books'),(42,'Egmont'),(43,'St. Martin’s Paperbacks'),(44,'Knopf Doubleday Publishing Group');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentals` (
  `book_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `rental_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `UC_RENTALS_ID` (`id`),
  KEY `book_id` (`book_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--
-- ORDER BY:  `id`

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;
INSERT INTO `rentals` VALUES (922,128,'2023-05-20','2023-05-21',1),(648,120,'2023-04-09','2023-04-18',3),(278,198,'2023-06-22','2023-06-28',5),(961,196,'2023-02-04','2023-02-06',6),(817,37,'2023-04-23','2023-05-04',7),(759,86,'2023-01-05','2023-01-19',8),(940,140,'2023-01-04','2023-01-12',9),(274,100,'2023-05-10','2023-05-23',10),(579,109,'2023-04-15','2023-04-18',13),(151,74,'2023-06-01','2023-06-02',16),(92,156,'2023-12-09','2023-12-18',18),(660,157,'2023-06-19','2023-06-20',19),(456,75,'2023-03-25','2023-04-01',20),(144,77,'2023-05-17','2023-05-22',21),(1081,65,'2023-12-21','2023-12-24',22),(208,89,'2023-09-13','2023-09-14',23),(393,134,'2023-05-12','2023-05-21',24),(1016,99,'2023-11-14','2023-11-26',25),(572,41,'2023-01-25','2023-02-09',26),(926,134,'2023-02-22','2023-03-03',28),(957,161,'2023-02-07','2023-02-20',29),(248,72,'2023-12-14','2023-12-26',31),(240,42,'2023-01-23','2023-02-05',32),(480,84,'2023-04-16','2023-04-30',33),(377,107,'2023-08-28','2023-09-06',34),(740,128,'2023-09-12','2023-09-25',35),(940,156,'2023-06-06','2023-06-08',36),(570,135,'2023-03-31','2023-04-05',38),(878,14,'2023-02-22','2023-03-09',39),(18,196,'2023-01-20','2023-02-02',40),(161,19,'2023-01-23','2023-01-28',42),(1022,34,'2023-10-27','2023-10-29',44),(66,27,'2023-09-08','2023-09-15',46),(65,174,'2023-02-27','2023-03-13',47),(352,35,'2023-11-29','2023-12-14',48),(131,20,'2023-08-15','2023-08-28',49),(1032,25,'2023-01-03','2023-01-16',50),(913,45,'2023-11-21','2023-11-29',51),(206,105,'2023-09-26','2023-09-28',52),(764,81,'2023-10-22','2023-10-23',53),(356,190,'2023-10-31','2023-11-09',55),(330,170,'2023-08-17','2023-08-23',56),(671,96,'2023-05-12','2023-05-24',57),(604,162,'2023-03-01','2023-03-05',61),(507,53,'2023-07-10','2023-07-19',62),(167,65,'2023-03-02','2023-03-17',63),(28,167,'2023-07-27','2023-07-31',64),(744,145,'2023-01-04','2023-01-05',65),(958,148,'2023-03-24','2023-04-06',66),(975,79,'2023-04-06','2023-04-17',67),(547,108,'2023-07-14','2023-07-29',68),(86,174,'2023-02-10','2023-02-22',70),(994,87,'2023-07-09','2023-07-11',71),(197,191,'2023-11-12','2023-11-24',72),(985,50,'2023-04-25','2023-05-06',74),(122,166,'2023-09-14','2023-09-23',75),(988,156,'2023-02-04','2023-02-06',77),(600,33,'2023-06-27','2023-07-07',78),(860,9,'2023-05-19','2023-05-30',79),(898,92,'2023-05-03','2023-05-16',80),(317,60,'2023-09-15','2023-09-25',81),(711,184,'2023-02-23','2023-03-09',82),(675,35,'2023-12-29','2024-01-10',83),(628,100,'2023-01-15','2023-01-22',84),(821,44,'2023-06-21','2023-06-23',85),(840,139,'2023-06-20','2023-07-05',86),(525,111,'2023-08-22','2023-09-05',87),(895,52,'2023-04-06','2023-04-14',89),(1049,157,'2023-04-15','2023-04-16',91),(388,158,'2023-05-11','2023-05-24',92),(572,99,'2023-04-14','2023-04-26',93),(506,159,'2023-08-20','2023-09-03',94),(533,35,'2023-08-25','2023-09-05',95),(1041,40,'2023-08-14','2023-08-26',97),(971,35,'2023-04-12','2023-04-16',98),(596,140,'2023-02-28','2023-03-12',103),(419,113,'2023-08-09','2023-08-20',104),(742,153,'2023-05-23','2023-05-28',108),(865,189,'2023-11-16','2023-11-23',109),(368,90,'2023-06-21','2023-07-03',111),(225,62,'2023-09-19','2023-09-23',112),(379,59,'2023-09-14','2023-09-25',115),(841,140,'2023-01-25','2023-02-02',116),(1036,102,'2023-10-07','2023-10-14',117),(966,125,'2023-11-06','2023-11-18',118),(726,55,'2023-05-21','2023-05-30',121),(1018,178,'2023-08-20','2023-08-30',122),(323,42,'2023-02-15','2023-02-24',123),(533,74,'2023-05-03','2023-05-07',124),(778,178,'2023-11-30','2023-12-15',125),(566,71,'2023-09-19','2023-09-21',127),(504,117,'2023-01-31','2023-02-13',128),(127,82,'2023-05-20','2023-05-28',129),(662,129,'2023-09-29','2023-10-09',131),(195,153,'2023-03-31','2023-04-07',134),(139,159,'2023-08-10','2023-08-25',135),(626,130,'2023-04-24','2023-05-07',136),(446,106,'2023-06-29','2023-06-30',137),(942,10,'2023-04-21','2023-04-26',138),(1026,77,'2023-01-02','2023-01-03',140),(760,99,'2023-09-11','2023-09-20',141),(778,90,'2023-05-12','2023-05-13',142),(85,35,'2023-01-21','2023-02-05',143),(358,28,'2023-08-26','2023-09-04',145),(457,55,'2023-05-21','2023-06-05',146),(749,133,'2023-04-18','2023-05-02',147),(964,40,'2023-04-13','2023-04-17',148);
/*!40000 ALTER TABLE `rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rolling income`
--

DROP TABLE IF EXISTS `rolling income`;
/*!50001 DROP VIEW IF EXISTS `rolling income`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rolling income` AS SELECT 
 1 AS `date`,
 1 AS `income`,
 1 AS `rolling_sum`,
 1 AS `cumulative_sum`,
 1 AS `rolling_avg`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total income`
--

DROP TABLE IF EXISTS `total income`;
/*!50001 DROP VIEW IF EXISTS `total income`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total income` AS SELECT 
 1 AS `plan_id`,
 1 AS `income`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'library'
--
/*!50003 DROP FUNCTION IF EXISTS `title_case` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `title_case`( str VARCHAR(128) ) RETURNS varchar(128) CHARSET utf8mb4
BEGIN
DECLARE c CHAR(1);
DECLARE s VARCHAR(128);
DECLARE i INT DEFAULT 1;
DECLARE bool INT DEFAULT 1;
DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';
SET s = LCASE( str );
WHILE i <= LENGTH( str ) DO   
    BEGIN
SET c = SUBSTRING( s, i, 1 );
IF LOCATE( c, punct ) > 0 THEN
SET bool = 1;
ELSEIF bool=1 THEN
BEGIN
IF c >= 'a' AND c <= 'z' THEN
BEGIN
SET s = CONCAT(LEFT(s,i-1),UCASE(c),SUBSTRING(s,i+1));
SET bool = 0;
END;
ELSEIF c >= '0' AND c <= '9' THEN
SET bool = 0;
END IF;
END;
END IF;
SET i = i+1;
END;
END WHILE;
RETURN s;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `validate_isbn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validate_isbn`(isbn varchar(13)) RETURNS varchar(5) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
RETURN (select case when length(isbn)=10 and 
11 - mod (substring(isbn,1,1) * 10 +
substring(isbn,2,1) * 9 +
substring(isbn,3,1) * 8 +
substring(isbn,4,1) * 7 +
substring(isbn,5,1) * 6 +
substring(isbn,6,1) * 5 +
substring(isbn,7,1) * 4 +
substring(isbn,8,1) * 3 +
substring(isbn,9,1) * 2, 11) = case when substring(isbn,10,1)='X' then 10 else substring(isbn,10,1) end
then 'true'
when length(isbn)=13 and 
10 - mod (substring(isbn,1,1) * 1 +
substring(isbn,2,1) * 3 +
substring(isbn,3,1) * 1 +
substring(isbn,4,1) * 3 +
substring(isbn,5,1) * 1 +
substring(isbn,6,1) * 3 +
substring(isbn,7,1) * 1 +
substring(isbn,8,1) * 3 +
substring(isbn,9,1) * 1 +
substring(isbn,10,1) * 3 +
substring(isbn,11,1) * 1 +
substring(isbn,12,1) * 3, 10) = substring(isbn,13,1)
then 'true'
else 'false'
end);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `allot_books` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `allot_books`()
BEGIN

declare loc int ;
declare var int ;
declare book int ;

  loop1: LOOP
  	set var = (select count(*) from books where location_id is null);
  	if var = 0 then 
  		leave loop1 ;
  	end if ;
    set loc = (select min(id) from locations where book_id is null) ;
    set book = (select max(id) from books where location_id is null) ;
    update books set location_id=loc where id=book ;
    update locations set book_id=book where id=loc ;
 END LOOP loop1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_book_copy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_book_copy`(copies int)
BEGIN

declare count int ;
set count = 1 ;

drop table if exists data_staging_tmp ;
create temporary table data_staging_tmp 
  select * from data_staging 
  where author is not null and author <> '' and
          dob is not null and cast(dob as char) <> '' and
          book is not null and book <> '' and
          isbn is not null and isbn <> '' and
          pages is not null and pages <> '' and
          year is not null and year <> '' and
          publisher is not null and publisher <> '' and
          genre is not null and genre <> '' and
          language is not null and language <> '' ;

  loop1: LOOP
    if count = copies then 
      leave loop1 ;
    end if ;
    
    insert into data_staging (author, dob, book, isbn, pages, year, publisher, genre, language) 
    select author, dob, book, isbn, pages, year, publisher, genre, language from data_staging_tmp ;
    set count = count + 1 ;

 END LOOP loop1;

 drop table if exists data_staging_tmp ;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `run_checks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `run_checks`()
BEGIN
  with test as (
  select 1 as test_id, 'null author name' as `check`, 'authors' as `table`, id from authors where name is null or name=''

  union all

  select 2, 'null book name', 'books', id from books where name is null or name=''

  union all

  select 3, 'null genre name', 'genres', id from genres where name is null or name=''
   
  union all

  select 4, 'null publisher name', 'publishers', id from publishers where name is null or name='' 

  union all

  select 5, 'duplicate record', 'authors',id from authors group by id having count(distinct name) > 1

  union all

  select 6, 'duplicate record', 'genres',id from genres group by id having count(distinct name) > 1

  union all

  select 7, 'duplicate record', 'publishers',id from publishers group by id having count(distinct name) > 1

  union all

  select 8, 'duplicate record', 'languages',id from languages group by id having count(distinct name) > 1

  union all

  select 9, 'duplicate record', 'locations', id from locations group by id having count(book_id) > 1

  union all

  select 10, 'duplicate record', 'rentals', customer_id from rentals group by customer_id, rental_date, return_date having count(*) > 1

  union all

  select 11, 'duplicate record', 'rentals', book_id from rentals group by rental_date, return_date, book_id having count(distinct customer_id) > 1

  union all

  select 12, 'invalid isbn', 'donations', id from donations where lower(validate_isbn(isbn))='false'

  union all

  select 13, 'invalid isbn', 'books', id from books where lower(validate_isbn(isbn))='false'

  union all

  select 14, 'duplicate rentals', 'rentals', r.id from rentals r join rentals r2 on r.id <> r2.id and r.book_id=r2.book_id and r2.rental_date = r.rental_date and r2.return_date = r.return_date

  union all

  select 15, 'impossible rental', 'rental', r.id from rentals r join rentals r2 on r.id <> r2.id and r.book_id=r2.book_id and r2.rental_date between r.rental_date and r.return_date

  union all

  select 16, 'rental before membership', 'rentals', r.id from rentals r join membership_history m on r.customer_id=m.customer_id where r.rental_date < m.start_date 

  union all

  select 17, 'return after membership end', 'rentals', r.id from rentals r join membership_history m on r.customer_id=m.customer_id where r.return_date > m.end_date 
  )
  select * from test ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `library`
--

USE `library`;

--
-- Final view structure for view `author ages`
--

/*!50001 DROP VIEW IF EXISTS `author ages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `author ages` AS select `authors`.`name` AS `name`,date_format(`authors`.`dob`,'%D %M, %Y') AS `dob`,date_format(from_days((to_days(now()) - to_days(`authors`.`dob`))),'%Y years %c months %e days') AS `age` from `authors` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `authors born today`
--

/*!50001 DROP VIEW IF EXISTS `authors born today`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `authors born today` AS select `authors`.`name` AS `name`,`authors`.`dob` AS `dob` from `authors` where (`authors`.`dob` = cast(now() as date)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `books currently available`
--

/*!50001 DROP VIEW IF EXISTS `books currently available`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `books currently available` AS select `b`.`name` AS `name`,count(distinct `b`.`id`) AS `copies available` from `books` `b` where exists(select 1 from `books currently borrowed` `r` where (`r`.`id` = `b`.`id`)) is false group by `b`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `books currently borrowed`
--

/*!50001 DROP VIEW IF EXISTS `books currently borrowed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `books currently borrowed` AS select `b`.`id` AS `id`,`b`.`name` AS `name`,`r`.`return_date` AS `return_date` from (`books` `b` join `rentals` `r` on((`b`.`id` = `r`.`book_id`))) where (`r`.`return_date` > cast(now() as date)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `categorized books`
--

/*!50001 DROP VIEW IF EXISTS `categorized books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `categorized books` AS select `a`.`name` AS `author`,`b`.`name` AS `book`,`g`.`name` AS `genre`,`b`.`year` AS `year` from ((`authors` `a` join `books` `b` on((`a`.`id` = `b`.`author_id`))) join `genres` `g` on((`g`.`id` = `b`.`genre_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number of books by a genre`
--

/*!50001 DROP VIEW IF EXISTS `number of books by a genre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number of books by a genre` AS select `g`.`name` AS `name`,count(distinct `b`.`isbn`) AS `number` from (`genres` `g` join `books` `b` on((`g`.`id` = `b`.`genre_id`))) group by `g`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number of books by a publisher`
--

/*!50001 DROP VIEW IF EXISTS `number of books by a publisher`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number of books by a publisher` AS select `p`.`name` AS `name`,count(distinct `b`.`isbn`) AS `number` from (`publishers` `p` join `books` `b` on((`p`.`id` = `b`.`publisher_id`))) group by `p`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number of books by an author`
--

/*!50001 DROP VIEW IF EXISTS `number of books by an author`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number of books by an author` AS select `a`.`name` AS `name`,count(distinct `b`.`isbn`) AS `number` from (`authors` `a` join `books` `b` on((`a`.`id` = `b`.`author_id`))) group by `a`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number of books by year`
--

/*!50001 DROP VIEW IF EXISTS `number of books by year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number of books by year` AS select `books`.`year` AS `year`,count(distinct `books`.`isbn`) AS `number` from `books` group by `books`.`year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number of copies of books`
--

/*!50001 DROP VIEW IF EXISTS `number of copies of books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number of copies of books` AS select `books`.`name` AS `name`,count(`books`.`isbn`) AS `copies` from `books` group by `books`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rolling income`
--

/*!50001 DROP VIEW IF EXISTS `rolling income`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rolling income` AS with `temp` as (select `i`.`date` AS `date`,`p`.`cost` AS `income` from (`income` `i` join `plans` `p` on((`i`.`plan_id` = `p`.`id`)))) select `temp`.`date` AS `date`,`temp`.`income` AS `income`,sum(`temp`.`income`) OVER (ORDER BY `temp`.`date` ROWS BETWEEN 89 PRECEDING AND CURRENT ROW)  AS `rolling_sum`,sum(`temp`.`income`) OVER (ORDER BY `temp`.`date` )  AS `cumulative_sum`,avg(`temp`.`income`) OVER (ORDER BY `temp`.`date` ROWS BETWEEN 89 PRECEDING AND CURRENT ROW)  AS `rolling_avg` from `temp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total income`
--

/*!50001 DROP VIEW IF EXISTS `total income`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total income` AS select `i`.`plan_id` AS `plan_id`,sum(`p`.`cost`) AS `income` from (`income` `i` join `plans` `p` on((`i`.`plan_id` = `p`.`id`))) group by `i`.`plan_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-30  1:08:59
