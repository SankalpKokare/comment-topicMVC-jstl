CREATE DATABASE  IF NOT EXISTS `blogdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blogdb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: blogdb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `cid` int unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(100) NOT NULL,
  `topicid` int unsigned NOT NULL,
  `uid` varchar(20) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `FK_comments_1` (`uid`),
  KEY `FK_comments_2` (`topicid`),
  CONSTRAINT `FK_comments_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `FK_comments_2` FOREIGN KEY (`topicid`) REFERENCES `topic` (`topicid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'platform independent language',1,'Neha'),(2,'secure language on internet',1,'Mohan'),(3,'Oracle product, freely available',2,'Priya'),(4,'used for mid sized application',2,'Rajesh'),(5,'latest version is HTML 5',3,'Priya'),(6,'MAny new features in HTML 5',3,'Neha');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `uid` varchar(20) CHARACTER SET latin1 NOT NULL,
  `password` varchar(45) CHARACTER SET latin1 NOT NULL,
  `fnanme` varchar(45) CHARACTER SET latin1 NOT NULL,
  `lname` varchar(45) CHARACTER SET latin1 NOT NULL,
  `email` varchar(45) CHARACTER SET latin1 NOT NULL,
  `contactno` varchar(45) CHARACTER SET latin1 NOT NULL,
  `cid` int NOT NULL AUTO_INCREMENT,
  `bdate` date DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES ('Priya','priya@123','Priya','Rane','abc@gmail.com','9276549286',4,'1998-09-12'),('Rajesh','rajesh@123','Rajesh','Sharma','abc@gmail.com','9876543210',5,'2000-08-05'),('Rohan','rohan@123','Rohan','Singh','rohan@gmail.com','9174639274',6,'1999-09-09'),('Varsha','varsha@123','Varsha','Kulkarni','varsha@gmail.com','9716492739',7,'1997-01-01'),('bakulj','bakul@123','Bakul','Joshi','bakul@gmail.com','676767677',8,'1996-02-03'),('vaibhav','vaibhav123','Vaibhav','Inamdar','vaibhav@know-it.com','878687687',9,'1996-08-04');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topic` (
  `topicid` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `desc` varchar(45) NOT NULL,
  `uid` varchar(20) NOT NULL,
  PRIMARY KEY (`topicid`),
  KEY `FK_topic_1` (`uid`),
  CONSTRAINT `FK_topic_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (1,'Core java','Basics of java language','Mohan'),(2,'Mysql','Creating and storing data in database server.','Priya'),(3,'Html','Creating web pages.','Rohan'),(4,'JavaScript','Creating pages using scripting language.','varsha'),(5,'JSP','Creating page using JSP.','Rajesh'),(6,'CSS','Manage page design using CSS.','Neha');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uid` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fnanme` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contactno` varchar(45) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aliya','aaa','rasmi','pande','aliya@gmail.com','87984645'),('Mohan','mohan@123','Mohan','Joshi','mohan@gmail.com','9287619736'),('Neha','neha@123','Neha','More','neha@yahoo.com','7862091743'),('Priya','priya@123','Priya','Rane','priya@gmail.com','9276549286'),('Rajesh','rajesh@123','Rajesh','Sharma','rajesh@gmail.com','9876543210'),('Rohan','rohan@123','Rohan','Singh','rohan@gmail.com','9174639274'),('Varsha','varsha@123','Varsha','Kulkarni','varsha@gmail.com','9716492739');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-08  6:50:45
