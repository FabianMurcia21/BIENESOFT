CREATE DATABASE  IF NOT EXISTS `bienesoft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bienesoft`;
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: bienesoft
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `apprentice`
--

DROP TABLE IF EXISTS `apprentice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apprentice` (
  `Apprentice_Id` int NOT NULL,
  `Apprentice_Name` varchar(100) NOT NULL,
  `Apprentice_Phone` varchar(15) NOT NULL,
  `Apprentice_Type` varchar(50) NOT NULL,
  `Attendant_Id` int NOT NULL,
  `File_Id` int NOT NULL,
  `Apprentice_Email` varchar(45) NOT NULL,
  `Apprentice_Address` varchar(45) NOT NULL,
  `Apprentice_Sex` varchar(15) NOT NULL,
  `Locality_Id` int NOT NULL,
  `Document_Type` varchar(5) NOT NULL,
  `Disability` tinyint NOT NULL DEFAULT '0',
  `Stackor_Permissions` int DEFAULT '1',
  PRIMARY KEY (`Apprentice_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apprentice`
--

LOCK TABLES `apprentice` WRITE;
/*!40000 ALTER TABLE `apprentice` DISABLE KEYS */;
INSERT INTO `apprentice` VALUES (1,'Pablo','3001573906','externo',0,0,'','','',0,'',0,NULL),(12,'Joao','3123990469','Externo',0,0,'','','',0,'',0,NULL),(20,'Pedro','3001573906','Externo',0,0,'','','',0,'',0,NULL),(21,'string','string','string',0,0,'user@example.com','string','string',0,'strin',0,0),(22,'string','string','string',0,0,'user@example.com','string','string',0,'strin',0,0),(44,'argeol','guio','admi',1,2,'user@example.com','s','string',5,'strin',8,1),(11111,'adolfo','3001573906','externo',12,11,'sanchez.adolfo15@gmail.com','vereda el saman','masculino',12,'CC',0,1),(1111111,'cristian tique','300012223','interno',12,14,'takataka@gmail.com','vereda el saman','masculino',15,'CC',0,1),(1105611421,'argeol','3245896760','aDMI',1,2,'user@example.com','RURAL 13','MASCULINO',2,'CC',1,3),(1105670038,'Junior','3001573906','externo',12,12,'s@gmail.com','vr saman','masculino',12,'CC',0,1);
/*!40000 ALTER TABLE `apprentice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `Area_Id` int NOT NULL,
  `Area_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Area_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'argeol'),(12,'Pecuaria');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendant`
--

DROP TABLE IF EXISTS `attendant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendant` (
  `Attendant_Id` int NOT NULL AUTO_INCREMENT,
  `Attendant_Name` varchar(45) NOT NULL,
  `Attendant_Surname` varchar(45) NOT NULL,
  `Attendant_Phone` bigint NOT NULL,
  `Attendant_Address` varchar(45) NOT NULL,
  `Attendant_Email` varchar(45) NOT NULL,
  `Attendant_Age` datetime NOT NULL,
  PRIMARY KEY (`Attendant_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendant`
--

LOCK TABLES `attendant` WRITE;
/*!40000 ALTER TABLE `attendant` DISABLE KEYS */;
INSERT INTO `attendant` VALUES (8,'rosalba ','pineda',3202171414,'ruta 22','guiopinedaargeol7@gmail.com','2025-01-14 00:00:00'),(44,'argeol','guio',3245896760,'1','guiopinedaargeol7@gmail.com','2025-01-14 00:00:00'),(999,'rosalba ','guio',3245896760,'221','guiopinedaargeol7@gmail.com','2025-01-14 00:00:00');
/*!40000 ALTER TABLE `attendant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorizationresponsible`
--

DROP TABLE IF EXISTS `authorizationresponsible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorizationresponsible` (
  `AuthorizationResponsible_Id` int NOT NULL,
  `Permission_Id` int NOT NULL,
  `Responsible_Id` int NOT NULL,
  PRIMARY KEY (`AuthorizationResponsible_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorizationresponsible`
--

LOCK TABLES `authorizationresponsible` WRITE;
/*!40000 ALTER TABLE `authorizationresponsible` DISABLE KEYS */;
INSERT INTO `authorizationresponsible` VALUES (10,20,40);
/*!40000 ALTER TABLE `authorizationresponsible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Department_Id` int NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  PRIMARY KEY (`Department_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'argeol'),(5,'meta'),(7,'meta'),(34,'rola'),(44,'roto'),(65,'rtoto');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `File_Id` int NOT NULL AUTO_INCREMENT,
  `Apprentice_count` int NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  `Program_Id` int NOT NULL,
  PRIMARY KEY (`File_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2900024 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (2,32,'2024-12-12 00:00:00','2026-09-22 00:00:00',0),(22,22,'2024-11-19 00:00:00','2024-11-19 00:00:00',3),(324,11,'2024-05-12 00:00:00','2025-02-20 00:00:00',1),(1212,34,'2024-10-04 00:00:00','2025-10-04 00:00:00',0),(1222,44,'2024-11-04 00:00:00','2024-11-30 00:00:00',33),(2824123,22,'2024-11-05 00:00:00','2026-01-21 00:00:00',12),(2824231,33,'2024-06-03 00:00:00','2025-05-24 00:00:00',12),(2900022,21,'2024-11-04 00:00:00','2025-02-28 00:00:00',3),(2900023,1000,'2024-11-22 00:00:00','2024-11-22 00:00:00',0);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locality` (
  `Locality_Id` int NOT NULL AUTO_INCREMENT,
  `Nom_Locality` varchar(50) NOT NULL,
  `Tip_Locality` varchar(30) NOT NULL,
  `Id_Department` int NOT NULL,
  PRIMARY KEY (`Locality_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locality`
--

LOCK TABLES `locality` WRITE;
/*!40000 ALTER TABLE `locality` DISABLE KEYS */;
INSERT INTO `locality` VALUES (7,'Tapias','Rural',2),(8,'verdura ','urbana ',1),(9,'verdu','urbana ',1),(10,'chicoral','rurl',2),(11,'chicoral','rurl',2),(12,'chicoral','rurl',2),(13,'espinal','rurar',3),(14,'pepe','ciudad',2);
/*!40000 ALTER TABLE `locality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionfs`
--

DROP TABLE IF EXISTS `permissionfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissionfs` (
  `PermissionFS_Id` int NOT NULL,
  `Apprentice_Id` int NOT NULL,
  PRIMARY KEY (`PermissionFS_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionfs`
--

LOCK TABLES `permissionfs` WRITE;
/*!40000 ALTER TABLE `permissionfs` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissionfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissiongn`
--

DROP TABLE IF EXISTS `permissiongn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissiongn` (
  `Permission_Id` int NOT NULL,
  `Apprentice_Id` int NOT NULL,
  `Departure_Date` datetime NOT NULL,
  `Entry_Date` datetime NOT NULL,
  `Application_Date` datetime NOT NULL,
  `Autorization` tinyint NOT NULL,
  `Adress` varchar(35) NOT NULL,
  `Destinatation` varchar(35) NOT NULL,
  `Motive` varchar(45) NOT NULL,
  `Observation` varchar(50) NOT NULL,
  `PermissionRespon_Id` int NOT NULL,
  PRIMARY KEY (`Permission_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissiongn`
--

LOCK TABLES `permissiongn` WRITE;
/*!40000 ALTER TABLE `permissiongn` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissiongn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `Program_Id` int NOT NULL,
  `Program_Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Program_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (3,'99999'),(4,'Guio'),(5,'Programa 5'),(6,'Programa 6'),(7,'Programa 7'),(8,'Programa 999'),(9,'Programa 9'),(10,'Programa 10'),(11,'Programa 11'),(12,'Programa 12'),(13,'Programa 13'),(14,'Programa 14'),(15,'Programa 15'),(16,'Programa 16'),(17,'Programa 17'),(18,'Programa 18'),(19,'Programa 19'),(20,'Programa 20'),(21,'Programa 21'),(22,'Programa 22'),(23,'Programa 23'),(24,'Programa 24'),(25,'Programa 25'),(26,'Programa 26'),(27,'Programa 27'),(28,'Programa 28'),(29,'Programa 29'),(30,'Programa 30'),(66,'Guio'),(88,'pepe'),(32821,'ADSO'),(2924123,'ARGEOL');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reason`
--

DROP TABLE IF EXISTS `reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reason` (
  `Reason_Id` int NOT NULL,
  `Tip_Reason` varchar(50) NOT NULL,
  PRIMARY KEY (`Reason_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reason`
--

LOCK TABLES `reason` WRITE;
/*!40000 ALTER TABLE `reason` DISABLE KEYS */;
/*!40000 ALTER TABLE `reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsible`
--

DROP TABLE IF EXISTS `responsible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsible` (
  `Responsible_Id` int NOT NULL,
  `Nom_Responsible` varchar(50) NOT NULL,
  `Ape_Responsible` varchar(50) NOT NULL,
  `Tel_Responsible` bigint NOT NULL,
  `Tip_Responsible` varchar(50) NOT NULL,
  PRIMARY KEY (`Responsible_Id`),
  UNIQUE KEY `idResponsible_UNIQUE` (`Responsible_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsible`
--

LOCK TABLES `responsible` WRITE;
/*!40000 ALTER TABLE `responsible` DISABLE KEYS */;
INSERT INTO `responsible` VALUES (6,'argeol','guio',3245896760,'edmi'),(22,'daniel','perdomo',0,'coordinador');
/*!40000 ALTER TABLE `responsible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_Id` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `HashedPassword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Salt` varchar(255) DEFAULT NULL,
  `SessionCount` int NOT NULL DEFAULT '0',
  `TokJwt` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Blockade` bit(1) NOT NULL DEFAULT b'0',
  `UserType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Asset` bit(1) NOT NULL DEFAULT b'1',
  `ResetToken` varchar(255) DEFAULT '',
  `ResetTokenExpiration` datetime DEFAULT NULL,
  PRIMARY KEY (`User_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'guiopinedaargeol79@gmail.com','$2a$11$c719WkjggnNhfNFDZD2cmODDNvEJwz3hZ22xTi5S14.uBLyejdjPy','$2a$11$TtAIwR8fO6o3kSp3C42Sqe',0,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VyIjoiZ3Vpb3BpbmVkYWFyZ2VvbDc5QGdtYWlsLmNvbSIsIm5iZiI6MTczODY0NTYwMSwiZXhwIjoxNzM4NjQ5MjAxLCJpYXQiOjE3Mzg2NDU2MDF9.3L1U2PiWy-K3VHEVo6SxdNeBmOymCjnztiDSyD_o8Eo',_binary '\0','admi',_binary '\0','','2025-02-04 05:06:40'),(21,'pineda@gmail.com','$2a$11$WR3ZhugFoZgTin9uoM/w7eaPZy7NRz78kDj6KFFXdAYEDTgwruaoS','$2a$11$mc02/BL.eFfh9gvVhS8h.e',0,'',_binary '\0','Usuario',_binary '\0',NULL,NULL),(22,'pineda99@gmail.com','$2a$11$trpozioukKu5BSJ8EsYt6.iXgmxuE2.PGUYNbpwepTUVvQ73Op1OW','$2a$11$4IY.PCGxpketm7synnQfQu',0,'',_binary '\0','Usuario',_binary '\0',NULL,NULL),(23,'pineda99@gmail.com','$2a$11$d53VKL/TNOeVki68zJR3vesO5mO8J2KEmgBeKHl7ttnaTvNIzlIpC','$2a$11$SylT2cO2TpT9pQfmxwlenO',0,'',_binary '\0','Usuario',_binary '\0',NULL,NULL),(24,'pineda00@gmail.com','$2a$11$XSGAXlkzHjVAu9modAjG.epvkHSLiUCwv/0MlsLUlfM0471rgFeZC','$2a$11$nroiz/yoFTvdYcWe.YGx0e',0,'',_binary '\0','Responsable',_binary '\0',NULL,NULL),(25,'pineda00@gmail.com','$2a$11$BBmG1n/FhCmJPRlbrxAYve9xxLjbjyPgTQe7GxxaINdOTGuMyEFwq','$2a$11$gYjI3NJNN2Yv3ca8vacA.e',0,'',_binary '\0','Responsable',_binary '\0',NULL,NULL),(26,'pineda00@gmail.com','$2a$11$0K1uKfiXdmBFEL1ZCamK6OcmYFU6GUVYpVwKmJyH8Pi6Wizm.PXTS','$2a$11$.3ECy5h0dbT9b/XrHU0kdu',0,'',_binary '\0','Responsable',_binary '\0',NULL,NULL),(27,'pined00a@gmail.com','$2a$11$JgdvlaZrtakx9/zipcNbkeL3wUsPG.JRe0c6CHLXkvk59QyCCEIUG','$2a$11$RLFfMFYIym4RyFkjxUqEf.',0,'',_binary '\0','Administrador',_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-11 21:55:21
