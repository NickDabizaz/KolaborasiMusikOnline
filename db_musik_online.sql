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
('C001','P001','UID001','Inventore officiis eius facilis laboriosam consectetur debitis repudiandae impedit maxime.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C002','P002','UID002','Eum reiciendis sed dolor magni consequuntur debitis optio.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C003','P003','UID003','Non commodi illum iusto maxime.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C004','P004','UID004','Perferendis sed consequuntur inventore voluptatibus.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C005','P005','UID005','Aspernatur quibusdam minima molestias ut a expedita.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C006','P006','UID006','Iste libero quo tenetur optio veniam beatae fuga.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C007','P007','UID007','Dolorum ipsum voluptatum repudiandae quos facilis esse beatae eligendi.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C008','P008','UID008','Cupiditate sint occaecati sed iure dignissimos laboriosam maxime distinctio odio.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C009','P009','UID009','Nisi saepe amet vero quo adipisci labore consequuntur asperiores.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C010','P010','UID010','Nam voluptatibus placeat.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C011','P011','UID011','Culpa quod repellat voluptatem ratione ea ipsam saepe consectetur.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C012','P012','UID012','Nulla impedit porro iure ipsum.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C013','P013','UID013','Repellendus aut vero recusandae molestias.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C014','P014','UID014','Ullam cumque molestiae fugit quaerat eligendi quisquam quos.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C015','P015','UID015','Soluta deleniti perferendis consequuntur consequuntur occaecati optio a quaerat provident.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C016','P016','UID016','Animi dolorum sunt ducimus iusto.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C017','P017','UID017','Distinctio quod ut perspiciatis maiores cupiditate pariatur.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C018','P018','UID018','Ea est blanditiis vero delectus repellendus libero suscipit illo.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C019','P019','UID019','Sunt voluptas ipsa earum excepturi iure repellendus.','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('C020','P020','UID020','Enim consectetur fugiat labore.','2023-06-15 14:21:14','2023-06-15 14:21:14');

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
('M001','P001','UID001','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M002','P002','UID002','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M003','P003','UID003','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M004','P004','UID004','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M005','P005','UID005','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M006','P006','UID006','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M007','P007','UID007','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M008','P008','UID008','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M009','P009','UID009','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M010','P010','UID010','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M011','P011','UID011','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M012','P012','UID012','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M013','P013','UID013','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M014','P014','UID014','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M015','P015','UID015','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M016','P016','UID016','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M017','P017','UID017','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M018','P018','UID018','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M019','P019','UID019','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M020','P020','UID020','2023-06-15 14:21:14','2023-06-15 14:21:14');

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
('P001','libero aspernatur ab','Dicta dicta neque ullam.','/Applications/ouch_minor_brandish.vsw','UID001','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P002','quisquam eum illo','Aperiam libero error.','/sys/gloom_because_whether.spx','UID002','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P003','quisquam fugit doloribus','Corrupti cumque officia expedita porro itaque fugit debitis pariatur.','/proc/where.7z','UID003','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P004','veniam aliquid nulla','Velit ab mollitia nesciunt nemo.','/lost+found/keenly.opus','UID004','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P005','laborum praesentium consequatur','Praesentium ex similique consequatur molestias.','/Network/uh_huh.arc','UID005','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P006','ipsum harum illum','Doloribus animi voluptatibus.','/lib/unwelcome_blah.ppt','UID006','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P007','dolor tenetur quaerat','Commodi fugit aperiam iusto soluta.','/usr/sbin/provided_gamebird_rim.epub','UID007','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P008','in nulla fugiat','Mollitia totam ab inventore quidem.','/private/left_by_nicely.mpga','UID008','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P009','consequatur tenetur recusandae','At non officia porro voluptatum beatae reprehenderit rem.','/home/user/nearly_euphonium.midi','UID009','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P010','voluptates unde eos','Qui perferendis omnis earum id perspiciatis ullam nulla ullam.','/net/although.ics','UID010','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P011','tempora cumque repellendus','Nulla quasi laudantium.','/rescue/mysteriously_throughout_when.vss','UID011','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P012','repellat voluptate fugit','Accusamus doloribus id quae voluptatem vitae quibusdam dolores harum magni.','/opt/bin/incidentally.deb','UID012','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P013','inventore fugiat blanditiis','Corrupti earum modi aliquam nesciunt itaque porro excepturi ab.','/Users/finally_torso.dist','UID013','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P014','voluptate amet ipsum','Sapiente iure eveniet.','/usr/local/src/victoriously.doc','UID014','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P015','aliquid expedita iusto','Rem nesciunt nobis tempora consectetur necessitatibus doloribus aspernatur.','/usr/bin/once_hence.msm','UID015','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P016','adipisci culpa id','Saepe quisquam adipisci perspiciatis.','/sys/entire.avi','UID016','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P017','voluptates iste sint','Blanditiis tenetur nisi modi alias nam repudiandae soluta perferendis a.','/usr/local/bin/fearless_likewise.msm','UID017','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P018','possimus molestias nulla','Iure nesciunt non enim expedita temporibus eaque repellendus.','/System/spawn_upon.mpg','UID018','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P019','ex debitis eum','Tempore tempore magni minima iure saepe inventore.','/opt/bin/lest_once.msm','UID019','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('P020','consectetur eius nisi','Repudiandae praesentium corrupti impedit ipsa nesciunt rerum.','/root/double_dependency.spx','UID020','2023-06-15 14:21:14','2023-06-15 14:21:14');

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
('M001','P001','UID001','/sys/zowie_outside.vsd','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M002','P002','UID002','/usr/obj/divine_prosperity_thick.json','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M003','P003','UID003','/var/mail/trusting_safe_dispose.bmp','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M004','P004','UID004','/opt/include/aged_um.mp2','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M005','P005','UID005','/opt/include/readily.bpk','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M006','P006','UID006','/lost+found/meh_oddly_plus.mar','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M007','P007','UID007','/dev/jack_brr.webp','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M008','P008','UID008','/sbin/zowie.aac','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M009','P009','UID009','/lost+found/underestimate_whether_so.xlsx','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M010','P010','UID010','/tmp/now_like_loyal.rng','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M011','P011','UID011','/etc/ppp/even.ico','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M012','P012','UID012','/etc/mail/gah_oeuvre.3gp','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M013','P013','UID013','/usr/include/badly.tar','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M014','P014','UID014','/selinux/meh_order_oof.ico','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M015','P015','UID015','/dev/oof.wav','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M016','P016','UID016','/var/rudely.dll','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M017','P017','UID017','/etc/ppp/from.jpe','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M018','P018','UID018','/var/now_because.ini','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M019','P019','UID019','/root/psych_ignorant_excluding.gif','2023-06-15 14:21:14','2023-06-15 14:21:14'),
('M020','P020','UID020','/opt/include/ah.ini','2023-06-15 14:21:14','2023-06-15 14:21:14');

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
('UID001','Charlotte_Kshlerin-Parker','Charlotte Kshlerin-Parker','$2b$10$e7nHKf35O5EbKrLfx/7cbuRunuZEFUwP0wh7h51.adLKT9Redy9p.','Kayli.Purdy@hotmail.com','member',71000,39,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID002','Okey_Torphy','Okey Torphy','$2b$10$Un.dskWVsh354davMjN3nOvLBv1zpOKIerxC1t.oI1kDuOi1jarVq','Raquel_Rosenbaum78@yahoo.com','musisi',33000,40,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID003','Tyrell_Feil','Tyrell Feil','$2b$10$NMpXXbfdbASUN02fbVNgFu5CsyilWBFs45o3q8My6Ib0DriCPMQ4i','Lorine_Zemlak66@hotmail.com','musisi',28000,41,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID004','Domenica_Graham','Domenica Graham','$2b$10$/iWYSO6u7sXo/5rkQgBf5OHjSy92Yby2DR2HnMWhpGAqEIztNxglq','Jasmin.Jast@yahoo.com','musisi',84000,26,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID005','Juliana_Lowe','Juliana Lowe','$2b$10$wiCRPugqdNH/VhW59iQ/bOrMPfTmuNpQNxSk3r6h1nydkZv81.kve','Valentine_Reichert@hotmail.com','musisi',38000,27,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID006','Jennifer_Boehm','Jennifer Boehm','$2b$10$ShHvny1T0188U1OcLcErXuviFIgYzjw29A7XeNaVw2h3538P/WBN.','Ariel.Klein@gmail.com','musisi',74000,45,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID007','Margot_Zieme','Margot Zieme','$2b$10$TA/Luv/zC9h0a54wO4/Zuun0UmN1i9A.7teEZf2972H2hdqptnRn.','Aditya_Hilpert@yahoo.com','produser',14000,22,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID008','Glenda_Heathcote','Glenda Heathcote','$2b$10$SjEcPLdWyUBZm9GA1GoXwOyb66rL7/nYUn/HysuaIpkd23KV5qOaS','Jaylen5@hotmail.com','musisi',44000,49,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID009','Taryn_Walker','Taryn Walker','$2b$10$Zg/iMOdxs.GVcNNzdoA0.Oz0BENwDCrq2YABHTAK4/d7.lCWy4HJ2','Lillian.Abernathy@yahoo.com','musisi',48000,42,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID010','Muriel_Trantow','Muriel Trantow','$2b$10$t6WfKuNZDD7GE11E8gCRxO3vfC0IJ9inmbrEzm77sY8Wbof5pP6Gy','Hudson.Bogan@hotmail.com','produser',83000,22,'2023-06-15 14:21:13','2023-06-15 14:21:13'),
('UID011','Marquis_Bartell','Marquis Bartell','$2b$10$7PpQILrO7KHd1SciubnVjOzE83XlgQ8jfvI.lCWBx.ed.dRPanL7S','Renee_Muller@yahoo.com','member',50000,40,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID012','Paul_Zieme','Paul Zieme','$2b$10$bOcAfK/J068gzn7EwcLH5OybperAr2eUpkzrnXkdxcpMcUxyQmH1y','Bud_Steuber@hotmail.com','member',84000,32,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID013','Royal_Schaden','Royal Schaden','$2b$10$iZ3nqy4Bkm4v0sv/5oUwHu49uzTUas1JTqb1CSOT5rivJuno/QS5a','Isabella.Kemmer-Beier@hotmail.com','musisi',65000,16,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID014','Norval_Turcotte','Norval Turcotte','$2b$10$ppvZ4g9rkyrnxbuf1tYlc..a.6HjritZ4j8dwTpxgpDsgUvfUkApS','Delphia.Ortiz@hotmail.com','member',35000,13,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID015','Ethelyn_Heller','Ethelyn Heller','$2b$10$7bZKU.K7Yzxwl6KOqoGAFuF6BZ92hMp2/nJde96Cl2bRxvQMx20/i','Makayla.Ortiz@yahoo.com','member',47000,46,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID016','Camden_McCullough','Camden McCullough','$2b$10$AIre/VC8dMc9SUSviCIq8.vwyQjZ960CbD.LvPLfGaUM0ldjgLA8y','Vella31@hotmail.com','member',82000,25,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID017','Aniya_Kling-Schinner','Aniya Kling-Schinner','$2b$10$V9nOUuaXwgdBO1PqVYqGhei40gXjc/W9ZJy5vqofpqI4hHBgwsab6','Berenice.Bahringer@yahoo.com','produser',89000,34,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID018','Pietro_Tremblay-Ruecker','Pietro Tremblay-Ruecker','$2b$10$xPy.FawQnGs09ogZhH6yvuOxi.53hI4RMRV/zNJQAEyHXDtvnjBdG','Francis.Buckridge75@hotmail.com','musisi',75000,47,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID019','Lolita_Romaguera','Lolita Romaguera','$2b$10$ygccq0SYMvBxMfkbFiTZJOnRG.LYPkS.0TrCxxxuhVV/X3zQ2geNu','Toby.Stracke@gmail.com','produser',100000,25,'2023-06-15 14:21:14','2023-06-15 14:21:14'),
('UID020','Clint_Gibson-O\'Hara','Clint Gibson-O\'Hara','$2b$10$8yKoTkXG/.8a8epRMjnwoOoscLzyG/ixKOF5QItrja9dZPVi85Xom','Madaline.Jacobs91@yahoo.com','produser',86000,41,'2023-06-15 14:21:14','2023-06-15 14:21:14');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
