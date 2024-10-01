-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: insurancemanagementdb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `claims`
--

DROP TABLE IF EXISTS `claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claims` (
  `claim_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `claim_date` date NOT NULL,
  `description` text,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Pending','Approved','Denied') DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`claim_id`),
  KEY `policy_id` (`policy_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`policy_id`),
  CONSTRAINT `claims_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claims`
--

LOCK TABLES `claims` WRITE;
/*!40000 ALTER TABLE `claims` DISABLE KEYS */;
INSERT INTO `claims` VALUES (1,101,'2023-06-01','Hospitalization expenses',1000.00,'Pending',1),(2,103,'2023-02-15','Death claim',200000.00,'Approved',3);
/*!40000 ALTER TABLE `claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','Doe','+1234567890','1990-05-15','123 Main St, Anytown, USA'),(2,'Jane','Smith','+1987654321','1985-08-20','456 Elm St, Anycity, USA'),(3,'Michael','Johnson','+1122334455','1978-11-10','789 Oak St, Anyville, USA');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_insurance`
--

DROP TABLE IF EXISTS `health_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_insurance` (
  `policy_id` int NOT NULL,
  `policy_holder_name` varchar(100) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `policy_type_id` int DEFAULT NULL,
  PRIMARY KEY (`policy_id`),
  KEY `customer_id` (`customer_id`),
  KEY `policy_type_id` (`policy_type_id`),
  CONSTRAINT `health_insurance_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`policy_id`),
  CONSTRAINT `health_insurance_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `health_insurance_ibfk_3` FOREIGN KEY (`policy_type_id`) REFERENCES `policy_type` (`policy_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_insurance`
--

LOCK TABLES `health_insurance` WRITE;
/*!40000 ALTER TABLE `health_insurance` DISABLE KEYS */;
INSERT INTO `health_insurance` VALUES (101,'John Doe',35,'Male',1,1);
/*!40000 ALTER TABLE `health_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `life_insurance`
--

DROP TABLE IF EXISTS `life_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `life_insurance` (
  `policy_id` int NOT NULL,
  `insured_name` varchar(50) DEFAULT NULL,
  `beneficiary_name` varchar(100) DEFAULT NULL,
  `sum_assured` decimal(10,2) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `policy_type_id` int DEFAULT NULL,
  PRIMARY KEY (`policy_id`),
  KEY `customer_id` (`customer_id`),
  KEY `policy_type_id` (`policy_type_id`),
  CONSTRAINT `life_insurance_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`policy_id`),
  CONSTRAINT `life_insurance_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `life_insurance_ibfk_3` FOREIGN KEY (`policy_type_id`) REFERENCES `policy_type` (`policy_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `life_insurance`
--

LOCK TABLES `life_insurance` WRITE;
/*!40000 ALTER TABLE `life_insurance` DISABLE KEYS */;
INSERT INTO `life_insurance` VALUES (103,'Michael Johnson','Emily Johnson',250000.00,3,3);
/*!40000 ALTER TABLE `life_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `policy_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `policy_type_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `coverage_amt` decimal(10,2) DEFAULT NULL,
  `status` enum('Active','Inactive','Expired') DEFAULT 'Active',
  PRIMARY KEY (`policy_id`),
  KEY `customer_id` (`customer_id`),
  KEY `policy_type_id` (`policy_type_id`),
  CONSTRAINT `policy_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `policy_ibfk_2` FOREIGN KEY (`policy_type_id`) REFERENCES `policy_type` (`policy_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (101,1,1,'2023-01-01','2024-01-01',5000.00,'Active'),(102,2,2,'2022-06-15','2023-06-15',10000.00,'Inactive'),(103,3,3,'2022-12-01','2023-12-01',200000.00,'Expired');
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_type`
--

DROP TABLE IF EXISTS `policy_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_type` (
  `policy_type_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`policy_type_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_type`
--

LOCK TABLES `policy_type` WRITE;
/*!40000 ALTER TABLE `policy_type` DISABLE KEYS */;
INSERT INTO `policy_type` VALUES (1,'Health Insurance','Coverage for medical expenses and healthcare services'),(2,'Vehicle Insurance','Coverage for vehicle damage, theft, and liability'),(3,'Life Insurance','Financial protection for the insured?s beneficiaries in case of death');
/*!40000 ALTER TABLE `policy_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premium_payment`
--

DROP TABLE IF EXISTS `premium_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premium_payment` (
  `payment_id` int NOT NULL,
  `policy_id` int NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reference_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `policy_id` (`policy_id`),
  CONSTRAINT `premium_payment_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premium_payment`
--

LOCK TABLES `premium_payment` WRITE;
/*!40000 ALTER TABLE `premium_payment` DISABLE KEYS */;
INSERT INTO `premium_payment` VALUES (1,101,'2023-02-01',200.00,'PAY123'),(2,102,'2022-07-01',300.00,'PAY456'),(3,103,'2022-12-01',1000.00,'PAY789');
/*!40000 ALTER TABLE `premium_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_insurance`
--

DROP TABLE IF EXISTS `vehicle_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_insurance` (
  `policy_id` int NOT NULL,
  `vehicle_make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `vehicle_no` varchar(17) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `policy_type_id` int DEFAULT NULL,
  PRIMARY KEY (`policy_id`),
  UNIQUE KEY `vehicle_no` (`vehicle_no`),
  KEY `customer_id` (`customer_id`),
  KEY `policy_type_id` (`policy_type_id`),
  CONSTRAINT `vehicle_insurance_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`policy_id`),
  CONSTRAINT `vehicle_insurance_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `vehicle_insurance_ibfk_3` FOREIGN KEY (`policy_type_id`) REFERENCES `policy_type` (`policy_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_insurance`
--

LOCK TABLES `vehicle_insurance` WRITE;
/*!40000 ALTER TABLE `vehicle_insurance` DISABLE KEYS */;
INSERT INTO `vehicle_insurance` VALUES (102,'Toyota','Camry','ABC123',2,2),(103,'Dio','Honda','kl143885',3,3);
/*!40000 ALTER TABLE `vehicle_insurance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-01 12:11:35
