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
('C001','P001','UID001','Inventore dicta eligendi reiciendis consequatur eligendi quos accusamus.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C002','P002','UID002','Fugit libero inventore doloribus deleniti atque.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C003','P003','UID003','Esse accusantium quaerat eveniet.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C004','P004','UID004','Inventore inventore vel.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C005','P005','UID005','Eveniet porro aspernatur ad repudiandae.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C006','P006','UID006','Ab ullam ullam fugit.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C007','P007','UID007','Facere fugit facere.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C008','P008','UID008','Totam inventore repellat at.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C009','P009','UID009','Quia necessitatibus consequatur aut inventore perferendis illo illum.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C010','P010','UID010','Laudantium vel iste.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C011','P011','UID011','Quod aspernatur totam.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C012','P012','UID012','Saepe eum unde eveniet quaerat ab adipisci at reprehenderit.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C013','P013','UID013','Odit omnis ea pariatur tenetur adipisci ex rem officia.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C014','P014','UID014','Ullam rem consequatur suscipit earum ipsa rerum nobis voluptate.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C015','P015','UID015','Illo laboriosam voluptatem ex illum eius.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C016','P016','UID016','Enim aspernatur quasi.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C017','P017','UID017','Reiciendis veritatis magni minus quaerat explicabo.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C018','P018','UID018','At ratione odit quasi repudiandae quia.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C019','P019','UID019','Quibusdam debitis consectetur officiis ipsa tempore expedita possimus.','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('C020','P020','UID020','Repellat natus deserunt rerum.','2023-06-14 15:13:14','2023-06-14 15:13:14');

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
('M001','UID001','UID001','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M002','UID002','UID002','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M003','UID003','UID003','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M004','UID004','UID004','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M005','UID005','UID005','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M006','UID006','UID006','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M007','UID007','UID007','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M008','UID008','UID008','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M009','UID009','UID009','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M010','UID010','UID010','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M011','UID011','UID011','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M012','UID012','UID012','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M013','UID013','UID013','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M014','UID014','UID014','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M015','UID015','UID015','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M016','UID016','UID016','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M017','UID017','UID017','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M018','UID018','UID018','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M019','UID019','UID019','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M020','UID020','UID020','2023-06-14 15:13:14','2023-06-14 15:13:14');

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
('P001','asperiores nesciunt placeat','Aut nesciunt facilis iusto soluta minus dolor.','/var/yp/worth_sans_whenever.php','UID001','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P002','suscipit at quis','Sapiente vel incidunt quod corporis hic autem provident sapiente enim.','/opt/lib/yippee.bpk','UID002','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P003','magni nobis dolore','Cumque repellat cum eius.','/usr/yippee.3gpp','UID003','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P004','tempora harum velit','Eius illo consequuntur ducimus dolorum iste minus neque minima corporis.','/media/pish_though.bpk','UID004','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P005','sint nulla cumque','Dolorum eligendi repudiandae vel quisquam ratione.','/usr/X11R6/determined_lighthearted.msp','UID005','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P006','exercitationem nisi vitae','Excepturi sed placeat eaque placeat dolorem.','/opt/why_lined_astride.mpg','UID006','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P007','consectetur voluptatem nesciunt','Autem eaque excepturi delectus.','/bin/valuable.mpg','UID007','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P008','error nemo repellendus','Eos distinctio consectetur et voluptas beatae eius doloremque sed voluptas.','/proc/charming.distz','UID008','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P009','quod nobis sint','Ipsam blanditiis fuga quis dicta laborum porro vitae delectus.','/etc/namedb/outsmart.so','UID009','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P010','sapiente optio dignissimos','Explicabo ab fugit.','/var/yp/vogue_including_chubby.elc','UID010','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P011','error neque velit','Perspiciatis provident laudantium dignissimos alias.','/proc/failing_dynamics_eek.dms','UID011','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P012','aspernatur dolores provident','Doloribus esse blanditiis est doloremque.','/srv/suspicious_interestingly_exposure.mp4','UID012','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P013','numquam quisquam sit','Quia et delectus suscipit incidunt necessitatibus voluptas id quis.','/opt/share/whose_shoddy.msp','UID013','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P014','molestiae voluptate atque','Veritatis repellendus eligendi consequuntur recusandae officiis suscipit.','/home/user/crossly.xla','UID014','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P015','reprehenderit assumenda quod','Animi nemo molestiae expedita voluptates suscipit doloribus.','/sys/that.opus','UID015','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P016','doloribus deserunt repudiandae','Quidem voluptates unde tempora quaerat.','/net/furthermore.xht','UID016','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P017','facilis veniam fugiat','Sint porro odit debitis sequi praesentium.','/usr/sbin/lean_boycott.rar','UID017','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P018','vel odit exercitationem','Magnam voluptas ipsum nihil consequuntur.','/etc/defaults/to_geez.php','UID018','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P019','consequatur debitis consequuntur','Sit ipsum quae eaque dolore.','/opt/share/since.ear','UID019','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('P020','minus possimus atque','Neque quos officiis exercitationem ut laboriosam dolorum.','/mnt/grill_arrive.mp2','UID020','2023-06-14 15:13:14','2023-06-14 15:13:14');

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
('M001','P001','UID001','/var/tmp/amongst.odt','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M002','P002','UID002','/usr/X11R6/syringe_grouchy_spanish.wav','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M003','P003','UID003','/dev/backbone_pronounce_ick.tar','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M004','P004','UID004','/rescue/pesky.xsl','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M005','P005','UID005','/Users/sunday_follow_notwithstanding.dms','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M006','P006','UID006','/home/user/when_nor.pot','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M007','P007','UID007','/net/during_phew.bmp','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M008','P008','UID008','/opt/include/hmph_reluctantly.mpe','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M009','P009','UID009','/usr/obj/catalyst_because_fooey.deploy','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M010','P010','UID010','/etc/namedb/thoughtfully.svgz','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M011','P011','UID011','/usr/ports/solemnly_unnaturally_survival.zip','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M012','P012','UID012','/sbin/madly.mar','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M013','P013','UID013','/net/tendency_excepting_anti.mpg','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M014','P014','UID014','/opt/sbin/concerned_tightly.xhtml','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M015','P015','UID015','/etc/defaults/until.jar','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M016','P016','UID016','/etc/mail/cadge.ts','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M017','P017','UID017','/media/shanghai.war','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M018','P018','UID018','/usr/sbin/groom.deb','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M019','P019','UID019','/var/log/upper_warmly_anti.gif','2023-06-14 15:13:14','2023-06-14 15:13:14'),
('M020','P020','UID020','/home/user/dir/until.dms','2023-06-14 15:13:14','2023-06-14 15:13:14');

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
('UID001','Corbin_Erdman','Corbin Erdman','$2b$10$UQOFP83bRZgOL3Ucggkoae78you.j7FFeJ6b.ZwXUdgiSMpCEriT2','Freda_Orn56@yahoo.com','produser',30000,46,'2023-06-14 15:13:13','2023-06-14 15:13:13'),
('UID002','Dulce_Stoltenberg','Dulce Stoltenberg','$2b$10$tf4y4xBOaUSlmy1mLVw7jOj9XiRzA0L4MkUrkihvyCe0eTPbzeNXa','Laisha_Lesch@yahoo.com','musisi',34000,20,'2023-06-14 15:13:13','2023-06-14 15:13:13'),
('UID003','Benton_Hudson','Benton Hudson','$2b$10$KRavaI1bJx3jQHxu98/lD.ERiKEqIclsMxuAxic46VGrNhjGPG4ye','Barry14@gmail.com','produser',24000,41,'2023-06-14 15:13:13','2023-06-14 15:13:13'),
('UID004','Joshuah_Pouros','Joshuah Pouros','$2b$10$T9.Jq1rvBd2BJiO.bitbsOSH3jmWvmkXLQHRbsC4GFQHI9qqIOs7i','Antonietta_Block@hotmail.com','produser',11000,49,'2023-06-14 15:13:13','2023-06-14 15:13:13'),
('UID005','Maria_Flatley','Maria Flatley','$2b$10$0dWr4s2bbBmU8NZ67jo4gO8ME//0cKJDRVIgsBsD1I9ryb.DJG9yW','Aletha90@gmail.com','produser',85000,43,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID006','Eddie_Bauch','Eddie Bauch','$2b$10$VslpITGRRdOf3XArp61meeMNVHvBdUwjBZJdJLNPEd.Oh5RGr3./K','Lisandro.Wiza51@yahoo.com','member',74000,11,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID007','Noemie_O\'Conner','Noemie O\'Conner','$2b$10$ItQ/q0a8jnz6iGb0lYvQ7OoFYLTwEvo2FUIeQmOg6wZyjTMkz6YGK','Monique_Hand@yahoo.com','produser',19000,39,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID008','Kale_Hirthe','Kale Hirthe','$2b$10$tZbIF6WQ/8FevTdcoQJ5NOHoibxo3n9lJ6u4Wh8HDdXoNi0iASvz.','Tremaine18@hotmail.com','musisi',74000,17,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID009','Ollie_Aufderhar','Ollie Aufderhar','$2b$10$UDD2RnKkW98CKeU4pXaik.zZq.8zsfDGNCZExh65UvzTV2xFcubRi','Matt31@yahoo.com','musisi',42000,11,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID010','Issac_Marquardt','Issac Marquardt','$2b$10$EzLv7v4vnRCQJD9jbYm8.OtAanML9H.azoHMzpJ.q7KCpWm/gkUFe','Monte.Leuschke17@gmail.com','member',7000,16,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID011','Romaine_Hackett','Romaine Hackett','$2b$10$WFCa927iNWbqfChCopODNeOEYW/2DDE8j7XtB727RuaJBylf4qyZK','Daphne_Brown17@hotmail.com','member',14000,40,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID012','Hollie_Mayert','Hollie Mayert','$2b$10$NLPBCTS6p8XThQ6.BQrmS.psycjHZOUM4IcipBes98N7NBRBxcyqK','Garfield_Paucek96@yahoo.com','produser',56000,27,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID013','Teagan_Deckow','Teagan Deckow','$2b$10$nemaTStrSL9VuUq.KcNpm.vbIDY5DUjU.gRxykWbIANAKfM56rR2W','Samanta_Feil-Willms81@yahoo.com','musisi',63000,28,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID014','Adelle_Hartmann','Adelle Hartmann','$2b$10$MjwnFPQecoD1HX8KYoHEvuISExrc9DjXfezIpYpvt6TgZpQpEAcpK','Hazel_Ritchie@hotmail.com','produser',51000,16,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID015','Camilla_Oberbrunner','Camilla Oberbrunner','$2b$10$SzbW4NRVW8Q8TZQ9Ifkpk.RVJh3s5kXRl3V3Qur6BqHGCQEozmASq','Keara21@yahoo.com','member',35000,21,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID016','Abelardo_Gutkowski','Abelardo Gutkowski','$2b$10$4aK37WD4dVbNgkRW02FoC.4Ca1DIQPBnVdeA6CFzZfnhPAM2/Wj0K','Elna.Von@gmail.com','produser',2000,38,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID017','Sterling_Swaniawski','Sterling Swaniawski','$2b$10$uQbXb8/XDg3pkOfS./5lWO9uHo8VKNxzQua0pGm6vrYSOMzjs67Aa','Korbin88@hotmail.com','produser',90000,18,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID018','Shanie_Pacocha','Shanie Pacocha','$2b$10$LIWB3KuD/zQaaXOasIZSUOgn8VxNkSoz44tIkww3XgVdw7/gdrGh.','Delpha_Bogisich55@gmail.com','member',51000,31,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID019','Anika_Connelly','Anika Connelly','$2b$10$.ZPP47kRvblgSdwnbvXG6euSMJt9sonDcDgffNuA8w0ti4txciUru','Ena_Lemke@gmail.com','musisi',14000,22,'2023-06-14 15:13:14','2023-06-14 15:13:14'),
('UID020','Aniya_Crist','Aniya Crist','$2b$10$wzeLUR1j6wRia.6px6u2zOHTunXqzo0ihSbrmBnJtQQh29YjtjNlq','Tad.Hahn@yahoo.com','member',79000,35,'2023-06-14 15:13:14','2023-06-14 15:13:14');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
