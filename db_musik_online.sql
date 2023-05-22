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
('C001','P001','UID001','Vel repellendus veniam.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C002','P002','UID002','Minima molestias distinctio tempora accusantium.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C003','P003','UID003','Doloribus praesentium perspiciatis.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C004','P004','UID004','Alias nostrum inventore quibusdam rerum neque dicta nemo esse.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C005','P005','UID005','Iusto esse vero aut consectetur pariatur dolor vel eveniet minus.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C006','P006','UID006','Occaecati totam dolorum sit suscipit error aperiam.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C007','P007','UID007','Ex facilis itaque nam iste optio.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C008','P008','UID008','Debitis provident eaque ad voluptatibus dicta aspernatur soluta perspiciatis omnis.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C009','P009','UID009','Excepturi numquam tempora tenetur corporis minus adipisci recusandae vero veritatis.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C010','P010','UID010','Explicabo sunt eaque occaecati dolorum dolore dolorum officia harum atque.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C011','P011','UID011','Porro nemo perferendis quo adipisci iure perferendis alias quaerat ab.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C012','P012','UID012','Atque accusantium libero eligendi natus sed dolores eaque in autem.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C013','P013','UID013','Quaerat quo culpa corporis officiis incidunt.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C014','P014','UID014','Dignissimos esse amet doloribus et corporis.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C015','P015','UID015','Officia eaque dolorem.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C016','P016','UID016','Dolores voluptatibus alias laborum quaerat quo labore delectus itaque.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C017','P017','UID017','Minus corrupti sunt sed.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C018','P018','UID018','Sit dolor optio culpa iste porro.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C019','P019','UID019','Adipisci fugiat tenetur ea quis numquam.','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('C020','P020','UID020','Amet et minima voluptatum fugiat sint nemo similique ipsa.','2023-05-22 14:10:02','2023-05-22 14:10:02');

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
('M001','UID001','UID001','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M002','UID002','UID002','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M003','UID003','UID003','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M004','UID004','UID004','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M005','UID005','UID005','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M006','UID006','UID006','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M007','UID007','UID007','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M008','UID008','UID008','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M009','UID009','UID009','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M010','UID010','UID010','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M011','UID011','UID011','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M012','UID012','UID012','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M013','UID013','UID013','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M014','UID014','UID014','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M015','UID015','UID015','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M016','UID016','UID016','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M017','UID017','UID017','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M018','UID018','UID018','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M019','UID019','UID019','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M020','UID020','UID020','2023-05-22 14:10:02','2023-05-22 14:10:02');

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
('P001','hic explicabo tempora','Sit ab porro sunt delectus nam incidunt rerum alias.','UID001','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P002','earum rerum aperiam','Culpa repudiandae hic unde.','UID002','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P003','iste nihil aut','Impedit ducimus ad ducimus magni est dolor.','UID003','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P004','porro sapiente ipsa','Temporibus nulla eaque temporibus cupiditate nesciunt quos officiis inventore.','UID004','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P005','iste ducimus possimus','Excepturi rem alias ex eius aliquam a veritatis voluptate.','UID005','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P006','reiciendis sed nam','Consectetur sit omnis fugiat cumque occaecati.','UID006','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P007','deserunt tenetur similique','Aliquam impedit commodi odio.','UID007','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P008','quaerat quam cupiditate','Repellat culpa fugit cumque tenetur perspiciatis voluptatum similique impedit.','UID008','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P009','nemo ad debitis','Voluptates ut adipisci accusantium fugit.','UID009','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P010','exercitationem commodi porro','Molestiae maiores tempore at.','UID010','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P011','porro explicabo itaque','Atque tempora sequi.','UID011','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P012','mollitia accusantium quaerat','Harum quis facere repellat rerum occaecati omnis eius dolorem iure.','UID012','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P013','at molestias adipisci','Neque tempora vel neque.','UID013','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P014','natus quod cupiditate','Explicabo dicta tempore numquam.','UID014','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P015','sint officia vel','Inventore quasi vitae ad totam.','UID015','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P016','impedit facilis perspiciatis','Eligendi quam error maxime labore ducimus ea in quae.','UID016','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P017','eum consectetur velit','Hic quisquam id consequatur dicta expedita ex voluptate dicta.','UID017','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P018','fuga molestiae ea','Nesciunt libero similique ipsa suscipit.','UID018','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P019','sed veritatis officiis','Molestias vero dolorem fugiat vel doloribus.','UID019','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('P020','ipsum rerum veritatis','Totam quis modi quaerat.','UID020','2023-05-22 14:10:02','2023-05-22 14:10:02');

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
('M001','P001','UID001','/usr/include/barbecue_live.zip','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M002','P002','UID002','/mnt/boo_only.html','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M003','P003','UID003','/var/tmp/yahoo_apropos_hence.elc','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M004','P004','UID004','/etc/ppp/garden.arc','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M005','P005','UID005','/private/tmp/ford_aha.woff','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M006','P006','UID006','/var/yp/and_gladly.vsw','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M007','P007','UID007','/private/var/midst_elimination.3gpp','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M008','P008','UID008','/net/outside_collide.bin','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M009','P009','UID009','/usr/ports/agenda_bruised_knowledgeably.ogg','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M010','P010','UID010','/var/tmp/cushion.docx','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M011','P011','UID011','/boot/defaults/at_pleasant.odt','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M012','P012','UID012','/usr/libdata/save_polarization_human.kar','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M013','P013','UID013','/private/solemnly_lovingly_undershoot.doc','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M014','P014','UID014','/dev/following.dump','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M015','P015','UID015','/bin/regal_about_ecstatic.xlw','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M016','P016','UID016','/lib/sorbet.mid','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M017','P017','UID017','/usr/obj/every.html','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M018','P018','UID018','/mnt/than.mp4','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M019','P019','UID019','/etc/periodic/ratio_alongside_disclose.text','2023-05-22 14:10:02','2023-05-22 14:10:02'),
('M020','P020','UID020','/var/log/pfft_wherever.jsonld','2023-05-22 14:10:02','2023-05-22 14:10:02');

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
('UID001','Russell_Leannon','Russell Leannon','$2b$10$9NLxOW71frWYLYjf/ah.bOdmHOQrgOjfg.Zup8db1BLfuPaNJSeTC','Robert_Walter@gmail.com','musician',65000,32,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID002','Jonathon_Koss','Jonathon Koss','$2b$10$oGI1IXoZkWDbDfdffZRi8OIIOV/3EO2U3S7haEai2L43GNDbU7QL2','Brandi.Ernser@gmail.com','member',13000,34,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID003','Sammie_Moen','Sammie Moen','$2b$10$lxkDCJQZ50R3ZkWSuk5vq.460L57vQDe.WPYFOY2mhcBXqD3vMxfC','Angie.Rosenbaum1@yahoo.com','musician',14000,23,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID004','Michele_Heller','Michele Heller','$2b$10$cA0G9UtvgGU8W/qqcgY67eMEdMgvZvGQIvLyZuNJWwt.HZ89XuGki','Miguel.Kuhn17@hotmail.com','member',79000,20,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID005','Virginia_Lubowitz','Virginia Lubowitz','$2b$10$Ki1b/AG4X1vtueq.RzPvdOcqygVP/VZYg0Okh5DXGK5y55U1KC4FK','Daphnee74@yahoo.com','member',52000,40,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID006','Georgette_Runolfsson','Georgette Runolfsson','$2b$10$8GD/yJEkoNXgOOoDIoCVe.hvqNYm58maCp337KbOO0Hu/z2Gbz.C2','Kareem80@gmail.com','producer',88000,27,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID007','Bryon_Bernhard','Bryon Bernhard','$2b$10$C9HLeIt6AVz8RHkL08L4cecplkQoUJR3lF.15sMXYPvk.UXhQXQDS','Kamron_Hettinger28@hotmail.com','member',43000,49,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID008','Dino_Hane','Dino Hane','$2b$10$81uphox5sMn5nMfLagPttuLzvuOPjxUtFh1.Ahessm0B/67wHNfSi','Maynard75@yahoo.com','producer',18000,11,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID009','Ignatius_Huels','Ignatius Huels','$2b$10$GMGNR84vHP/tPCRPHECP6uZSpVd7s9UDJ9yvD60Y/SzVnLgAA3Tpu','Tyrique_Ryan96@hotmail.com','member',35000,27,'2023-05-22 14:10:01','2023-05-22 14:10:01'),
('UID010','Alessia_Reichert','Alessia Reichert','$2b$10$SGgVsb4aR0dt.al6Kuu6euMu0A.JjzEltdYS203YsE6hy7yRX8ZV2','Sandy_Zulauf-Fritsch@hotmail.com','member',45000,39,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID011','Marion_Nitzsche','Marion Nitzsche','$2b$10$WEYCHJztOMVqJfZoA44M8etCzHP8OvY/zzlHDCih3CN7/nwE0WIMC','Caroline_DuBuque@yahoo.com','member',96000,33,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID012','Arne_Bradtke','Arne Bradtke','$2b$10$/bfDjxYPw.FvDOgD25kkXe9koyAavydjevcS8j1xF66NWFQSaZYee','Nova20@gmail.com','producer',15000,17,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID013','Vida_Grant','Vida Grant','$2b$10$2LQ9zytbADmuhgkE4uQiduJCac9OYZ4q5ofLPI1MGo7L7ODVAWW5q','Tod_Hahn@gmail.com','musician',14000,17,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID014','Bertram_Kris','Bertram Kris','$2b$10$bbxd0jJ4UBmdlTE9P0uKZ.blU2SOoy9vYSactvY8oH9qCaD0.R0g2','Jamison.Buckridge@hotmail.com','member',18000,19,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID015','Mariah_Prohaska','Mariah Prohaska','$2b$10$/A3DoTtG8lAizIoCNONCD.YbKdjN4ARUQe/KRCcLqs797jdetsTMO','Bettye92@yahoo.com','producer',93000,10,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID016','Paolo_Crooks','Paolo Crooks','$2b$10$Dx/60VE45cujAAHwJngwMebLPstKuzwHx4cxsK7rduGnexTPU/LQ2','Chester72@yahoo.com','member',30000,24,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID017','Vincenza_Franey','Vincenza Franey','$2b$10$sO9IRGSgNTAVNa6nDySaMeiDAQ5Uj/ONVxVzT1I0diUNhFiuzcnYW','Eldridge.Collins76@gmail.com','musician',62000,44,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID018','Dorothea_Schaefer-Lueilwitz','Dorothea Schaefer-Lueilwitz','$2b$10$at/3uyzIBwcAQZjwjxW70eHaqaiGjwIjckKAE3xGTjEcErH1Cd8q2','Shakira.Kihn@gmail.com','producer',41000,25,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID019','Florida_Jaskolski','Florida Jaskolski','$2b$10$k..y9BHULx.KnH4Fve5n4OxeqxkIKqs0h5mmL4s8hNAxaguzgUipu','Evan.Schaden64@yahoo.com','musician',29000,49,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID020','Stanton_Cruickshank','Stanton Cruickshank','$2b$10$fWIkYV9m3AdDS1DDQ8gtf.HeQoH9/Y8hn9qXCfhBOZgRuCTH47zB6','Diego.Cassin@yahoo.com','member',16000,46,'2023-05-22 14:10:02','2023-05-22 14:10:02'),
('UID021','testUsername','testing name','$2b$10$lEl1hGe/SOCkHWVBiR1vFuKgndTOy/wEVvT.se6KzVBk/Zr4DU56K','user@gmail.com','member',0,0,'2023-05-22 14:37:04','2023-05-22 14:37:04');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
