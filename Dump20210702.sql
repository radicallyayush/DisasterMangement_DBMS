CREATE DATABASE  IF NOT EXISTS `disastermanagement_dbms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `disastermanagement_dbms`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: disastermanagement_dbms
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `d_life`
--

DROP TABLE IF EXISTS `d_life`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_life` (
  `Disaster_ID` int NOT NULL,
  `Region_ID` int NOT NULL,
  `Total_Injured` int NOT NULL,
  `Total_Killed` int NOT NULL,
  `Relief_ID` int NOT NULL,
  PRIMARY KEY (`Relief_ID`),
  KEY `Disaster_ID` (`Disaster_ID`),
  KEY `Region_ID` (`Region_ID`),
  CONSTRAINT `d_life_ibfk_1` FOREIGN KEY (`Disaster_ID`) REFERENCES `d_main` (`Disaster_ID`),
  CONSTRAINT `d_life_ibfk_2` FOREIGN KEY (`Region_ID`) REFERENCES `d_region` (`Region_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_life`
--

LOCK TABLES `d_life` WRITE;
/*!40000 ALTER TABLE `d_life` DISABLE KEYS */;
INSERT INTO `d_life` VALUES (1,110,5200,480,51),(3,120,100,5,52),(3,130,250,4,53),(4,140,13000,700,54),(2,150,35000,1000,55),(4,160,90000,890,56),(9,170,10,0,57),(5,180,1350,15,58),(10,190,39000,10,59),(9,200,3,0,60),(5,210,100,2,61),(6,220,1800,100,62),(6,230,5600,192,63),(7,240,100,0,64),(8,250,100000,2200,65),(7,260,75,0,66),(3,270,190,15,67),(2,280,190000,1650,68),(1,290,16900,780,69),(10,300,9900,95,70);
/*!40000 ALTER TABLE `d_life` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_main`
--

DROP TABLE IF EXISTS `d_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_main` (
  `Disaster_ID` int NOT NULL,
  `Disaster_Name` varchar(20) NOT NULL,
  `Total_affected_in_millions` decimal(6,2) DEFAULT NULL,
  `Disaster_type` varchar(20) DEFAULT NULL,
  `Total_costs_in_Billions` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`Disaster_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_main`
--

LOCK TABLES `d_main` WRITE;
/*!40000 ALTER TABLE `d_main` DISABLE KEYS */;
INSERT INTO `d_main` VALUES (1,'Earthquake',1.07,'Natural',4.02),(2,'Cyclone',31.27,'Natural',6.33),(3,'Extreme Weather',0.13,'Natural',0.56),(4,'Floods',30.25,'Natural',7.10),(5,'Landslide',0.17,'Man Made',0.21),(6,'Gas Leak',0.01,'Man Made',0.02),(7,'Wildfire',0.01,'Man Made',0.19),(8,'Drought',28.24,'Natural',11.20),(9,'Volcano',0.04,'Natural',11.20),(10,'Chemical leak',0.01,'Man Made',0.76);
/*!40000 ALTER TABLE `d_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_region`
--

DROP TABLE IF EXISTS `d_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_region` (
  `Region_ID` int NOT NULL,
  `Region_Name` varchar(20) NOT NULL,
  `Disaster_ID` int NOT NULL,
  `Region_percent` int NOT NULL,
  PRIMARY KEY (`Region_ID`),
  KEY `Disaster_ID` (`Disaster_ID`),
  CONSTRAINT `d_region_ibfk_1` FOREIGN KEY (`Disaster_ID`) REFERENCES `d_main` (`Disaster_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_region`
--

LOCK TABLES `d_region` WRITE;
/*!40000 ALTER TABLE `d_region` DISABLE KEYS */;
INSERT INTO `d_region` VALUES (110,'Delhi',1,5),(120,'Jammu',3,52),(130,'Kashmir',3,42),(140,'Taminadu',4,25),(150,'Kerala',2,11),(160,'Karnataka',4,12),(170,'Maharashtra',9,1),(180,'Tripura',5,10),(190,'AndhraPradesh',10,1),(200,'Andaman',9,1),(210,'Himachal Pradesh',5,2),(220,'Madhya Pradesh',6,1),(230,'Lakshwadeep',6,1),(240,'Assam',7,2),(250,'Rajasthan',8,10),(260,'Odisha',7,5),(270,'Nagaland',3,16),(280,'Goa',2,30),(290,'Manipur',1,9),(300,'Puducherry',10,1);
/*!40000 ALTER TABLE `d_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_relief`
--

DROP TABLE IF EXISTS `d_relief`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_relief` (
  `Relief_ID` int NOT NULL,
  `Relief_Leader` varchar(20) NOT NULL,
  `relief_cost_in_millions` decimal(6,2) DEFAULT NULL,
  `Lives_saved` int DEFAULT NULL,
  PRIMARY KEY (`Relief_Leader`),
  KEY `Relief_ID` (`Relief_ID`),
  CONSTRAINT `d_relief_ibfk_1` FOREIGN KEY (`Relief_ID`) REFERENCES `d_life` (`Relief_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_relief`
--

LOCK TABLES `d_relief` WRITE;
/*!40000 ALTER TABLE `d_relief` DISABLE KEYS */;
INSERT INTO `d_relief` VALUES (65,'Anishi B',9.70,190000),(66,'Anup z',0.15,1000),(57,'Bablu k',5.60,1900),(62,'Binita B',17.00,10000),(63,'Guru h',21.00,18000),(54,'Ishlok P',22.90,750000),(64,'Loka m',0.01,180),(56,'Munna D',29.00,182000),(61,'Neha S',2.10,1970),(68,'Poli D',30.00,180000),(53,'Prabjot J',0.04,2000),(58,'Pradeep m',3.40,7200),(69,'Pradyok I',32.00,200000),(59,'Pratima s',11.00,10000),(60,'Rahul K',0.01,180),(70,'Shanti p',2.20,12000),(51,'Srikant T',1.20,25000),(52,'Suchi M',0.05,1000),(55,'Varun h',10.90,170000),(67,'Zeeshan k',0.97,5000);
/*!40000 ALTER TABLE `d_relief` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `d_unaid`
--

DROP TABLE IF EXISTS `d_unaid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `d_unaid` (
  `Region_ID` int NOT NULL,
  `Disaster_ID` int NOT NULL,
  `unaid_funds_in_millions` decimal(6,2) DEFAULT NULL,
  `UNAID_ID` int NOT NULL,
  PRIMARY KEY (`UNAID_ID`),
  KEY `Region_ID` (`Region_ID`),
  KEY `Disaster_ID` (`Disaster_ID`),
  CONSTRAINT `d_unaid_ibfk_1` FOREIGN KEY (`Region_ID`) REFERENCES `d_region` (`Region_ID`),
  CONSTRAINT `d_unaid_ibfk_2` FOREIGN KEY (`Disaster_ID`) REFERENCES `d_main` (`Disaster_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `d_unaid`
--

LOCK TABLES `d_unaid` WRITE;
/*!40000 ALTER TABLE `d_unaid` DISABLE KEYS */;
INSERT INTO `d_unaid` VALUES (110,1,12.00,1001),(120,3,0.10,1002),(130,3,0.10,1003),(140,4,20.00,1004),(150,2,25.00,1005),(160,4,25.00,1006),(170,9,0.00,1007),(180,5,1.00,1008),(190,10,0.00,1009),(200,9,0.00,1010),(210,5,0.20,1011),(220,6,1.00,1012),(230,6,0.80,1013),(240,7,10.00,1014),(250,8,55.00,1015),(260,7,5.00,1016),(270,3,0.10,1017),(280,2,18.00,1018),(290,1,4.00,1019),(300,10,0.00,1020);
/*!40000 ALTER TABLE `d_unaid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-02 19:44:27
