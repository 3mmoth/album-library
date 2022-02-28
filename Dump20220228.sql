CREATE DATABASE  IF NOT EXISTS `album_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `album_schema`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: album_schema
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `release_year` year DEFAULT NULL,
  `genre_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_id_idx` (`genre_id`),
  CONSTRAINT `genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Ramones',1976,1),(2,'Graceland',1986,2),(3,'Sign O\' The Times',1987,2),(4,'Illmatic',1994,10),(5,'The Low End Theory',1991,10),(6,'OK Computer',1997,1),(7,'Let It Bleed',1969,1),(8,'The Rise and Fall of Ziggy Stardust and the Spiders From Mars',1972,2),(9,'Remain in Light',1980,2),(10,'Blonde on Blonde',1966,1),(11,'The Chronic',1992,10),(12,'Off the wall',1979,4),(13,'Rubber Soul',1965,1),(14,'Innervisions',1973,11),(15,'Back to Black',2006,11),(16,'Lemonade',2016,11),(17,'Kind of Blue',1959,11),(18,'Are you experienced',1967,1),(19,'Exile on Main Street',1972,1),(20,'Thriller',1982,2),(21,'Revolver',1966,1),(22,'White Album',1968,1),(23,'Purple Rain',1984,2),(24,'Abbey Road',1969,1),(25,'My Beautiful Dark Twisted Fantasy',2010,10);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `album_score`
--

DROP TABLE IF EXISTS `album_score`;
/*!50001 DROP VIEW IF EXISTS `album_score`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `album_score` AS SELECT 
 1 AS `title`,
 1 AS `id`,
 1 AS `score`,
 1 AS `user_id`,
 1 AS `comment`,
 1 AS `review_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `band`
--

DROP TABLE IF EXISTS `band`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `band`
--

LOCK TABLES `band` WRITE;
/*!40000 ALTER TABLE `band` DISABLE KEYS */;
INSERT INTO `band` VALUES (1,'Kanye West'),(2,'JAY-Z'),(3,'Rick Ross'),(4,'Nicki Minaj'),(5,'The Beatles'),(6,'Prince'),(7,'The Revolution'),(8,'Michael Jackson'),(9,'Jimi Hendrix'),(10,'Miles Davis'),(11,'Beyonce'),(12,'Amy Winehouse'),(13,'Stevie Wonder'),(14,'The Rolling Stones'),(15,'Dr. Dre'),(16,'Bob Dylan'),(17,'Talking Heads'),(18,'David Bowie'),(19,'Radiohead'),(20,'A Tribe Called Quest'),(21,'Nas'),(22,'Paul Simon'),(23,'Ramones');
/*!40000 ALTER TABLE `band` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compose`
--

DROP TABLE IF EXISTS `compose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compose` (
  `album_id` int NOT NULL,
  `band_id` int NOT NULL,
  PRIMARY KEY (`album_id`,`band_id`),
  KEY `album_id_idx` (`album_id`),
  KEY `band_id_idx` (`band_id`),
  CONSTRAINT `album_id1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `band_id` FOREIGN KEY (`band_id`) REFERENCES `band` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compose`
--

LOCK TABLES `compose` WRITE;
/*!40000 ALTER TABLE `compose` DISABLE KEYS */;
INSERT INTO `compose` VALUES (1,23),(2,22),(3,6),(4,21),(5,20),(6,19),(7,14),(8,18),(9,17),(10,16),(11,15),(12,8),(13,14),(14,13),(15,12),(16,11),(17,10),(18,9),(19,14),(20,8),(21,5),(22,5),(23,6),(23,7),(24,5),(25,1),(25,2),(25,3),(25,4);
/*!40000 ALTER TABLE `compose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Rock'),(2,'Pop'),(3,'Electro'),(4,'Disco'),(5,'Alternative'),(6,'Classic'),(7,'Metal'),(8,'House'),(9,'Reggae'),(10,'HipHop'),(11,'R n\' B');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL,
  `score` int NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `album_id` int DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `album_id` FOREIGN KEY (`review_id`) REFERENCES `album` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,4,'Great album',4,22),(2,4,'Not what I expected',4,23),(3,5,'Wow!',2,22),(4,1,'Really bad',3,21),(5,1,'???',2,1),(6,5,'Is this for real',2,5),(7,1,'Didn\'t like it',3,6),(8,3,'OK',3,4),(9,2,'Not the best I\'ve heard',1,3),(10,2,'Ok',1,10),(11,2,'Naah',4,12),(12,5,'For real?',2,13);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jossan','josefine@mail.com'),(2,'nisse','nils@mail.com'),(3,'pelle','per@mail.se'),(4,'omar','omar@mail.com'),(5,'linus','linus@mail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `album_score`
--

/*!50001 DROP VIEW IF EXISTS `album_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `album_score` AS select `album`.`title` AS `title`,`album`.`id` AS `id`,`review`.`score` AS `score`,`review`.`user_id` AS `user_id`,`review`.`comment` AS `comment`,`review`.`review_id` AS `review_id` from (`album` left join `review` on((`album`.`id` = `review`.`album_id`))) */;
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

-- Dump completed on 2022-02-28  1:18:47
