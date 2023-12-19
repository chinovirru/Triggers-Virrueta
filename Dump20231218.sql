-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_pdl_prod
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `courts`
--

DROP TABLE IF EXISTS `courts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courts` (
  `court_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`court_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courts`
--

LOCK TABLES `courts` WRITE;
/*!40000 ALTER TABLE `courts` DISABLE KEYS */;
INSERT INTO `courts` VALUES (1,'Cancha 1','Cancha 1 Sintético'),(2,'Cancha 2','Cancha 2 Sintético');
/*!40000 ALTER TABLE `courts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `table` varchar(25) NOT NULL,
  `action` varchar(20) NOT NULL,
  `values` varchar(100) NOT NULL,
  `date` timestamp NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,0) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `user_id` int NOT NULL,
  `sale_id` int NOT NULL,
  PRIMARY KEY (`payment_id`,`sale_id`),
  KEY `fk_payments_sales1_idx` (`sale_id`),
  CONSTRAINT `fk_payments_sales1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,2800,'Pago total','T',0,1),(2,600,'Pago de Protector','T',0,2),(3,3800,'Pago saldo','E',0,2),(4,2800,'Pago total','T',0,3),(5,7000,'Pago Total','E',0,4),(6,8400,'Pago Total','E',0,5),(7,4600,'Pago Total','E',0,6);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `stock_current` int NOT NULL DEFAULT '0',
  `stock_minimal` int NOT NULL DEFAULT '0',
  `productcategory_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`productcategory_id`),
  KEY `fk_products_products_category1_idx` (`productcategory_id`),
  CONSTRAINT `fk_products_products_category1` FOREIGN KEY (`productcategory_id`) REFERENCES `products_category` (`productcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Coca Cola 1.5 Lt.','Coca cola 1.5 lt. Botella Descartable',500,20,5,1),(2,'Imperial 1 Lt.','Cerveza Imperial x 1lt',1500,12,6,1),(3,'Heiniken 1 Lt.','Cerveza Heiniken x 1lt',1800,10,6,1),(4,'Acquarius Pera x 1Lt.','Jugo Acquarius descartable x 1 Lt.',1000,4,2,1),(5,'Papas Snack x 200g','Papas fritas Snack x 200g',1100,4,1,2),(6,'Mani Salado x 90gr','Mani Salado Snack por 90gr.',550,4,1,2),(7,'Galletas Sonrisa','Galletas Sonrisa',550,4,1,3),(8,'Galletas Maná x 110gr.','Galletas Maná...',450,3,1,3),(9,'Chupetin c/chicle','Chupetin c/chicle Arcor',150,20,5,3),(10,'Galleta Opera x 80gr.','Galleta Opera x 80gr.',450,2,1,3),(11,'Pelotas Peen','Pelotas Peen 3',3000,18,6,4),(12,'Cubre grip','Cubre grip varios colores',1000,11,6,4),(13,'Protector superior','Protector de goma',600,6,4,4),(14,'Powerade x 500ml Rojo','Jugo energetico powerade',800,4,1,1),(15,'Fernet Branca 750ml','Fernet Branca mediano',4000,10,6,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_category` (
  `productcategory_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`productcategory_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_category`
--

LOCK TABLES `products_category` WRITE;
/*!40000 ALTER TABLE `products_category` DISABLE KEYS */;
INSERT INTO `products_category` VALUES (1,'Bebidas','Jugos, Gaseosas con y sin alcohol, etc.','A'),(2,'Snacks','Papas Fritas, Manis, etc.','A'),(3,'Golosinas','Galletas, Chupetines, etc.','A'),(4,'Accesorios','Pelotas, Cubre Grips, etc.','A');
/*!40000 ALTER TABLE `products_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `date_initial` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `reservation_date` timestamp NULL DEFAULT NULL,
  `court_id` int NOT NULL,
  PRIMARY KEY (`reservation_id`,`court_id`),
  KEY `fk_reservations_courts1_idx` (`court_id`),
  CONSTRAINT `fk_reservations_courts1` FOREIGN KEY (`court_id`) REFERENCES `courts` (`court_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'2023-11-01 17:00:00','2023-11-01 19:00:00','2023-10-15 20:00:00',1),(2,'2023-11-01 17:00:00','2023-11-01 19:00:00','2023-10-16 19:00:00',2),(3,'2023-11-01 19:00:00','2023-11-01 20:00:00','2023-10-17 21:00:00',1),(4,'2023-11-01 19:00:00','2023-11-01 21:00:00','2023-10-17 22:00:00',2),(5,'2023-11-01 20:00:00','2023-11-02 00:00:00','2023-10-18 17:00:00',1),(6,'2023-11-01 21:00:00','2023-11-01 23:00:00','2023-10-18 18:00:00',2),(7,'2023-11-02 00:00:00','2023-11-02 02:00:00','2023-10-19 23:00:00',1),(8,'2023-11-01 23:00:00','2023-11-02 01:00:00','2023-10-19 22:00:00',2),(9,'2023-11-02 02:00:00','2023-11-02 03:00:00','2023-10-20 21:00:00',1),(10,'2023-11-02 01:00:00','2023-11-02 03:00:00','2023-10-20 23:00:00',2);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `description` varchar(150) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','Administrador del sitio','A'),(2,'Supervisor','Supervisor de cajeros','A'),(3,'Cashier','Cajero','A');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_users` (
  `user_id` int NOT NULL,
  `rol_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`rol_id`),
  KEY `fk_roles_users_roles_idx` (`rol_id`),
  CONSTRAINT `fk_roles_users_roles` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`),
  CONSTRAINT `fk_roles_users_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(2,2),(5,2),(3,3),(4,3);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `totals` decimal(10,0) NOT NULL DEFAULT '0',
  `date` timestamp NULL DEFAULT NULL,
  `reservation_id` int NOT NULL,
  `shift_id` int NOT NULL,
  PRIMARY KEY (`sale_id`,`reservation_id`,`shift_id`),
  KEY `fk_sales_reservations1_idx` (`reservation_id`),
  KEY `fk_sales_shifts1_idx` (`shift_id`),
  CONSTRAINT `fk_sales_reservations1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`),
  CONSTRAINT `fk_sales_shifts1` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,2800,'2023-11-01 20:00:00',1,1),(2,4400,'2023-11-01 20:10:00',1,1),(3,2800,'2023-11-01 20:11:00',1,1),(4,7000,'2023-11-01 20:25:00',2,1),(5,8400,'2023-11-01 21:30:00',3,1),(6,4600,'2023-11-01 22:10:00',4,1);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_detail`
--

DROP TABLE IF EXISTS `sales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_detail` (
  `saledetail_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `sale_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`saledetail_id`,`sale_id`,`product_id`),
  KEY `fk_sales_detail_sales1_idx` (`sale_id`),
  KEY `fk_sales_detail_products1_idx` (`product_id`),
  CONSTRAINT `fk_sales_detail_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_sales_detail_sales1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`sale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_detail`
--

LOCK TABLES `sales_detail` WRITE;
/*!40000 ALTER TABLE `sales_detail` DISABLE KEYS */;
INSERT INTO `sales_detail` VALUES (1,1,1800,1,3),(2,1,1000,1,4),(3,1,600,2,13),(4,1,800,2,14),(5,3,1000,2,12),(6,2,2000,3,12),(7,1,800,3,14),(8,2,6000,4,11),(9,1,1000,4,4),(10,1,600,5,13),(11,1,800,5,14),(12,4,6000,5,2),(13,2,1000,5,1),(14,1,4000,6,15),(15,1,600,6,13);
/*!40000 ALTER TABLE `sales_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_status`
--

DROP TABLE IF EXISTS `shift_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_status` (
  `shiftstatus_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`shiftstatus_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_status`
--

LOCK TABLES `shift_status` WRITE;
/*!40000 ALTER TABLE `shift_status` DISABLE KEYS */;
INSERT INTO `shift_status` VALUES (1,'Abierta'),(2,'Cerrada'),(3,'Verificada');
/*!40000 ALTER TABLE `shift_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shifts` (
  `shift_id` int NOT NULL AUTO_INCREMENT,
  `date_initial` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `initial_amount` decimal(10,0) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `user_id` int NOT NULL,
  `shiftstatus_id` int NOT NULL,
  PRIMARY KEY (`shift_id`,`user_id`,`shiftstatus_id`),
  KEY `fk_shifts_users1_idx` (`user_id`),
  KEY `fk_shifts_shift_status1_idx` (`shiftstatus_id`),
  CONSTRAINT `fk_shifts_shift_status1` FOREIGN KEY (`shiftstatus_id`) REFERENCES `shift_status` (`shiftstatus_id`),
  CONSTRAINT `fk_shifts_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,'2023-11-01 15:00:00','2023-11-02 05:00:00',300,45000,3,3),(2,'2023-11-02 15:00:00','2023-11-03 05:00:00',300,48000,3,3),(3,'2023-11-03 15:00:00','2023-11-04 05:00:00',300,41000,3,2),(4,'2023-11-04 15:00:00','2023-11-05 05:00:00',300,46000,3,2),(5,'2023-11-05 15:00:00','2023-11-06 05:00:00',300,40000,3,1);
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `pass_UNIQUE` (`pass`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ricardo','Ricardo123','ricardo@mail.com'),(2,'antonio','Antonio123','antonio@mail.com'),(3,'enzo','Enzo123','enzo@mail.com'),(4,'gaston','Gaston123','gaston@mail.com'),(5,'sebastian','Sebastian123','sebastian@mail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vproducts`
--

DROP TABLE IF EXISTS `vproducts`;
/*!50001 DROP VIEW IF EXISTS `vproducts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vproducts` AS SELECT 
 1 AS `product_id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `price`,
 1 AS `stock_current`,
 1 AS `stock_minimal`,
 1 AS `productcategory_id`,
 1 AS `category_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vreservations`
--

DROP TABLE IF EXISTS `vreservations`;
/*!50001 DROP VIEW IF EXISTS `vreservations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vreservations` AS SELECT 
 1 AS `reservation_id`,
 1 AS `date_initial`,
 1 AS `date_end`,
 1 AS `reservation_date`,
 1 AS `court_id`,
 1 AS `court_name`,
 1 AS `court_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vshifts`
--

DROP TABLE IF EXISTS `vshifts`;
/*!50001 DROP VIEW IF EXISTS `vshifts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vshifts` AS SELECT 
 1 AS `shift_id`,
 1 AS `date_initial`,
 1 AS `date_end`,
 1 AS `initial_amount`,
 1 AS `total_amount`,
 1 AS `user_id`,
 1 AS `shiftstatus_id`,
 1 AS `shiftstatus_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vusers`
--

DROP TABLE IF EXISTS `vusers`;
/*!50001 DROP VIEW IF EXISTS `vusers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vusers` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `pass`,
 1 AS `email`,
 1 AS `rol_id`,
 1 AS `rol_name`,
 1 AS `rol_description`,
 1 AS `rol_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vproducts`
--

/*!50001 DROP VIEW IF EXISTS `vproducts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vproducts` AS select `products`.`product_id` AS `product_id`,`products`.`name` AS `name`,`products`.`description` AS `description`,`products`.`price` AS `price`,`products`.`stock_current` AS `stock_current`,`products`.`stock_minimal` AS `stock_minimal`,`products`.`productcategory_id` AS `productcategory_id`,`products_category`.`name` AS `category_name` from (`products` join `products_category` on((`products`.`product_id` = `products_category`.`productcategory_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vreservations`
--

/*!50001 DROP VIEW IF EXISTS `vreservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vreservations` AS select `reservations`.`reservation_id` AS `reservation_id`,`reservations`.`date_initial` AS `date_initial`,`reservations`.`date_end` AS `date_end`,`reservations`.`reservation_date` AS `reservation_date`,`reservations`.`court_id` AS `court_id`,`courts`.`name` AS `court_name`,`courts`.`description` AS `court_description` from (`reservations` join `courts` on((`reservations`.`court_id` = `courts`.`court_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vshifts`
--

/*!50001 DROP VIEW IF EXISTS `vshifts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vshifts` AS select `shifts`.`shift_id` AS `shift_id`,`shifts`.`date_initial` AS `date_initial`,`shifts`.`date_end` AS `date_end`,`shifts`.`initial_amount` AS `initial_amount`,`shifts`.`total_amount` AS `total_amount`,`shifts`.`user_id` AS `user_id`,`shifts`.`shiftstatus_id` AS `shiftstatus_id`,`shift_status`.`name` AS `shiftstatus_name` from (`shifts` join `shift_status` on((`shifts`.`shift_id` = `shift_status`.`shiftstatus_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vusers`
--

/*!50001 DROP VIEW IF EXISTS `vusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vusers` AS select `users`.`user_id` AS `user_id`,`users`.`username` AS `username`,`users`.`pass` AS `pass`,`users`.`email` AS `email`,`roles`.`rol_id` AS `rol_id`,`roles`.`name` AS `rol_name`,`roles`.`description` AS `rol_description`,`roles`.`status` AS `rol_status` from ((`roles_users` join `users` on((`roles_users`.`user_id` = `users`.`user_id`))) join `roles` on((`roles_users`.`rol_id` = `roles`.`rol_id`))) */;
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

-- Dump completed on 2023-12-18 21:45:24
