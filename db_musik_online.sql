/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 10.4.24-MariaDB : Database - db_musik_online
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_musik_online` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_musik_online`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `comment_id` varchar(255) NOT NULL,
  `project_id` varchar(255) NOT NULL,
  `commenter_id` varchar(255) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `project_id` (`project_id`),
  KEY `commenter_id` (`commenter_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`commenter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `comments` */

insert  into `comments`(`comment_id`,`project_id`,`commenter_id`,`comment`,`createdAt`,`updatedAt`) values 
('0','0','0','Nisi placeat ut corrupti quidem odio aliquid fugiat debitis rerum.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('1','1','1','Autem sint temporibus exercitationem odit atque cum animi nulla enim.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('10','10','10','Ipsa deleniti rerum sapiente.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('11','11','11','Vero laudantium voluptatibus quod eum nihil.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('12','12','12','Omnis odio minima quasi ad.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('13','13','13','Sed inventore voluptate dignissimos hic nam nobis.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('14','14','14','Atque corporis dolorum cupiditate odio fuga ullam impedit aut.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('15','15','15','Tempore laborum voluptatibus molestias.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('16','16','16','Illo explicabo unde ab assumenda temporibus sint omnis natus.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('17','17','17','Mollitia id totam.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('18','18','18','Deserunt officiis ea quisquam temporibus distinctio nesciunt sed nihil corporis.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('19','19','19','Rem deserunt ducimus mollitia ab necessitatibus adipisci reprehenderit cum blanditiis.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('2','2','2','Beatae repellat incidunt voluptate dicta quae consequatur.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('3','3','3','Autem inventore esse consequuntur numquam soluta veniam mollitia est unde.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('4','4','4','Et et impedit magnam eligendi.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('5','5','5','Fuga harum ducimus esse repellendus fugiat a vel.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('6','6','6','Eveniet quia in repudiandae aliquam architecto numquam repellat minima nam.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('7','7','7','Exercitationem autem fuga.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('8','8','8','Architecto quasi amet.','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('9','9','9','Commodi fugit ab optio ipsa possimus.','2023-05-22 13:36:11','2023-05-22 13:36:11');

/*Table structure for table `project_members` */

DROP TABLE IF EXISTS `project_members`;

CREATE TABLE `project_members` (
  `project_member_id` varchar(255) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `musician_id` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`project_member_id`),
  KEY `musician_id` (`musician_id`),
  CONSTRAINT `project_members_ibfk_1` FOREIGN KEY (`musician_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `project_members` */

insert  into `project_members`(`project_member_id`,`project_id`,`musician_id`,`createdAt`,`updatedAt`) values 
('0','0','0','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('1','1','1','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('10','10','10','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('11','11','11','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('12','12','12','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('13','13','13','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('14','14','14','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('15','15','15','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('16','16','16','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('17','17','17','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('18','18','18','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('19','19','19','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('2','2','2','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('3','3','3','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('4','4','4','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('5','5','5','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('6','6','6','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('7','7','7','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('8','8','8','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('9','9','9','2023-05-22 13:36:11','2023-05-22 13:36:11');

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `project_id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `producer_id` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `producer_id` (`producer_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `projects` */

insert  into `projects`(`project_id`,`title`,`description`,`producer_id`,`createdAt`,`updatedAt`) values 
('0','ullam iusto est','Doloremque minima sapiente impedit itaque eos molestiae.','0','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('1','quam dolor perspiciatis','Non reprehenderit modi voluptate fugiat.','1','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('10','ea rerum consequuntur','Officiis aut nemo pariatur saepe quam sint minima.','10','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('11','harum veritatis nulla','Minus est unde quibusdam.','11','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('12','magni reiciendis labore','Suscipit modi praesentium consectetur.','12','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('13','pariatur dicta labore','Temporibus vero ab cumque.','13','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('14','repellendus iusto distinctio','Eum illo libero incidunt id iusto impedit perferendis unde quos.','14','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('15','dolore ex reprehenderit','Magni eos velit id ullam asperiores in voluptates omnis ullam.','15','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('16','veniam harum ullam','Accusantium pariatur numquam ea pariatur maiores veritatis optio.','16','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('17','dicta dolorem sapiente','Ex placeat provident mollitia vero provident.','17','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('18','nobis commodi assumenda','Ex tempora quas enim excepturi.','18','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('19','qui temporibus vel','Adipisci illo cupiditate excepturi.','19','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('2','aut ducimus adipisci','Adipisci inventore soluta.','2','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('3','esse quis iure','Veniam eum exercitationem aliquam voluptas ipsam temporibus.','3','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('4','exercitationem eius dolorem','Impedit provident quasi earum quidem consequatur.','4','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('5','impedit sit odit','Cupiditate aperiam vitae enim optio tempore perspiciatis ea eius.','5','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('6','earum ipsam officiis','Est deserunt labore veniam molestiae.','6','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('7','explicabo porro possimus','Aliquam fuga quia perspiciatis sapiente iusto.','7','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('8','voluptatibus ut beatae','Ipsum omnis accusantium odit provident veritatis ipsam modi ipsam.','8','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('9','exercitationem maxime dicta','Natus tempore quae ad exercitationem soluta nesciunt.','9','2023-05-22 13:36:11','2023-05-22 13:36:11');

/*Table structure for table `recordings` */

DROP TABLE IF EXISTS `recordings`;

CREATE TABLE `recordings` (
  `recording_id` varchar(255) NOT NULL,
  `project_id` varchar(255) NOT NULL,
  `musician_id` varchar(255) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`recording_id`),
  KEY `project_id` (`project_id`),
  KEY `musician_id` (`musician_id`),
  CONSTRAINT `recordings_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recordings_ibfk_2` FOREIGN KEY (`musician_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `recordings` */

insert  into `recordings`(`recording_id`,`project_id`,`musician_id`,`file_path`,`createdAt`,`updatedAt`) values 
('0','0','0','/opt/sbin/psst_telegraph_plus.woff','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('1','1','1','/usr/sbin/unsteady_flavour.3gp','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('10','10','10','/Applications/instrumentation_growl.mpe','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('11','11','11','/bin/ugh_overtax.xlsx','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('12','12','12','/lost+found/forenenst_deliberately.distz','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('13','13','13','/lost+found/dirty.svgz','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('14','14','14','/usr/obj/chauvinist.elc','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('15','15','15','/rescue/after_swerve.webp','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('16','16','16','/tmp/from.pps','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('17','17','17','/tmp/frequent_whenever.pps','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('18','18','18','/srv/against_practical_speakerphone.mp2','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('19','19','19','/var/mail/considering_finally_up.dist','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('2','2','2','/opt/sbin/deceivingly_excepting.war','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('3','3','3','/usr/src/kiss_fooey_because.vsd','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('4','4','4','/etc/defaults/pfft_presume_quizzically.map','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('5','5','5','/usr/X11R6/huzzah.ini','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('6','6','6','/var/yp/phooey_often.bin','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('7','7','7','/usr/ports/suddenly_blah_deep.arc','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('8','8','8','/Network/energetically_whose.woff','2023-05-22 13:36:11','2023-05-22 13:36:11'),
('9','9','9','/etc/namedb/yahoo_than_ha.ppt','2023-05-22 13:36:11','2023-05-22 13:36:11');

/*Table structure for table `sequelizemeta` */

DROP TABLE IF EXISTS `sequelizemeta`;

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sequelizemeta` */

insert  into `sequelizemeta`(`name`) values 
('20230520130137-create-user.js'),
('20230520131344-create-project.js'),
('20230520131506-create-project-member.js'),
('20230520131547-create-recording.js'),
('20230520131606-create-comment.js');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `api_hit` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`name`,`password`,`email`,`role`,`balance`,`api_hit`,`createdAt`,`updatedAt`) values 
('0','Tobin_Feil','Tobin Feil','Z0AuCDKqMMRSeNl','Tito_Monahan@hotmail.com','member',89000,33,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('1','Myrl_Schultz','Myrl Schultz','WCbM8o5ULL5eQwn','Kasandra54@gmail.com','member',23000,37,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('10','Vincent_Lebsack','Vincent Lebsack','KK7fs53vWCVCpbG','Heaven.Schowalter@gmail.com','producer',71000,16,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('11','Alexander_Labadie','Alexander Labadie','tbuOg1VHL5dIbyS','Robbie39@gmail.com','member',18000,29,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('12','Flavio_Morar','Flavio Morar','K8SCrr26JWUbR88','Toney.Aufderhar@yahoo.com','musician',9000,48,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('13','Fredy_Douglas','Fredy Douglas','GDgVTpsWJRAKsqX','Melody.Kuphal@hotmail.com','producer',18000,48,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('14','Tanya_Paucek','Tanya Paucek','083Af6z2SQrf8e8','Carey_Bergnaum@gmail.com','member',18000,14,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('15','Jaren_Emard','Jaren Emard','bOpat4aL4YgVq3Z','Bonita.Heaney17@gmail.com','musician',53000,16,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('16','Trey_Moore-Ritchie','Trey Moore-Ritchie','oMV7YmdNFMoSqTG','Ivory.Zulauf@hotmail.com','musician',15000,32,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('17','Wilfredo_Gibson','Wilfredo Gibson','Brss8AfNYseBN_M','Samir64@yahoo.com','musician',3000,47,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('18','Chaya_Jast','Chaya Jast','0g_5s8SwWLuu001','Adah.Wintheiser@hotmail.com','member',35000,27,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('19','Leone_Yost','Leone Yost','XThqlBUdx4yAziN','Alex82@yahoo.com','musician',74000,12,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('2','Chet_Mohr-Sawayn','Chet Mohr-Sawayn','Xv4Ou466UKPtRo9','Ora.Gleichner@gmail.com','musician',9000,36,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('3','Desmond_Kub-Douglas','Desmond Kub-Douglas','r5PplbCbSSqHKjz','Eliezer95@hotmail.com','producer',42000,47,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('4','Cynthia_Mills','Cynthia Mills','4HK05C7jYVe4orR','Florine19@hotmail.com','member',63000,31,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('5','Jovanny_Funk','Jovanny Funk','NzfAZrNMY_1a7GG','Herminio5@hotmail.com','member',22000,11,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('6','Nyasia_Keeling','Nyasia Keeling','EFUuun8yEByPAgy','Clovis40@gmail.com','musician',94000,26,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('7','Kendall_Graham','Kendall Graham','cM3Yze3ZDblbi6s','Katelin.Schaden88@yahoo.com','producer',17000,45,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('8','Jarod_Legros','Jarod Legros','PlZ8ZV2aIVp_tX4','Mavis.Frami@hotmail.com','producer',84000,22,'2023-05-22 13:36:11','2023-05-22 13:36:11'),
('9','Henderson_Mante','Henderson Mante','zHTSYrQVxiuhnjT','Rex84@hotmail.com','musician',84000,36,'2023-05-22 13:36:11','2023-05-22 13:36:11');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
