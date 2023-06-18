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
('C001','P001','UID001','Eligendi officia tempore fugit quo animi incidunt consectetur.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C002','P002','UID002','Hic omnis provident reprehenderit ex.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C003','P003','UID003','Molestias sit expedita earum pariatur magni excepturi voluptates.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C004','P004','UID004','Maxime recusandae alias possimus.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C005','P005','UID005','Magni velit amet porro eos deserunt ut perspiciatis voluptates.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C006','P006','UID006','Dolorum ab pariatur eveniet temporibus odit commodi.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C007','P007','UID007','Porro et eum praesentium facere necessitatibus reprehenderit sunt at.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C008','P008','UID008','Nemo velit voluptatem porro nesciunt tenetur quasi nostrum.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C009','P009','UID009','Deleniti ut eos labore blanditiis ducimus.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C010','P010','UID010','Id ipsa iusto deserunt.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C011','P011','UID011','Nobis inventore at unde animi.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C012','P012','UID012','Aliquid eligendi commodi nisi in totam ab quas unde dignissimos.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C013','P013','UID013','Eligendi blanditiis voluptatum quibusdam voluptatem quos non est.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C014','P014','UID014','Porro numquam accusamus molestias.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C015','P015','UID015','Eligendi adipisci magni iure.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C016','P016','UID016','Quos ab sunt eveniet numquam reiciendis eos.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C017','P017','UID017','Commodi quaerat ipsam eius illum.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C018','P018','UID018','Saepe maxime debitis.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C019','P019','UID019','Sit dolores harum sint tenetur doloribus facilis totam.','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('C020','P020','UID020','Impedit ipsam deserunt corrupti est laboriosam sed pariatur.','2023-06-18 15:14:15','2023-06-18 15:14:15');

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
('M001','P001','UID001','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M002','P002','UID002','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M003','P003','UID003','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M004','P004','UID004','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M005','P005','UID005','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M006','P006','UID006','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M007','P007','UID007','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M008','P008','UID008','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M009','P009','UID009','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M010','P010','UID010','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M011','P011','UID011','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M012','P012','UID012','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M013','P013','UID013','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M014','P014','UID014','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M015','P015','UID015','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M016','P016','UID016','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M017','P017','UID017','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M018','P018','UID018','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M019','P019','UID019','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('M020','P020','UID020','2023-06-18 15:14:15','2023-06-18 15:14:15');

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
('P001','delectus tenetur sit','Laborum nisi enim ratione natus inventore enim pariatur sit sunt.','UID001','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P002','at ipsa eum','Blanditiis repellat sint.','UID002','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P003','impedit quas sit','Illum voluptate hic autem sunt.','UID003','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P004','possimus iure aut','Laudantium nihil eum facere perferendis ipsam ut.','UID004','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P005','molestiae nulla dicta','Voluptatum culpa tenetur esse provident possimus officia id.','UID005','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P006','impedit minus unde','Harum voluptas cum accusamus fugiat placeat necessitatibus officia aspernatur in.','UID006','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P007','accusamus fuga quibusdam','Ducimus ullam eos quod enim voluptates in accusamus.','UID007','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P008','similique officia tempora','Cumque praesentium explicabo.','UID008','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P009','eius voluptates voluptatibus','Officia magnam ab voluptatibus esse nobis quidem distinctio explicabo.','UID009','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P010','fuga rerum deserunt','Repellat veniam necessitatibus ab non.','UID010','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P011','nobis nemo odit','Fugit excepturi consectetur.','UID011','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P012','voluptate nihil placeat','Praesentium quos recusandae deleniti soluta neque.','UID012','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P013','doloremque tenetur et','Voluptate omnis occaecati consequuntur officia voluptatibus.','UID013','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P014','minus est non','Recusandae iste nemo debitis quibusdam.','UID014','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P015','explicabo praesentium nam','Voluptatem assumenda minima error incidunt libero ipsam minus.','UID015','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P016','fugiat quam natus','Magni voluptatibus quis odio ratione ex maiores.','UID016','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P017','impedit nam facilis','Vero nostrum consequatur repellat.','UID017','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P018','cumque repellendus autem','Exercitationem autem modi beatae recusandae eaque natus deleniti voluptates sed.','UID018','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P019','mollitia amet soluta','Repudiandae ea dolores facere.','UID019','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P020','culpa quis veritatis','Magni officiis praesentium ducimus possimus.','UID020','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('P021','New Testing Project','Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque iste dolorum ullam necessitatibus distinctio facilis dignissimos soluta est harum optio magnam, sint quia eligendi error sunt, laudantium ipsam, quae delectus.lorem','UID021','2023-06-18 15:27:21','2023-06-18 15:27:21'),
('P022','New Testing Project2','Lorem ipsum dolor sit amet consectetur adipisicing elit. Atque iste dolorum ullam necessitatibus distinctio facilis dignissimos soluta est harum optio magnam, sint quia eligendi error sunt, laudantium ipsam, quae delectus.lorem','UID021','2023-06-18 15:38:20','2023-06-18 15:38:20');

/*Table structure for table `recordings` */

DROP TABLE IF EXISTS `recordings`;

CREATE TABLE `recordings` (
  `recording_id` varchar(255) NOT NULL,
  `project_id` varchar(255) NOT NULL,
  `musician_id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `song_url` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`recording_id`),
  KEY `project_id` (`project_id`),
  KEY `musician_id` (`musician_id`),
  CONSTRAINT `recordings_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recordings_ibfk_2` FOREIGN KEY (`musician_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `recordings` */

insert  into `recordings`(`recording_id`,`project_id`,`musician_id`,`title`,`song_url`,`createdAt`,`updatedAt`) values 
('R001','P001','UID001','Facere rerum recusandae.','https://loremflickr.com/640/480?lock=7226942755438592','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R002','P002','UID002','Cumque quod ducimus.','https://loremflickr.com/640/480?lock=5172484783472640','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R003','P003','UID003','Est aut sed.','https://loremflickr.com/640/480?lock=6947892013039616','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R004','P004','UID004','Excepturi dolorem dolor.','https://picsum.photos/seed/ZwUEVjfH/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R005','P005','UID005','Dolore voluptatibus quo.','https://loremflickr.com/640/480?lock=4679360046956544','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R006','P006','UID006','Omnis illum sequi.','https://loremflickr.com/640/480?lock=600097882636288','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R007','P007','UID007','Possimus soluta sunt.','https://picsum.photos/seed/As6sg2QSi/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R008','P008','UID008','Corporis repellat maiores.','https://loremflickr.com/640/480?lock=4629602976661504','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R009','P009','UID009','Nisi beatae quasi.','https://picsum.photos/seed/62cXxA/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R010','P010','UID010','Assumenda voluptas ducimus.','https://loremflickr.com/640/480?lock=8192274397659136','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R011','P011','UID011','Dolorum nostrum dolor.','https://picsum.photos/seed/nFAHYSavGX/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R012','P012','UID012','Quasi blanditiis corporis.','https://picsum.photos/seed/2vuonQ/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R013','P013','UID013','Provident odio unde.','https://loremflickr.com/640/480?lock=7615807387336704','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R014','P014','UID014','Debitis iure adipisci.','https://picsum.photos/seed/m27qw6q3/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R015','P015','UID015','Dolorum exercitationem accusantium.','https://loremflickr.com/640/480?lock=6411777499725824','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R016','P016','UID016','Minus recusandae odit.','https://loremflickr.com/640/480?lock=6891662529789952','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R017','P017','UID017','Ab autem accusamus.','https://picsum.photos/seed/w1uXzwGN/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R018','P018','UID018','Qui consequuntur commodi.','https://picsum.photos/seed/cLpfn/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R019','P019','UID019','Iusto et cupiditate.','https://loremflickr.com/640/480?lock=563232058114048','2023-06-18 15:14:15','2023-06-18 15:14:15'),
('R020','P020','UID020','Culpa culpa ea.','https://picsum.photos/seed/jMcw9/640/480','2023-06-18 15:14:15','2023-06-18 15:14:15');

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
('UID001','Favian_Hauck','Favian Hauck','$2b$10$e0slW0IWn8pnbS90RD34Ou1uKC.osPi9FArIjUefzZmQIej0Rp7j6','Glennie85@yahoo.com','member',6000,11,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID002','Willie_Gerlach','Willie Gerlach','$2b$10$kfUOAEBKAwfHOlEReg0eMePdqrV.vYdxLI392W8XwnelD48LPah7y','Eduardo.Boehm14@gmail.com','member',67000,43,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID003','Emerson_Reinger','Emerson Reinger','$2b$10$UPK9WGQGXHM4p2M7uO2Wx.5w3Z.OeX5mCRvco1k4ktmjJyF0mWHNK','Reva.Lindgren@yahoo.com','musisi',13000,11,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID004','Oma_Zemlak','Oma Zemlak','$2b$10$evWrffX7o4HK/bMX98g3xurMbjJfeDpUVhFoEvDK8NPSUM6fB/huO','Adolphus.Hammes67@gmail.com','member',29000,23,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID005','Golden_Koepp','Golden Koepp','$2b$10$lUAMkjNGyktNfXyzuMWot.boQJedEO/rdN8RJdTwewv7hghnPe.3y','Rosendo.Lueilwitz38@gmail.com','member',96000,18,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID006','Erica_Hane','Erica Hane','$2b$10$2.VVp85J5LB/r.P28XYge.lA5uZBvq.yUOC1XodoS2lDWnALrp50W','Danyka65@hotmail.com','member',66000,14,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID007','Dovie_Cassin','Dovie Cassin','$2b$10$6MnRX07nr3OEZFb2EHTOquQtYZG6RpQk79ufACeo8FzlZb6n70Ee6','Johathan_Leuschke@hotmail.com','member',94000,19,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID008','Rosemarie_Rippin','Rosemarie Rippin','$2b$10$snkV3VHAXKFxGbRZKcSZUuPtDSewNYVVqRRpnTGHAuqxPmV/kwpNS','Demario_Harber@yahoo.com','produser',42000,10,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID009','Dianna_Borer-Ryan','Dianna Borer-Ryan','$2b$10$MiGVKuH9Xk.IQGvZ//Gc1ebeKc6jgarFqpg5H77oO22lHgqEI381G','Frederic.Dach@yahoo.com','produser',59000,20,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID010','Stanley_Davis','Stanley Davis','$2b$10$nTFqfi3rIa513coJcFYXy.lLFWJ0YVUIU8mHfAmLN5FGUmTUHQnb6','London_Wolff-Braun@hotmail.com','musisi',78000,18,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID011','Sincere_Zieme','Sincere Zieme','$2b$10$uZOlrkpwY7f3.nB3sDMCu.TF3LbDPd8a3/GaKcAXh8gs8dKhqKkve','Gaetano.Will@hotmail.com','produser',96000,48,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID012','Veronica_Fadel','Veronica Fadel','$2b$10$X5Xyq4uoLkqOPuDkXezNdu0o4qYiBxkuy6VB5TDLoqv0r4Q79q40y','Joe.Ferry@hotmail.com','produser',62000,29,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID013','Alford_Ullrich','Alford Ullrich','$2b$10$1Dto1O9jQI2LZ7Ib.M.Huebb9rw.biYaxwxiSIChgTPdJC59//jI.','Josefina_Buckridge85@yahoo.com','member',33000,28,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID014','Sarai_Kris','Sarai Kris','$2b$10$DZCvmTO2qGe9FJfpfvv5QOqBbjxrfwVWk9i77JGNtJX/fr6DntWs6','Camryn_Corkery59@yahoo.com','member',25000,26,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID015','Orland_White','Orland White','$2b$10$Su6PpWHDTIVSCeuI1aNvTOgROy2OsBhiWnIezoK/obVxqOUA9ixxS','Timmothy_Gislason22@yahoo.com','musisi',77000,32,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID016','Lane_Schultz','Lane Schultz','$2b$10$hDzgIj8asvSxOp748grBROLNSOLhywOZTGkiH5GqaaBk7sIb6izMW','Harmony7@gmail.com','member',5000,31,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID017','Jadyn_Franecki','Jadyn Franecki','$2b$10$HGqnegI/hvSWixjIqM/fY.szckUXOtV8TexYhx.iFaqas8INtivla','Pamela36@yahoo.com','produser',81000,27,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID018','Blanche_Weber','Blanche Weber','$2b$10$NZlIDkluaoOFbdC6mw8NiehMn/ZzzSohxhpst9PIytPWcN5FpDYdi','Lori_Hahn91@gmail.com','produser',35000,49,'2023-06-18 15:14:14','2023-06-18 15:14:14'),
('UID019','Bryana_Lindgren','Bryana Lindgren','$2b$10$fnX/Q.PY40RiU82ivvWKJ.x9ltBFLnhY8rfFzOeYWgw0VXAz8g0fC','Kari.Koepp44@hotmail.com','produser',61000,16,'2023-06-18 15:14:15','2023-06-18 15:14:15'),
('UID020','Christ_Ward','Christ Ward','$2b$10$Oky.FyMDWQqU4sU5VMlHHOHvXhKek5HLvM1j3aHx8CUTyoOQUTZRK','Emilia79@hotmail.com','musisi',82000,42,'2023-06-18 15:14:15','2023-06-18 15:14:15'),
('UID021','testUsername','user name','$2b$10$ve.MiZdqtExe/K1gBrvrp.Ibu17IFSshCMjJ/LSmcH6xSTgUQ7TT6','user@gmail.com','produser',0,0,'2023-06-18 15:20:58','2023-06-18 15:21:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
