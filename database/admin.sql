-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: simple-shop
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `admin_menu`
--

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` VALUES (1,0,1,'首页','fa-bar-chart','/',NULL,NULL,'2019-01-23 11:29:07'),(2,0,7,'系统管理','fa-tasks',NULL,NULL,NULL,'2019-01-31 09:14:40'),(3,2,8,'管理员','fa-users','auth/users',NULL,NULL,'2019-01-31 09:14:40'),(4,2,9,'角色','fa-user','auth/roles',NULL,NULL,'2019-01-31 09:14:40'),(5,2,10,'权限','fa-ban','auth/permissions',NULL,NULL,'2019-01-31 09:14:40'),(6,2,11,'菜单','fa-bars','auth/menu',NULL,NULL,'2019-01-31 09:14:40'),(7,2,12,'操作日志','fa-history','auth/logs',NULL,NULL,'2019-01-31 09:14:40'),(8,0,6,'用户管理','fa-users','users',NULL,'2019-01-23 11:43:56','2019-01-31 09:14:40'),(9,0,3,'商品列表','fa-cubes','products',NULL,'2019-01-23 12:40:09','2019-01-31 09:14:40'),(10,0,5,'订单管理','fa-rmb','orders',NULL,'2019-01-27 08:52:32','2019-01-31 09:14:40'),(11,0,4,'优惠券管理','fa-tags','coupon_codes',NULL,'2019-01-28 12:46:40','2019-01-31 09:14:40'),(12,0,2,'类目管理','fa-bars','categories',NULL,'2019-01-31 09:14:29','2019-01-31 09:14:40');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin/auth/roles','GET','192.168.10.1','[]','2019-01-31 03:53:41','2019-01-31 03:53:41'),(2,1,'admin/orders','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 03:53:47','2019-01-31 03:53:47'),(3,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-01-31 09:13:56','2019-01-31 09:13:56'),(4,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u7c7b\\u76ee\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"2KRVrmB8P9GuKNgZXO4cjtlraKNpcXPJvVeTOMSe\"}','2019-01-31 09:14:29','2019-01-31 09:14:29'),(5,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-01-31 09:14:30','2019-01-31 09:14:30'),(6,1,'admin/auth/menu','POST','192.168.10.1','{\"_token\":\"2KRVrmB8P9GuKNgZXO4cjtlraKNpcXPJvVeTOMSe\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12},{\\\"id\\\":9},{\\\"id\\\":11},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-01-31 09:14:39','2019-01-31 09:14:39'),(7,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 09:14:40','2019-01-31 09:14:40'),(8,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-01-31 09:14:52','2019-01-31 09:14:52'),(9,1,'admin/categories','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 09:14:54','2019-01-31 09:14:54');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'All permission','*','','*',NULL,NULL),(2,'Dashboard','dashboard','GET','/',NULL,NULL),(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),(6,'用户管理','users','','/users*','2019-01-23 11:51:42','2019-01-23 11:51:42'),(7,'商品管理','products','','/products*','2019-01-29 03:22:49','2019-01-29 03:22:49'),(8,'优惠券管理','coupon_codes','','/coupon_codes*','2019-01-29 03:23:41','2019-01-29 03:23:41'),(9,'订单管理','orders','','/orders*','2019-01-29 03:24:08','2019-01-29 03:24:08');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_role_menu`
--

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_role_permissions`
--

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL),(2,3,NULL,NULL),(2,4,NULL,NULL),(2,6,NULL,NULL),(2,7,NULL,NULL),(2,8,NULL,NULL),(2,9,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_role_users`
--

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Administrator','administrator','2019-01-23 11:21:48','2019-01-23 11:21:48'),(2,'运营','operator','2019-01-23 11:52:40','2019-01-23 11:52:40');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_user_permissions`
--

