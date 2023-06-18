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
('C001','P001','UID001','Maiores fuga rem.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C002','P002','UID002','Distinctio illo totam reiciendis doloremque eligendi ea occaecati fuga.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C003','P003','UID003','Delectus eum ut consequatur similique quis eaque neque distinctio aut.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C004','P004','UID004','Quisquam rem est porro eum.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C005','P005','UID005','Impedit eveniet repellat in exercitationem omnis repudiandae eaque.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C006','P006','UID006','Earum tenetur ad.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C007','P007','UID007','Excepturi tenetur perspiciatis architecto ad suscipit dolorum quam.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C008','P008','UID008','Mollitia vel illum dolor pariatur repudiandae aliquam laboriosam consectetur est.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C009','P009','UID009','Commodi id at dolore rerum tempore facere expedita.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C010','P010','UID010','Debitis ipsa corporis maxime omnis.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C011','P011','UID011','Fuga nesciunt fugiat fugit est adipisci.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C012','P012','UID012','Odit aliquid rem mollitia quidem hic adipisci.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C013','P013','UID013','Magni suscipit rem delectus fugit esse consectetur beatae delectus.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C014','P014','UID014','Eaque facere corporis maiores fugit nulla nulla odio perspiciatis.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C015','P015','UID015','Optio doloribus voluptatem veritatis.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C016','P016','UID016','Id veniam tenetur placeat.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C017','P017','UID017','Iusto voluptate consectetur iste magni et.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C018','P018','UID018','Recusandae animi facere excepturi optio perferendis accusantium eligendi adipisci.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C019','P019','UID019','Laborum expedita eveniet esse illo autem.','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('C020','P020','UID020','Excepturi quas omnis facilis placeat doloribus alias nostrum sint.','2023-06-18 13:11:27','2023-06-18 13:11:27');

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
('M001','P001','UID001','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M002','P002','UID002','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M003','P003','UID003','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M004','P004','UID004','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M005','P005','UID005','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M006','P006','UID006','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M007','P007','UID007','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M008','P008','UID008','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M009','P009','UID009','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M010','P010','UID010','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M011','P011','UID011','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M012','P012','UID012','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M013','P013','UID013','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M014','P014','UID014','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M015','P015','UID015','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M016','P016','UID016','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M017','P017','UID017','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M018','P018','UID018','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M019','P019','UID019','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('M020','P020','UID020','2023-06-18 13:11:27','2023-06-18 13:11:27');

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `project_id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `producer_id` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `producer_id` (`producer_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `projects` */

insert  into `projects`(`project_id`,`title`,`description`,`poster_path`,`producer_id`,`createdAt`,`updatedAt`) values 
('P001','accusantium quisquam vel','Earum aperiam optio repudiandae qui ipsam consequuntur quis similique laboriosam.','/opt/share/an_desegregate.xhtml','UID001','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P002','quod repudiandae exercitationem','Quam numquam tempora itaque beatae mollitia amet.','/selinux/liner_canonize_sharply.js','UID002','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P003','eaque ipsam delectus','A amet asperiores quis magni rem iure laborum hic.','/var/tmp/pro.csv','UID003','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P004','libero quisquam deleniti','Consectetur eaque saepe cum consequatur expedita veniam.','/selinux/optimistically.msp','UID004','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P005','incidunt cumque sed','Sed nihil hic facere laudantium inventore sequi quam.','/opt/bin/dependable.3g2','UID005','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P006','illo voluptatibus ipsam','Quaerat est distinctio vero soluta deleniti velit.','/lost+found/discrete.woff','UID006','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P007','beatae saepe sequi','Accusantium nisi adipisci alias libero iusto error.','/etc/defaults/beetle_slim.rar','UID007','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P008','rerum atque ducimus','Placeat reprehenderit eligendi aspernatur fugiat facere.','/usr/src/miserably_often.mpkg','UID008','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P009','repudiandae eaque magnam','Magnam incidunt vel minus explicabo.','/sbin/geez_amongst_voluntarily.bz','UID009','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P010','fugiat consectetur corporis','Eveniet necessitatibus eaque totam totam.','/System/because_graceful.ogx','UID010','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P011','vero ipsum atque','Placeat assumenda quisquam temporibus laboriosam maxime esse laboriosam.','/sys/tightly_painfully_icing.png','UID011','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P012','porro optio ex','Totam eligendi cum voluptatum.','/usr/bin/arrogance.conf','UID012','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P013','accusamus mollitia eum','Quos deleniti sunt impedit labore fuga.','/etc/namedb/since_heavily_however.aac','UID013','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P014','repellat similique inventore','Ut laborum sint nobis voluptatem.','/opt/share/helplessly.xml','UID014','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P015','necessitatibus iste ipsa','Asperiores beatae sit incidunt amet laboriosam molestiae doloribus necessitatibus ducimus.','/usr/sbin/clamor.woff','UID015','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P016','qui sequi magni','Harum autem eaque tempore nam optio qui quam asperiores placeat.','/bin/wetly_up_halloo.mp4v','UID016','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P017','veniam iste illo','Eveniet dolorum facere et natus occaecati quo at dicta.','/Users/though.dump','UID017','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P018','doloribus nulla quos','Doloribus explicabo recusandae in nulla.','/opt/include/following_correspondent_dim.jpe','UID018','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P019','omnis doloribus aut','Sed molestias ad velit.','/usr/include/talkative.svgz','UID019','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('P020','repudiandae inventore distinctio','Adipisci soluta totam.','/usr/libexec/considering.php','UID020','2023-06-18 13:11:27','2023-06-18 13:11:27');

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
('R001','P001','UID001','Error voluptas impedit.','https://loremflickr.com/640/480?lock=4103528603713536','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R002','P002','UID002','Magni dolor occaecati.','https://picsum.photos/seed/frbv4847n/640/480','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R003','P003','UID003','Perferendis nobis illum.','https://picsum.photos/seed/sKv3sqy7nm/640/480','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R004','P004','UID004','Exercitationem accusamus eligendi.','https://loremflickr.com/640/480?lock=4992523200102400','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R005','P005','UID005','Doloribus quaerat ut.','https://loremflickr.com/640/480?lock=82250068656128','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R006','P006','UID006','Sed ipsum rerum.','https://loremflickr.com/640/480?lock=4114417295818752','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R007','P007','UID007','Magnam voluptatibus omnis.','https://picsum.photos/seed/nKpumz8twf/640/480','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R008','P008','UID008','Porro magnam voluptatibus.','https://loremflickr.com/640/480?lock=397149644783616','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R009','P009','UID009','Sequi commodi beatae.','https://loremflickr.com/640/480?lock=4565351377403904','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R010','P010','UID010','Sit numquam voluptatem.','https://picsum.photos/seed/AwcVvGgY/640/480','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R011','P011','UID011','Ut saepe cumque.','https://picsum.photos/seed/rmPE57mh/640/480','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R012','P012','UID012','Praesentium alias ipsum.','https://picsum.photos/seed/TkZVa3hE/640/480','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R013','P013','UID013','Et eum doloribus.','https://loremflickr.com/640/480?lock=2708701408395264','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R014','P014','UID014','Voluptates nam aliquam.','https://loremflickr.com/640/480?lock=45391491891200','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R015','P015','UID015','Possimus ab maiores.','https://loremflickr.com/640/480?lock=5182616965742592','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R016','P016','UID016','Totam maiores blanditiis.','https://picsum.photos/seed/9aeZbt/640/480','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R017','P017','UID017','Aspernatur tempora labore.','https://loremflickr.com/640/480?lock=5594402554642432','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R018','P018','UID018','Aliquam voluptatibus suscipit.','https://loremflickr.com/640/480?lock=7504638060265472','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R019','P019','UID019','Fugit fugit exercitationem.','https://loremflickr.com/640/480?lock=4183570667012096','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R020','P020','UID020','Nostrum quia aut.','https://loremflickr.com/640/480?lock=8501393774084096','2023-06-18 13:11:27','2023-06-18 13:11:27'),
('R021','P001','UID021','L O V E (Glee Cast Version)','spotify:track:7A0Kl9wHea0K2jsca8Bnxl','2023-06-18 13:17:11','2023-06-18 13:17:11'),
('R022','P001','UID021','L-O-V-E','spotify:track:6ECalYyYyO2cnFGWuWSDpy','2023-06-18 13:17:18','2023-06-18 13:17:18'),
('R023','P001','UID021','Perfect','spotify:track:0tgVpDi06FyKpA1z0VMD4v','2023-06-18 13:17:32','2023-06-18 13:17:32'),
('R024','P001','UID021','Love Yourself','spotify:track:50kpGaPAhYJ3sGmk6vplg0','2023-06-18 13:19:08','2023-06-18 13:19:08'),
('R025','P001','UID021','Love Yourself','https://open.spotify.com/intl-id/track/50kpGaPAhYJ3sGmk6vplg0','2023-06-18 13:26:36','2023-06-18 13:26:36');

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
('UID001','Lucienne_Hoeger','Lucienne Hoeger','$2b$10$ElR.qNacEsQ3D2fzl9YwLOJRYSMMUQ/fGgHNpbMGMNgNH/KZr/kU2','Bryana14@yahoo.com','produser',12000,12,'2023-06-18 13:11:26','2023-06-18 13:11:26'),
('UID002','Geovanni_Hegmann-Corwin','Geovanni Hegmann-Corwin','$2b$10$DHPmieW/BZ32bUdL7CGfDuVCI82vU49SNYDriefhcEec4FOslbvGy','Reymundo_Turner@hotmail.com','produser',78000,40,'2023-06-18 13:11:26','2023-06-18 13:11:26'),
('UID003','Erik_Christiansen','Erik Christiansen','$2b$10$16ANRsAxHBe7oszwYNRQL.in66uACRu9qcoLRp7zNJp4iV./s1RSO','Berniece38@hotmail.com','member',78000,12,'2023-06-18 13:11:26','2023-06-18 13:11:26'),
('UID004','Elsie_Howe','Elsie Howe','$2b$10$7Dq1w6bfy1NOUGuu7pzESuFgXdfQ2T.irO3QRP.YE4wbvM8AzCZ5y','Phyllis_Stroman25@yahoo.com','member',61000,45,'2023-06-18 13:11:26','2023-06-18 13:11:26'),
('UID005','Greg_Barton','Greg Barton','$2b$10$yBk4JMNwYgWld6G6KO8jQ.BS6kj7nDEB21ooBXXPkNVGu34mD62YO','Ellie.Kilback53@yahoo.com','produser',31000,10,'2023-06-18 13:11:26','2023-06-18 13:11:26'),
('UID006','Roscoe_Medhurst','Roscoe Medhurst','$2b$10$o2EYDjXgNs4kc373P/07a.aGY9B84ztyNQc81vYm01fEXYoJpKdVa','Macie_Wolff@hotmail.com','musisi',19000,19,'2023-06-18 13:11:26','2023-06-18 13:11:26'),
('UID007','Tianna_Crona','Tianna Crona','$2b$10$tQrbxosDvB8G6ckQ5LPJ4ebO3tT.VtUCm06iIFoCyQRUjuElkJEuO','Ona.Herzog13@hotmail.com','member',45000,33,'2023-06-18 13:11:26','2023-06-18 13:11:26'),
('UID008','Clarabelle_Goldner','Clarabelle Goldner','$2b$10$4EpbmFM96vJ7crkNL3ro9uYNlRfAl/TWYvB7HjPCJu.B/HM6CzoA.','Onie29@yahoo.com','produser',93000,14,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID009','Kristian_Kris','Kristian Kris','$2b$10$rtDhjoqPPsRBRnQk4hJTiOjbx7PxHPC6Odsi/V0WcgGOoNYdDJGIi','Kayden.Zboncak@yahoo.com','musisi',7000,21,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID010','Devante_Friesen','Devante Friesen','$2b$10$dW6CSzEF87oyiswElQA2CONni4e/e7HuGJx6vKp7TNZFT4fmS/s6q','Eleanora.Beier59@yahoo.com','member',57000,14,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID011','Lilian_Wolf-Emmerich','Lilian Wolf-Emmerich','$2b$10$XUzXbKa.C7IhY.FfvVIB4OHRTvrcP2PTQ/.Wtt4lj6WxUisBGbXRu','Rosalind.Lind@gmail.com','member',80000,22,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID012','Ayana_Metz','Ayana Metz','$2b$10$efta0ATO7NQ3IXkqI30trOnZ01u9sfSelmSC/iOsZfIvUZo2SnxlG','Delpha74@gmail.com','member',69000,29,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID013','Nova_Gislason','Nova Gislason','$2b$10$XA1KWyQiVzwbukosJ7YBIOes/vdKfnr4YABqOlbR.AS6BtBJFu6T2','Adah14@gmail.com','member',10000,24,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID014','Andres_Schulist','Andres Schulist','$2b$10$nA6ieYL0CsRW0CagNdrvTuDVygMrKgmr8tJNZRJp3so9K46HQZowu','Dejuan61@hotmail.com','musisi',22000,28,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID015','Kay_Turcotte','Kay Turcotte','$2b$10$4jga9DqKEoYk1IJAiHJDt.cGS5USIoNEA9kJnMoVU5OE2wKr9i.tO','Domenic.Beahan92@hotmail.com','produser',89000,18,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID016','Earlene_Hane','Earlene Hane','$2b$10$xvOiBBke5q.egalnuVpokuMaqiQVi9cCFd0E4b.tT9D3Tiv7NArpi','Eino33@yahoo.com','member',85000,19,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID017','Dominique_Bode','Dominique Bode','$2b$10$wSoAtu8YCJMWLHnRVgdNGO0SHCtsP4NXTQf3bhz3z04qkPobnxqa.','Vivian93@gmail.com','musisi',31000,33,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID018','Jaron_Dicki','Jaron Dicki','$2b$10$cpfk0UvnukDuu8qcwauLNOqh731nlzRV7CQ0XKTS4XWpIkgFy2mmu','Makenna2@yahoo.com','musisi',88000,36,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID019','Chester_Schinner','Chester Schinner','$2b$10$w/rbI2goWVKlV9wMtcRoA.NqHAPkNZv4JhDcNIMb8BnaNnZjyFzai','Ezekiel67@hotmail.com','member',56000,16,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID020','Nasir_Gutkowski','Nasir Gutkowski','$2b$10$EgRKNsI3PCLUh1Ri0/5WWOGG/IY/iMt8zcRkH1QLuO1rcNhlxQJ0a','Rafaela52@hotmail.com','produser',4000,38,'2023-06-18 13:11:27','2023-06-18 13:11:27'),
('UID021','testMusisi','user musisi','$2b$10$swcuGEDPL06H5AkCbz6tx.eAeje8ykiDv0tuog31cOaK7GJdsK2vC','user@gmail.com','musisi',0,0,'2023-06-18 13:12:19','2023-06-18 13:12:30');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
