-- MySQL dump 10.15  Distrib 10.0.20-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: library_db
-- ------------------------------------------------------
-- Server version	10.0.20-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add author',7,'add_author'),(20,'Can change author',7,'change_author'),(21,'Can delete author',7,'delete_author'),(22,'Can add book',8,'add_book'),(23,'Can change book',8,'change_book'),(24,'Can delete book',8,'delete_book');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$rorm3YNhWl1b$AgveLpFxWG9ii5XvM+vO/2do+cjrdipc76ETpBHsEQU=','2017-03-15 18:19:38.168488',0,'librarian@library.org','Librarian','','librarian@library.org',0,1,'2017-03-15 18:19:20.996818');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'lib','author'),(8,'lib','book'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_author`
--

DROP TABLE IF EXISTS `lib_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_author`
--

LOCK TABLES `lib_author` WRITE;
/*!40000 ALTER TABLE `lib_author` DISABLE KEYS */;
INSERT INTO `lib_author` VALUES (6,'William P. Young'),(7,'Kerry Lonsdale'),(8,'William L. Myers Jr.'),(9,'Patricia Cornwell'),(10,'J.K. Rowling'),(11,'Newt Scamander'),(12,'Sarah A. Denzil'),(13,'Clark Weber'),(14,'Michael J. Knowles'),(15,'Laura McNeal'),(16,'D.W. Ulsterman'),(17,'Simone Sowood'),(18,'Garson O\'Toole'),(19,'George Orwell'),(20,'Pat Conroy'),(21,'Gill Paul'),(22,'Amy Harmon'),(23,'Rhys Bowen'),(24,'Anne D. LeClaire'),(25,'Mark Manson'),(26,'Joe Hart'),(27,'J.R.R. Tolkien'),(28,'Liane Moriarty'),(29,'Heather Hansen');
/*!40000 ALTER TABLE `lib_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_book`
--

DROP TABLE IF EXISTS `lib_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `publication_year` int(11) NOT NULL,
  `edition` int(11) NOT NULL,
  `copies` int(11) NOT NULL,
  `cover_image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_book`
--

LOCK TABLES `lib_book` WRITE;
/*!40000 ALTER TABLE `lib_book` DISABLE KEYS */;
INSERT INTO `lib_book` VALUES (4,'The Shack',2008,1,3,'/static/lib/img/001.jpg','Mackenzie Allen Phillips\'s youngest daughter, Missy, has been abducted during a family vacation, and evidence that she may have been brutally murdered is found in an abandoned shack deep in the Oregon wilderness. Four years later, in this midst of his great sadness, Mack receives a suspicious note, apparently from God, inviting him back to that shack for a weekend. Against his better judgment he arrives at the shack on wintry afternoon and walks back into his darkest nightmare. What he finds there will change his life forever.'),(5,'Everything We Keep: A Novel',2016,1,1,'/static/lib/img/002.jpg','A luminous debut with unexpected twists, Everything We Keep explores the devastation of loss, the euphoria of finding love again, and the pulse-racing repercussions of discovering the truth about the ones we hold dear and the lengths they will go to protect us.\r\n\r\nSous chef Aimee Tierney has the perfect recipe for the perfect life: marry her childhood sweetheart, raise a family, and buy out her parents’ restaurant. But when her fiancé, James Donato, vanishes in a boating accident, her well-baked future is swept out to sea. Instead of walking down the aisle on their wedding day, Aimee is at James’s funeral—a funeral that leaves her more unsettled than at peace.\r\n\r\nAs Aimee struggles to reconstruct her life, she delves deeper into James’s disappearance. What she uncovers is an ocean of secrets that make her question everything about the life they built together. And just below the surface is a truth that may set Aimee free…or shatter her forever.'),(6,'A Criminal Defense',2017,1,2,'/static/lib/img/003.jpg','When a young reporter is found dead and a prominent Philadelphia businessman is accused of her murder, Mick McFarland finds himself involved in the case of his life. The defendant, David Hanson, was Mick’s close friend in law school, and the victim, a TV news reporter, had reached out to Mick for legal help only hours before her death.\r\n\r\nMick’s played both sides of Philadelphia’s courtrooms. As a top-shelf defense attorney and former prosecutor, he knows all the tricks of the trade. And he’ll need every one of them to win.\r\n\r\nBut as the trial progresses, he’s disturbed by developments that confirm his deepest fears. This trial, one that already hits too close to home, may jeopardize his firm, his family—everything. Now Mick’s only way out is to mastermind the most brilliant defense he’s ever spun, one that will cross every legal and moral boundary.'),(7,'Ripper: The Secret Life of Walter Sickert',2017,1,6,'/static/lib/img/004.jpg','From New York Times bestselling author Patricia Cornwell comes Ripper: The Secret Life of Walter Sickert, a comprehensive and intriguing exposé of one of the world’s most chilling cases of serial murder—and the police force that failed to solve it.\r\n\r\nVain and charismatic Walter Sickert made a name for himself as a painter in Victorian London. But the ghoulish nature of his art—as well as extensive evidence—points to another name, one that’s left its bloody mark on the pages of history: Jack the Ripper. Cornwell has collected never-before-seen archival material—including a rare mortuary photo, personal correspondence and a will with a mysterious autopsy clause—and applied cutting-edge forensic science to open an old crime to new scrutiny.\r\n\r\nIncorporating material from Portrait of a Killer: Jack the Ripper—Case Closed, this new edition has been revised and expanded to include eight new chapters, detailed maps and hundreds of images that bring the sinister case to life.'),(9,'Silent Child',2017,1,1,'/static/lib/img/006.jpg','In the summer of 2006, Emma Price watched helplessly as her six-year-old son\'s red coat was fished out of the River Ouse. It was the tragic story of the year - a little boy, Aiden, wandered away from school during a terrible flood, fell into the river, and drowned.'),(10,'Harry Potter and the Sorcerer\'s Stone',2015,1,10,'/static/lib/img/007.jpg','Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry\'s eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!'),(11,'Slow Cooker Recipes Cookbook: Easy, Healthy and Delicious Recipes',2017,1,2,'/static/lib/img/008.jpg','My name is Clark Weber. I am a Chef in New York. These are the Slow Cooker recipes that I like most. I learned some of the recipes in this cookbook from different friends and relatives. I tried all of them myself and the results were fabulous.\r\n\r\nI would also like to mention that I included in this cookbook only those slow cooker recipes which are fairly easy to cook, even though I have to admit that most  of them will be ready in more than a couple of hours. This is because slow cooked meals need more cooking time compared to classic meals. But, the advantage comes from the fact that the slow cooking process is healthier and adds a great flavor to your meal.\r\n\r\nFurthermore, I selected in this cookbook only the healthiest Slow Cooker recipes that will provide you with a balanced diet. The number of calories rarely goes beyond 500/ serving (2000-2500 calories/ day intake is recommended for a sedentary adult that needs to maintain his/ her current weight), therefore these are some recipes that will help you maintain or even lose some weight. I also tried to collect here only the low carb recipes, because low carbs meals are great for dieting.\r\n\r\nAnother goal of mine was to include in this cookbook only the most popular slow cooker recipes.'),(12,'Reasons To Vote For Democrats: A Comprehensive Guide',2017,1,3,'/static/lib/img/009.jpg','The most exhaustively researched and coherently argued Democrat Party apologia to date, \"Reasons To Vote For Democrats: A Comprehensive Guide\" is a political treatise sure to stand the test of time. Lefty lawyers require that we state the book is mostly blank and contains precisely 1,235 words. A must-have addition to any political observer\'s coffee table. \"Thorough\" --Ben Shapiro, nationally syndicated columnist and New York Times bestselling author'),(13,'The Practice House',2017,1,5,'/static/lib/img/010.jpg','Nineteen-year-old Aldine McKenna is stuck at home with her sister and aunt in a Scottish village in 1929 when two Mormon missionaries ring the doorbell. Aldine’s sister converts and moves to America to marry, and Aldine follows, hoping to find the life she’s meant to lead and the person she’s meant to love.\r\n\r\nIn New York, Aldine answers an ad soliciting a teacher for a one-room schoolhouse in a place she can’t possibly imagine: drought-stricken Kansas. She arrives as farms on the Great Plains have begun to fail and schools are going bankrupt, unable to pay or house new teachers. With no money and too much pride to turn back, she lives uneasily with the family of Ansel Price—the charming, optimistic man who placed the ad—and his family responds to her with kind curiosity, suspicion, and, most dangerously, love. Just as she’s settling into her strange new life, a storm forces unspoken thoughts to the surface that will forever alter the course of their lives.\r\n\r\nLaura McNeal’s novel is a sweeping and timeless love story about leaving—and finding—home.'),(14,'Mac Walker\'s 40,000 Feet',2014,1,2,'/static/lib/img/011.jpg','Former Navy SEAL sniper and government gun for hire Mac Walker finds himself in an uneasy alliance with the beautiful and mysterious Vatican operative Stasia Wellington as they struggle to save the plane\'s passengers and defeat the terrorists and their plot to kill tens of thousands. Mac Walker\'s 40,000 Feet is the first volume in the highly popular Mac Walker military thrillers series that has earned an enthusiastic following of fans as they cheer the never give in and never give up nature that embodies the Mac Walker character.'),(15,'Arousal',2017,1,3,'/static/lib/img/012.jpg','A woman I\'ve never seen before just told her father I\'m her boyfriend.\r\nI walked into the restaurant to grab dinner between important meetings and there she was, red cheeked and fury in her electric blue eyes.\r\nI figure I\'ll help her out with whatever she has going on with her father, so I kiss her.\r\nIf she wants to be what\'s on my menu, that\'s fine by me.\r\nAs she melts into my arms, the taste of her lips and the fire in her eyes hits me in the gut.\r\nShe\'s mine.\r\nThis might be a game to her, but I\'m playing for real. And trust me when I say I never lose.\r\nI\'m going to use my vast wealth and power to get her exactly where I want her.\r\nWho knows, I might even tell her who I really am.'),(16,'Hemingway Didn\'t Say That: The Truth Behind Familiar Quotations',2017,1,2,'/static/lib/img/013.jpg','Everywhere you look, you’ll find viral quotable wisdom attributed to icons ranging from Abraham Lincoln to Mark Twain, from Cicero to Woody Allen. But more often than not, these attributions are false.\r\n\r\nGarson O’Toole—the Internet’s foremost investigator into the dubious origins of our most repeated quotations, aphorisms, and everyday sayings—collects his efforts into a first-ever encyclopedia of corrective popular history. Containing an enormous amount of original research, this delightful compendium presents information previously unavailable to readers, writers, and scholars. It also serves as the first careful examination of what causes misquotations and how they spread across the globe.\r\n\r\nUsing the massive expansion in online databases as well as old-fashioned gumshoe archival digging, O’Toole provides a fascinating study of our modern abilities to find and correct misinformation. As Carl Sagan did not say, “Somewhere, something incredible is waiting to be known.”'),(17,'1984',2013,1,0,'/static/lib/img/014.jpg','In 1984, London is a grim city where Big Brother is always watching you and the Thought Police can practically read your mind. Winston is a man in grave danger for the simple reason that his memory still functions. Drawn into a forbidden love affair, Winston finds the courage to join a secret revolutionary organization called The Brotherhood, dedicated to the destruction of the Party. Together with his beloved Julia, he hazards his life in a deadly match against the powers that be.'),(18,'The Water Is Wide: A Memoir ',2010,1,3,'/static/lib/img/015.jpg','Though the children of Yamacraw Island live less than two miles from the southern mainland, they can’t name the US president or the ocean that surrounds them. Most can’t read or write. Many of the students are the descendants of slaves, handicapped by poverty and isolation.\r\n \r\nWhen Pat Conroy arrives, an eager young teacher at the height of the civil rights movement, he finds a community still bound by the bitter effects of racism, but he is determined to broaden its members’ horizons and give them a voice.\r\n \r\nIn this poignant memoir, which Newsweek called “Miraculous . . . An experience of joy,” the New York Times bestselling author of The Prince of Tides plumbs his experiences as a young teacher on an isolated South Carolina island to reveal the shocking inequalities of the American education system.'),(19,'The Secret Wife',2016,1,0,'/static/lib/img/016.jpg','A Russian grand duchess and an English journalist. Linked by one of the world’s greatest mysteries . . .\r\n\r\nLove. Guilt. Heartbreak.\r\n\r\n1914\r\n\r\nRussia is on the brink of collapse, and the Romanov family faces a terrifyingly uncertain future. Grand Duchess Tatiana has fallen in love with cavalry officer Dmitri, but events take a catastrophic turn, placing their romance – and their lives – in danger . . .\r\n\r\n2016\r\n\r\nKitty Fisher escapes to her great-grandfather’s remote cabin in America, after a devastating revelation makes her flee London. There, on the shores of Lake Akanabee, she discovers the spectacular jewelled pendant that will lead her to a long-buried family secret . . .\r\n\r\nHaunting, moving and beautifully written, The Secret Wife effortlessly crosses centuries, as past merges with present in an unforgettable story of love, loss and resilience.'),(20,'From Sand and Ash',2016,1,2,'/static/lib/img/017.jpg','As children, Eva Rosselli and Angelo Bianco were raised like family but divided by circumstance and religion. As the years go by, the two find themselves falling in love. But the church calls to Angelo and, despite his deep feelings for Eva, he chooses the priesthood.\r\n\r\nNow, more than a decade later, Angelo is a Catholic priest and Eva is a woman with nowhere to turn. With the Gestapo closing in, Angelo hides Eva within the walls of a convent, where Eva discovers she is just one of many Jews being sheltered by the Catholic Church.\r\n\r\nBut Eva can’t quietly hide, waiting for deliverance, while Angelo risks everything to keep her safe. With the world at war and so many in need, Angelo and Eva face trial after trial, choice after agonizing choice, until fate and fortune finally collide, leaving them with the most difficult decision of all.'),(21,'In Farleigh Field',2017,1,3,'/static/lib/img/018.jpg','World War II comes to Farleigh Place, the ancestral home of Lord Westerham and his five daughters, when a soldier with a failed parachute falls to his death on the estate. After his uniform and possessions raise suspicions, MI5 operative and family friend Ben Cresswell is covertly tasked with determining if the man is a German spy. The assignment also offers Ben the chance to be near Lord Westerham’s middle daughter, Pamela, whom he furtively loves. But Pamela has her own secret: she has taken a job at Bletchley Park, the British code-breaking facility.\r\n\r\nAs Ben follows a trail of spies and traitors, which may include another member of Pamela’s family, he discovers that some within the realm have an appalling, history-altering agenda. Can he, with Pamela’s help, stop them before England falls?\r\n\r\nInspired by the events and people of World War II, writer Rhys Bowen crafts a sweeping and riveting saga of class, family, love, and betrayal.'),(22,'The Halo Effect',2017,1,4,'/static/lib/img/019.jpg','It was supposed to be a typical October evening for renowned portrait artist Will Light. Over dinner of lamb tagine, his wife, Sophie, would share news about chorus rehearsals for the upcoming holiday concert, and their teenage daughter, Lucy, would chatter about French club and field hockey. Only Lucy never came home. Her body was found, days later, in the woods.\r\n\r\nThe Eastern Seaboard town of Port Fortune used to be Will’s comfort. Now, there’s no safe harbor for him. Not even when Father Gervase asks Will to paint portraits of saints for the new cathedral. Using the townspeople as models, Will sees in each face only a mask of the darkness of evil. And he just might be painting his daughter’s killer.\r\n\r\nAs Will navigates his rage and heartbreak, Sophie tries to move on; Father Gervase becomes an unexpected ally; and Rain, Lucy’s best friend, shrouds herself in a near-silent fugue. Their paths collide in a series of inextricably linked, dark, dangerous moments that could lead to their undoing…or to their redemption.'),(23,'The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life',2016,1,0,'/static/lib/img/020.jpg','In this generation-defining self-help guide, a superstar blogger cuts through the crap to show us how to stop trying to be positive all the time so that we can truly become better, happier people.\r\n\r\nFor decades we\'ve been told that positive thinking is the key to a happy, rich life. \"F*ck positivity,\" Mark Manson says. \"Let\'s be honest, shit is f*cked, and we have to live with it.\" In his wildly popular Internet blog, Manson doesn\'t sugarcoat or equivocate. He tells it like it is - a dose of raw, refreshing, honest truth that is sorely lacking today. The Subtle Art of Not Giving a F*ck is his antidote to the coddling, let\'s-all-feel-good mind-set that has infected modern society and spoiled a generation, rewarding them with gold medals just for showing up.\r\n\r\nManson makes the argument, backed by both academic research and well-timed poop jokes, that improving our lives hinges not on our ability to turn lemons into lemonade but on learning to stomach lemons better. Human beings are flawed and limited - \"not everybody can be extraordinary; there are winners and losers in society, and some of it is not fair or your fault\". Manson advises us to get to know our limitations and accept them. Once we embrace our fears, faults, and uncertainties, once we stop running and avoiding and start confronting painful truths, we can begin to find the courage, perseverance, honesty, responsibility, curiosity, and forgiveness we seek.\r\n\r\nThere are only so many things we can give a f*ck about, so we need to figure out which ones really matter, Manson makes clear. While money is nice, caring about what you do with your life is better, because true wealth is about experience. A much-needed grab-you-by-the-shoulders-and-look-you-in-the-eye moment of real talk, filled with entertaining stories and profane, ruthless humor, The Subtle Art of Not Giving a F*ck is a refreshing slap for a generation to help them lead contented, grounded lives.'),(24,'The Last Girl',2016,1,0,'/static/lib/img/021.jpg','A mysterious worldwide epidemic reduces the birthrate of female infants from 50 percent to less than 1 percent. Medical science and governments around the world scramble in an effort to solve the problem, but twenty-five years later there is no cure, and an entire generation grows up with a population of fewer than a thousand women.\r\n\r\nZoey and some of the surviving young women are housed in a scientific research compound dedicated to determining the cause. For two decades, she’s been isolated from her family, treated as a test subject, and locked away—told only that the virus has wiped out the rest of the world’s population.\r\n\r\nCaptivity is the only life Zoey has ever known, and escaping her heavily armed captors is no easy task, but she’s determined to leave before she is subjected to the next round of tests…a program that no other woman has ever returned from. Even if she’s successful, Zoey has no idea what she’ll encounter in the strange new world beyond the facility’s walls. Winning her freedom will take brutality she never imagined she possessed, as well as all her strength and cunning—but Zoey is ready for war.'),(25,'The Fellowship of the Ring',2012,1,4,'/static/lib/img/022.jpg','In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell into the hands of Bilbo Baggins, as told in The Hobbit. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.'),(26,'Big Little Lies',2014,1,5,'/static/lib/img/023.jpg','A murder...A tragic accident...Or just parents behaving badly? What’s indisputable is that someone is dead.\r\n\r\nMadeline is a force to be reckoned with. She’s funny, biting, and passionate; she remembers everything and forgives no one. Celeste is the kind of beautiful woman who makes the world stop and stare but she is paying a price for the illusion of perfection. New to town, single mom Jane is so young that another mother mistakes her for a nanny. She comes with a mysterious past and a sadness beyond her years. These three women are at different crossroads, but they will all wind up in the same shocking place.'),(27,'The Breaking Light',2017,1,3,'/static/lib/img/024.jpg','In a stratified society where contact with the sun is a luxury reserved for the elite, those kept prisoner in the darkness will do anything to find the light. Arden—beautiful, street-smart, and cynical—is one of the citizens of the lowest Level, known as Undercity, of an off-world colony. A blackout band traps Arden in her district, but as sister to the leader of the most powerful gang in Undercity, she has access to Above.\r\n\r\nThere she meets Dade, one of the few lucky enough to be born into the sun-kissed families who reside in the Towers soaring above the rest of the city. But life isn’t perfect in the sky. Dade, desperate to escape his upcoming arranged marriage, has a secret of his own, and he’s willing to risk everything for it.\r\n\r\nAn unlikely romance develops between the two teens—but their love faces opposition from above and below. When her gang pressures Arden to help break the grip of the elite and end Dade’s interference with their drug trade, she is forced to make a deadly choice between love and family loyalty. But will the brewing class war destroy the world around them first?');
/*!40000 ALTER TABLE `lib_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_book_authors`
--

DROP TABLE IF EXISTS `lib_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_book_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lib_book_authors_book_id_80cfa433_uniq` (`book_id`,`author_id`),
  KEY `lib_book_authors_author_id_e79da042_fk_lib_author_id` (`author_id`),
  CONSTRAINT `lib_book_authors_author_id_e79da042_fk_lib_author_id` FOREIGN KEY (`author_id`) REFERENCES `lib_author` (`id`),
  CONSTRAINT `lib_book_authors_book_id_b33a3fc6_fk_lib_book_id` FOREIGN KEY (`book_id`) REFERENCES `lib_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_book_authors`
--

LOCK TABLES `lib_book_authors` WRITE;
/*!40000 ALTER TABLE `lib_book_authors` DISABLE KEYS */;
INSERT INTO `lib_book_authors` VALUES (12,4,6),(13,5,7),(14,6,8),(15,7,9),(18,9,12),(19,10,10),(20,11,13),(21,12,14),(22,13,15),(23,14,16),(24,15,17),(25,16,18),(26,17,19),(27,18,20),(28,19,21),(29,20,22),(30,21,23),(31,22,24),(32,23,25),(33,24,26),(34,25,27),(35,26,28),(36,27,29);
/*!40000 ALTER TABLE `lib_book_authors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-15 13:13:51