LOCK TABLES `admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'admin','$2y$10$albnslqYmLJz1FsWGfC8HuxI6ymJhm7vab/YecJWwnxh5jjs.VcDS','Administrator',NULL,'GS69B4Du99nYMR1mEKWTt6Lw5cFAClEDSMikaxaklGO5TGjcQ7AlBKMrSBVi','2019-01-23 11:21:48','2019-01-23 11:21:48'),(2,'operator','$2y$10$pcOMKNJaX8JHUfhc5rW4ze5UwWWT.9Uxu7Zuo2K3IovsuZ6WFGW/6','运营',NULL,'1AYZjuxfMiqzVWGJ5BbEuknPmXe5oYonMlpN3GddSOIQcNP6nkqSyc9qFW34','2019-01-23 11:56:57','2019-01-23 11:56:57');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'手机配件',NULL,1,0,'-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(2,'手机壳',1,0,1,'-1-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(3,'贴膜',1,0,1,'-1-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(4,'存储卡',1,0,1,'-1-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(5,'数据线',1,0,1,'-1-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(6,'充电器',1,0,1,'-1-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(7,'耳机',1,1,1,'-1-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(8,'有线耳机',7,0,2,'-1-7-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(9,'蓝牙耳机',7,0,2,'-1-7-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(10,'电脑配件',NULL,1,0,'-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(11,'显示器',10,0,1,'-10-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(12,'显卡',10,0,1,'-10-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(13,'内存',10,0,1,'-10-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(14,'CPU',10,0,1,'-10-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(15,'主板',10,0,1,'-10-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(16,'硬盘',10,0,1,'-10-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(17,'电脑整机',NULL,1,0,'-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(18,'笔记本',17,0,1,'-17-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(19,'台式机',17,0,1,'-17-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(20,'平板电脑',17,0,1,'-17-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(21,'一体机',17,0,1,'-17-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(22,'服务器',17,0,1,'-17-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(23,'工作站',17,0,1,'-17-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(24,'手机通讯',NULL,1,0,'-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(25,'智能机',24,0,1,'-24-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(26,'老人机',24,0,1,'-24-','2019-01-31 05:38:47','2019-01-31 05:38:47'),(27,'对讲机',24,0,1,'-24-','2019-01-31 05:38:47','2019-01-31 05:38:47');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coupon_codes`
--

LOCK TABLES `coupon_codes` WRITE;
/*!40000 ALTER TABLE `coupon_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_01_23_070213_create_user_addresses_table',1),(5,'2019_01_23_120133_create_products_table',1),(6,'2019_01_23_120318_create_product_skus_table',1),(7,'2019_01_24_074714_create_user_favorite_products_table',1),(8,'2019_01_24_084748_create_cart_items_table',1),(9,'2019_01_24_101723_create_orders_table',1),(10,'2019_01_24_103626_create_order_items_table',1),(11,'2019_01_28_121816_create_coupon_codes_table',1),(12,'2019_01_28_123236_add_coupon_code_id_to_orders_table',1),(13,'2019_01_31_041150_create_categories_table',2),(14,'2019_01_31_051659_add_category_id_to_products_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_skus`
--

LOCK TABLES `product_skus` WRITE;
/*!40000 ALTER TABLE `product_skus` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
INSERT INTO `user_addresses` VALUES (1,1,'江苏省','南京市','浦口区','第95街道第567号',452100,'植芬','13046337840',NULL,'2019-01-31 03:56:51','2019-01-31 03:56:51');
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_favorite_products`
--

LOCK TABLES `user_favorite_products` WRITE;
/*!40000 ALTER TABLE `user_favorite_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorite_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Apple情绪化','40834106@qq.com','2019-01-31 03:55:45','$2y$10$.dyojrdy4mKo3KFAYbn40.pMsHb11Zvh7V/PkzBRJfxiwNdZ5Twmu',NULL,'2019-01-31 03:55:12','2019-01-31 03:55:45');
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

-- Dump completed on 2019-01-31  9:22:48
