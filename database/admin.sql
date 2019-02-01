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
INSERT INTO `admin_menu` VALUES (1,0,1,'首页','fa-bar-chart','/',NULL,NULL,'2019-01-23 11:29:07'),(2,0,7,'系统管理','fa-tasks',NULL,NULL,NULL,'2019-01-31 09:14:40'),(3,2,8,'管理员','fa-users','auth/users',NULL,NULL,'2019-01-31 09:14:40'),(4,2,9,'角色','fa-user','auth/roles',NULL,NULL,'2019-01-31 09:14:40'),(5,2,10,'权限','fa-ban','auth/permissions',NULL,NULL,'2019-01-31 09:14:40'),(6,2,11,'菜单','fa-bars','auth/menu',NULL,NULL,'2019-01-31 09:14:40'),(7,2,12,'操作日志','fa-history','auth/logs',NULL,NULL,'2019-01-31 09:14:40'),(8,0,6,'用户管理','fa-users','users',NULL,'2019-01-23 11:43:56','2019-01-31 09:14:40'),(9,0,3,'商品列表','fa-cubes','products',NULL,'2019-01-23 12:40:09','2019-01-31 09:14:40'),(10,0,5,'订单管理','fa-rmb','orders',NULL,'2019-01-27 08:52:32','2019-01-31 09:14:40'),(11,0,4,'优惠券管理','fa-tags','coupon_codes',NULL,'2019-01-28 12:46:40','2019-01-31 09:14:40'),(12,0,2,'类目管理','fa-bars','categories',NULL,'2019-01-31 09:14:29','2019-01-31 09:14:40'),(13,9,0,'普通商品','fa-cubes','products',NULL,'2019-02-01 02:16:52','2019-02-01 02:16:52'),(14,9,0,'众筹商品','fa-flag-checkered','crowdfunding_products',NULL,'2019-02-01 02:17:27','2019-02-01 02:17:27');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_operation_log`
--

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` VALUES (1,1,'admin/auth/roles','GET','192.168.10.1','[]','2019-01-31 03:53:41','2019-01-31 03:53:41'),(2,1,'admin/orders','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 03:53:47','2019-01-31 03:53:47'),(3,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-01-31 09:13:56','2019-01-31 09:13:56'),(4,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"0\",\"title\":\"\\u7c7b\\u76ee\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"2KRVrmB8P9GuKNgZXO4cjtlraKNpcXPJvVeTOMSe\"}','2019-01-31 09:14:29','2019-01-31 09:14:29'),(5,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-01-31 09:14:30','2019-01-31 09:14:30'),(6,1,'admin/auth/menu','POST','192.168.10.1','{\"_token\":\"2KRVrmB8P9GuKNgZXO4cjtlraKNpcXPJvVeTOMSe\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":12},{\\\"id\\\":9},{\\\"id\\\":11},{\\\"id\\\":10},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-01-31 09:14:39','2019-01-31 09:14:39'),(7,1,'admin/auth/menu','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 09:14:40','2019-01-31 09:14:40'),(8,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-01-31 09:14:52','2019-01-31 09:14:52'),(9,1,'admin/categories','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 09:14:54','2019-01-31 09:14:54'),(10,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 10:01:00','2019-01-31 10:01:00'),(11,1,'admin/products/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 10:01:04','2019-01-31 10:01:04'),(12,1,'admin/products/create','GET','192.168.10.1','[]','2019-01-31 10:01:32','2019-01-31 10:01:32'),(13,1,'admin/products/create','GET','192.168.10.1','[]','2019-01-31 10:02:55','2019-01-31 10:02:55'),(14,1,'admin/api/categories','GET','192.168.10.1','{\"is_directory\":\"0\",\"q\":\"er ji\"}','2019-01-31 10:03:03','2019-01-31 10:03:03'),(15,1,'admin/api/categories','GET','192.168.10.1','{\"is_directory\":\"0\",\"q\":\"er\"}','2019-01-31 10:03:04','2019-01-31 10:03:04'),(16,1,'admin/api/categories','GET','192.168.10.1','{\"is_directory\":\"0\",\"q\":\"\\u8033\\u673a\"}','2019-01-31 10:03:04','2019-01-31 10:03:04'),(17,1,'admin/products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 10:06:21','2019-01-31 10:06:21'),(18,1,'admin/products/1/edit','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-01-31 10:06:41','2019-01-31 10:06:41'),(19,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-02-01 02:15:58','2019-02-01 02:15:58'),(20,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"9\",\"title\":\"\\u666e\\u901a\\u5546\\u54c1\",\"icon\":\"fa-cubes\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"teS34ZvB4fNNnNIsoouJLAdtY0BP87QwjFC3aGA5\"}','2019-02-01 02:16:52','2019-02-01 02:16:52'),(21,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-02-01 02:16:54','2019-02-01 02:16:54'),(22,1,'admin/auth/menu','POST','192.168.10.1','{\"parent_id\":\"9\",\"title\":\"\\u4f17\\u7b79\\u5546\\u54c1\",\"icon\":\"fa-flag-checkered\",\"uri\":\"crowdfunding_products\",\"roles\":[null],\"permission\":null,\"_token\":\"teS34ZvB4fNNnNIsoouJLAdtY0BP87QwjFC3aGA5\"}','2019-02-01 02:17:27','2019-02-01 02:17:27'),(23,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-02-01 02:17:28','2019-02-01 02:17:28'),(24,1,'admin/auth/menu','GET','192.168.10.1','[]','2019-02-01 02:17:33','2019-02-01 02:17:33'),(25,1,'admin/crowdfunding_products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-02-01 02:17:49','2019-02-01 02:17:49'),(26,1,'admin/crowdfunding_products/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-02-01 02:17:55','2019-02-01 02:17:55'),(27,1,'admin/crowdfunding_products','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-02-01 02:18:10','2019-02-01 02:18:10'),(28,1,'admin/crowdfunding_products','GET','192.168.10.1','[]','2019-02-01 02:18:55','2019-02-01 02:18:55'),(29,1,'admin/crowdfunding_products/create','GET','192.168.10.1','{\"_pjax\":\"#pjax-container\"}','2019-02-01 02:18:58','2019-02-01 02:18:58');
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
-- Dumping data for table `crowdfunding_products`
--

LOCK TABLES `crowdfunding_products` WRITE;
/*!40000 ALTER TABLE `crowdfunding_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `crowdfunding_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_04_173148_create_admin_tables',1),(4,'2019_01_23_070213_create_user_addresses_table',1),(5,'2019_01_23_120133_create_products_table',1),(6,'2019_01_23_120318_create_product_skus_table',1),(7,'2019_01_24_074714_create_user_favorite_products_table',1),(8,'2019_01_24_084748_create_cart_items_table',1),(9,'2019_01_24_101723_create_orders_table',1),(10,'2019_01_24_103626_create_order_items_table',1),(11,'2019_01_28_121816_create_coupon_codes_table',1),(12,'2019_01_28_123236_add_coupon_code_id_to_orders_table',1),(13,'2019_01_31_041150_create_categories_table',2),(14,'2019_01_31_051659_add_category_id_to_products_table',2),(15,'2019_02_01_013400_create_crowdfunding_products_table',3),(16,'2019_02_01_014610_add_type_to_products_table',3);
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
INSERT INTO `product_skus` VALUES (1,'eveniet','Dolores laudantium nihil ratione fuga possimus.',9362.00,97894,1,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(2,'aliquid','At labore numquam sed.',403.00,64471,1,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(3,'a','Qui quia eum enim non suscipit.',4085.00,85362,1,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(4,'perferendis','Reprehenderit voluptatem quia inventore possimus maiores ad.',376.00,26878,2,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(5,'in','Fugit voluptas exercitationem mollitia eaque totam mollitia.',7586.00,41955,2,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(6,'deserunt','Repellat sint neque doloremque provident sed accusantium quasi.',820.00,64465,3,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(7,'sequi','Sit praesentium consequatur aut molestiae sint rerum ut.',8865.00,23342,3,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(8,'officiis','Provident porro voluptas voluptatibus voluptatem.',4308.00,53995,3,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(9,'consequuntur','Expedita id minus error molestiae praesentium sapiente.',4426.00,37631,4,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(10,'occaecati','Qui voluptas consequatur possimus ut et laboriosam aut.',2071.00,90627,4,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(11,'earum','Beatae voluptatibus accusamus repellendus.',1394.00,53338,5,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(12,'illo','Consectetur voluptatibus sed quia voluptatem sunt.',2058.00,54311,5,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(13,'laborum','Impedit facere sint quis est qui et neque.',2114.00,97334,5,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(14,'repellendus','Voluptatum ut est veniam et itaque dolor.',465.00,42752,6,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(15,'quisquam','Earum saepe quae non alias.',5139.00,43259,6,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(16,'pariatur','Dolores nostrum molestiae quasi velit consequatur.',2065.00,65798,6,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(17,'accusantium','Dolorum non animi modi labore enim.',309.00,96498,7,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(18,'nostrum','Tempore necessitatibus placeat in et veniam aliquam sit.',6680.00,95365,7,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(19,'in','Deserunt ipsam repellat ipsum eos odit est.',3859.00,80048,7,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(20,'assumenda','Omnis illo amet asperiores vitae ut cum atque atque.',4860.00,87986,7,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(21,'eos','Eius suscipit provident delectus voluptate necessitatibus.',4854.00,42396,8,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(22,'magni','Aut ratione aut est animi expedita.',9760.00,87800,8,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(23,'atque','Quaerat exercitationem enim est temporibus esse voluptas blanditiis eos.',502.00,506,8,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(24,'blanditiis','Excepturi corporis reiciendis et.',1431.00,84094,9,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(25,'quod','Animi quidem aut fugiat quaerat culpa.',4473.00,5526,9,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(26,'eum','Non vitae ullam dicta itaque.',7651.00,8409,10,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(27,'nihil','Sit consequatur nostrum aut corrupti hic.',3929.00,26724,10,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(28,'recusandae','Suscipit omnis necessitatibus at aut non tenetur.',384.00,18777,10,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(29,'perferendis','Nisi eos neque sit repellat quas optio et.',497.00,64317,11,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(30,'sed','Laboriosam ipsa ut consectetur aut quibusdam est et.',4572.00,32629,11,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(31,'dolor','Doloribus quo sit rerum dicta dolorum.',5600.00,87944,11,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(32,'delectus','Unde dolorem dolores doloribus ex quis omnis modi odit.',9873.00,8295,11,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(33,'voluptatibus','Maxime vero est aspernatur sunt.',170.00,77734,12,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(34,'soluta','Ipsa facere est adipisci autem autem totam.',9115.00,70283,12,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(35,'aspernatur','Vero aut earum eius.',8143.00,30192,13,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(36,'qui','Libero voluptatum ea iure consequatur.',1213.00,71469,13,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(37,'vero','Similique doloremque libero labore vitae maiores sed eos architecto.',9454.00,28942,13,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(38,'qui','Dolorum rem repudiandae ullam recusandae.',347.00,49577,13,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(39,'voluptas','Eius doloribus maxime dicta ipsa vel aliquam neque excepturi.',1612.00,21274,14,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(40,'quas','Minima quas velit perferendis id sunt voluptatum.',3148.00,36960,14,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(41,'veniam','Consequatur in facilis tempora minima ut earum.',8113.00,90572,14,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(42,'recusandae','Quos veniam tempore sint et error.',6385.00,53097,15,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(43,'necessitatibus','Ad laudantium recusandae sapiente non.',4897.00,28121,15,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(44,'beatae','Et ipsum modi molestiae quod excepturi quae corrupti.',5088.00,74481,15,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(45,'est','Distinctio et omnis accusamus rerum exercitationem.',7182.00,94241,16,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(46,'hic','Iste consequatur impedit sed et alias.',5766.00,68213,16,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(47,'quia','Nobis voluptatibus sequi voluptas fugiat ad atque dolores.',2633.00,34420,17,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(48,'cupiditate','Atque ab itaque sed accusamus corporis sint sint.',8420.00,22449,17,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(49,'minus','Quaerat nihil non voluptatem sit ipsam eos.',9947.00,18939,17,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(50,'molestiae','Quas magnam perferendis ut aut quis voluptatem.',1889.00,19025,17,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(51,'optio','Autem soluta enim provident inventore nulla tempora.',829.00,85046,18,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(52,'ut','Perspiciatis fugit tempora molestias quaerat sapiente vel occaecati.',8008.00,10532,18,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(53,'et','Ex provident eaque ipsum eos quibusdam.',6775.00,68860,18,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(54,'vitae','Sed ipsa rerum qui perspiciatis voluptatem iusto.',7258.00,53791,18,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(55,'tenetur','Laboriosam explicabo quibusdam porro incidunt laborum et nihil ut.',9022.00,70732,19,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(56,'nemo','Incidunt qui totam molestias sunt amet eos inventore.',9151.00,25195,19,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(57,'est','Velit et non a omnis ipsam sint.',3574.00,22587,19,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(58,'sint','Quia et minus dolore dolorem qui fugit.',1400.00,86384,19,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(59,'fugiat','Explicabo sint sit a voluptatem quo sed.',2426.00,57573,20,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(60,'ut','Aut nemo animi magni inventore nihil.',8839.00,33911,20,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(61,'aliquam','Quia veritatis quas sit nulla id vitae.',9943.00,11067,20,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(62,'perferendis','Fugit deserunt voluptatem et doloribus facere qui.',9080.00,37604,20,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(63,'distinctio','Rerum numquam nesciunt eos optio aut aut et dolor.',4393.00,28817,21,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(64,'enim','Beatae expedita id rem error sint hic.',3586.00,81125,21,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(65,'aut','Consequatur ipsum vel deleniti omnis et consequatur est.',2661.00,59242,22,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(66,'sed','Dolores et tempora modi repellat voluptas harum officia recusandae.',4503.00,18491,22,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(67,'error','Aliquid adipisci sed tempora laborum aut non rem tenetur.',8377.00,27583,22,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(68,'delectus','Unde quos illo laudantium impedit quo autem libero.',4557.00,27341,23,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(69,'aut','Sed praesentium eligendi suscipit nisi quidem est rerum vel.',6553.00,37668,23,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(70,'facere','Magnam occaecati autem qui dolor quia.',7024.00,70850,24,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(71,'sequi','Earum error et iure natus sunt architecto voluptas ut.',3272.00,41044,24,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(72,'qui','Id ea est alias quae sequi voluptas nihil.',3223.00,27320,24,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(73,'modi','Doloribus sunt nihil sint mollitia esse.',3653.00,58359,25,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(74,'enim','Perspiciatis non dolores ut quis.',3892.00,52796,25,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(75,'non','Aut qui aut beatae iste aut omnis.',9699.00,38822,26,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(76,'accusamus','Et voluptate repellendus accusamus itaque.',3955.00,31280,26,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(77,'commodi','Commodi consequatur laudantium et laudantium sit dolore ratione.',7131.00,14197,26,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(78,'molestiae','Enim sit laboriosam labore quos nulla.',8744.00,39987,27,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(79,'architecto','Error ratione maxime labore ut ducimus non expedita nulla.',1400.00,53457,27,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(80,'eligendi','In enim ab sapiente nesciunt molestiae.',1918.00,28020,28,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(81,'omnis','Ut saepe ipsum et maiores.',3054.00,85820,28,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(82,'sapiente','Aut mollitia totam tempora minima totam maiores.',1051.00,48323,28,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(83,'culpa','Facilis ut porro qui facere numquam.',398.00,51055,28,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(84,'voluptas','Tenetur corporis aperiam iusto minima officia deleniti.',2044.00,45748,29,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(85,'officiis','Magni similique qui quis.',9590.00,65229,29,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(86,'incidunt','Error repudiandae veniam quo ratione.',5452.00,4388,29,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(87,'rerum','Tempora perspiciatis dolorem quis voluptatem odit dolores iusto minus.',522.00,51755,30,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(88,'omnis','Et velit quae soluta sit.',1098.00,32731,30,'2019-01-31 10:06:10','2019-01-31 10:06:10');
/*!40000 ALTER TABLE `product_skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'normal',20,'et','Error voluptatum consequuntur sequi error a sunt.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,5.00,0,0,403.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(2,'normal',14,'nostrum','Ut molestias vitae sit.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',1,4.00,0,0,376.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(3,'normal',20,'quia','Sit quae assumenda et.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',1,1.00,0,0,820.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(4,'normal',4,'sed','Recusandae enim magni ab aperiam maiores nesciunt iusto quos.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,5.00,0,0,2071.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(5,'normal',22,'voluptates','Quis officia totam doloribus consectetur dolor esse.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg',1,2.00,0,0,1394.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(6,'normal',9,'nulla','Necessitatibus dolor quo recusandae neque sed quia dolore.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',1,3.00,0,0,465.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(7,'normal',21,'ducimus','Minima sapiente sit ut eius numquam qui.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,1.00,0,0,309.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(8,'normal',6,'repellat','Eos ipsa labore culpa unde consequatur odit.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,1.00,0,0,502.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(9,'normal',3,'atque','Aperiam consequatur et in nihil.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg',1,3.00,0,0,1431.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(10,'normal',25,'rerum','Ullam repellat recusandae provident hic.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,1.00,0,0,384.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(11,'normal',23,'sapiente','Consequatur et consectetur qui.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,1.00,0,0,497.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(12,'normal',14,'minima','Iste eos minus perspiciatis itaque.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg',1,1.00,0,0,170.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(13,'normal',14,'distinctio','Quisquam magni error eveniet quia et quas assumenda occaecati.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,2.00,0,0,347.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(14,'normal',22,'soluta','Voluptas voluptatem et voluptatum non perferendis quos.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,1.00,0,0,1612.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(15,'normal',3,'ea','Corporis a dolorem unde dicta magni saepe iusto.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,3.00,0,0,4897.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(16,'normal',8,'eveniet','Aperiam eum praesentium vitae optio sit libero ut.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,0.00,0,0,5766.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(17,'normal',14,'accusamus','A perspiciatis modi maiores eaque qui quo magni.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,4.00,0,0,1889.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(18,'normal',23,'sapiente','In ut odit ut dolor.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,3.00,0,0,829.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(19,'normal',3,'a','Velit aut optio rerum vel.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,3.00,0,0,1400.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(20,'normal',15,'eos','Totam et quam perferendis.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg',1,1.00,0,0,2426.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(21,'normal',9,'et','Est itaque sequi pariatur et tempora eius.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,1.00,0,0,3586.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(22,'normal',4,'voluptatum','Voluptas odit voluptatum consequatur exercitationem repudiandae deserunt officia totam.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,5.00,0,0,2661.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(23,'normal',14,'eius','Adipisci in aut illum quos tempora saepe.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,3.00,0,0,4557.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(24,'normal',23,'aspernatur','Cupiditate rerum iste aut ullam expedita.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg',1,0.00,0,0,3223.00,'2019-01-31 10:06:09','2019-01-31 10:06:10'),(25,'normal',27,'eum','Doloremque qui culpa facilis praesentium accusamus et est.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,1.00,0,0,3653.00,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(26,'normal',13,'deserunt','Enim in accusantium sed vel aliquid.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg',1,3.00,0,0,3955.00,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(27,'normal',21,'perspiciatis','Adipisci itaque ipsum et dolor et et consequatur.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,3.00,0,0,1400.00,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(28,'normal',22,'expedita','Molestiae aperiam ut quos maiores ut.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,4.00,0,0,398.00,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(29,'normal',14,'officiis','Et et et eligendi et quaerat eos architecto.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,1.00,0,0,2044.00,'2019-01-31 10:06:10','2019-01-31 10:06:10'),(30,'normal',18,'quasi','Qui ipsa et incidunt.','https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',1,3.00,0,0,522.00,'2019-01-31 10:06:10','2019-01-31 10:06:10');
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

-- Dump completed on 2019-02-01  2:21:10
