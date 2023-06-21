

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


insert  into `comments`(`comment_id`,`project_id`,`commenter_id`,`comment`,`createdAt`,`updatedAt`) values 
('C001','P001','UID001','Exercitationem consequuntur blanditiis porro nostrum consectetur.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C002','P002','UID002','Optio alias hic repudiandae voluptatibus aspernatur explicabo dolor.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C003','P003','UID003','Aliquid ut consectetur.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C004','P004','UID004','Ipsam labore necessitatibus doloribus quod architecto voluptatem quasi provident.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C005','P005','UID005','Corporis nulla consectetur natus.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C006','P006','UID006','Suscipit itaque quisquam ad.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C007','P007','UID007','Soluta adipisci sit ratione minus unde asperiores.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C008','P008','UID008','Inventore sunt amet reprehenderit fugiat impedit dolores eos doloribus.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C009','P009','UID009','Quidem alias a at.','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('C010','P010','UID010','Nam animi quos.','2023-06-21 05:41:46','2023-06-21 05:41:46');


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


insert  into `project_members`(`project_member_id`,`project_id`,`musician_id`,`createdAt`,`updatedAt`) values 
('M001','P001','UID001','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M002','P002','UID002','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M003','P003','UID003','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M004','P004','UID004','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M005','P005','UID005','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M006','P006','UID006','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M007','P007','UID007','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M008','P008','UID008','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M009','P009','UID009','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('M010','P010','UID010','2023-06-21 05:41:46','2023-06-21 05:41:46');


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


insert  into `projects`(`project_id`,`title`,`description`,`producer_id`,`createdAt`,`updatedAt`) values 
('P001','quas doloremque itaque','Occaecati iste impedit quos temporibus.','UID001','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P002','eos eveniet quam','Corporis ratione dicta quia quidem error aut architecto aliquid.','UID002','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P003','repellendus ut officia','Veniam debitis nemo eum.','UID003','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P004','placeat modi nihil','Ratione voluptatum et deserunt suscipit illo quos veritatis.','UID004','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P005','quos delectus dolorum','Qui delectus error veritatis omnis corrupti itaque aliquid quaerat quis.','UID005','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P006','exercitationem illo minus','Mollitia iure magnam.','UID006','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P007','molestiae dicta ducimus','Consequatur magni harum animi veritatis inventore aut minima.','UID007','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P008','fugiat nihil porro','Facere omnis ipsa id voluptatibus ab voluptas voluptates quod.','UID008','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P009','dolorum minus enim','Et similique nesciunt reiciendis.','UID009','2023-06-21 05:41:45','2023-06-21 05:41:45'),
('P010','at odio eligendi','Perspiciatis esse eum quae eos inventore itaque.','UID010','2023-06-21 05:41:45','2023-06-21 05:41:45');


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


insert  into `recordings`(`recording_id`,`project_id`,`musician_id`,`title`,`song_url`,`createdAt`,`updatedAt`) values 
('R001','P001','UID001','Velit in debitis.','https://picsum.photos/seed/gZxnKYOV/640/480','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R002','P002','UID002','Praesentium quasi reiciendis.','https://picsum.photos/seed/9p2ejImcJ/640/480','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R003','P003','UID003','Rerum tenetur explicabo.','https://loremflickr.com/640/480?lock=4778077708091392','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R004','P004','UID004','Reiciendis vero illum.','https://loremflickr.com/640/480?lock=322360865456128','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R005','P005','UID005','Molestias beatae doloremque.','https://loremflickr.com/640/480?lock=2359568808017920','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R006','P006','UID006','Temporibus molestiae exercitationem.','https://loremflickr.com/640/480?lock=6137537760329728','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R007','P007','UID007','Temporibus officia placeat.','https://loremflickr.com/640/480?lock=7435990931079168','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R008','P008','UID008','Expedita reiciendis nesciunt.','https://picsum.photos/seed/cWmRox/640/480','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R009','P009','UID009','Nam a repudiandae.','https://picsum.photos/seed/R3hOV1GoI/640/480','2023-06-21 05:41:46','2023-06-21 05:41:46'),
('R010','P010','UID010','Maiores voluptates tenetur.','https://loremflickr.com/640/480?lock=5666875786657792','2023-06-21 05:41:46','2023-06-21 05:41:46');


DROP TABLE IF EXISTS `sequelizemeta`;

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


insert  into `sequelizemeta`(`name`) values 
('20230520130137-create-user.js'),
('20230520131344-create-project.js'),
('20230520131506-create-project-member.js'),
('20230520131547-create-recording.js'),
('20230520131606-create-comment.js');


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


insert  into `users`(`user_id`,`username`,`name`,`password`,`email`,`role`,`balance`,`api_hit`,`createdAt`,`updatedAt`) values 
('UID001','Walton_Bradtke','Walton Bradtke','$2b$10$.fy2GnPTSkDwlhcf50bojOE9v3pCUCXCdqO1qqTmDWALxu9N6h2R2','Tyrell_Cormier54@hotmail.com','produser',30000,15,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID002','Raina_Hickle','Raina Hickle','$2b$10$YRgvCZ7tWd6s8SgBfqXifunjiMOvkSpH4LhcdcN8byxPpOeSfzuAC','Maddison72@hotmail.com','produser',79000,29,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID003','Madison_Bergstrom','Madison Bergstrom','$2b$10$BzPpYJW/6rOb3IL2TEo1AOgIxnK/axHPJxBHeGyz3uywUuXG3xJRa','Rupert_Armstrong@gmail.com','musisi',28000,12,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID004','Austyn_Upton','Austyn Upton','$2b$10$Wi/vgGms2gccz9pv6f29pO6bNrASwZ77EfrRCGO68lCPIDASqSJoi','Drew.Funk@hotmail.com','member',23000,41,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID005','Shea_Kutch','Shea Kutch','$2b$10$Pdl2l1wMXRd47uEBhbKxiORMs6hyGT4vD6u3ff0RCzrGDkjXLov.e','Mortimer55@hotmail.com','produser',53000,33,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID006','Mekhi_Haley','Mekhi Haley','$2b$10$WyVsrAI4bJsDvSYZT53l..og/0FvZSq5aFZMToq6uzXRVm6j3doBy','Eileen_Kirlin@yahoo.com','member',31000,27,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID007','Vella_Hilpert','Vella Hilpert','$2b$10$45CmzimV0bI4EyhG/dfiSuvzdSCz1BabD2ZpDLRh8Ptr.DTQvw0me','Hillary_Johnston20@hotmail.com','musisi',73000,19,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID008','Esperanza_Hamill','Esperanza Hamill','$2b$10$m.ZESeT9Gh4F6q36gDPJKOY7.7CZp7B0MJB3BFVd6zQ.GqCznPBh2','Tressa_Bartell@gmail.com','member',34000,50,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID009','Trey_Treutel','Trey Treutel','$2b$10$SZ2OYaSbcrrlJwSxpYofmeN22pXvCVaEfUU0..s1LmjwXk1MFzlaa','Milan_Labadie86@yahoo.com','musisi',65000,44,'2023-06-21 05:41:45','2023-06-21 05:41:45'),
('UID010','Danial_Reichel','Danial Reichel','$2b$10$SKZKbDhlj/f.ZRjJBEmPVOQvRGKzXxaHQQjyc8/hDqQXRuZcIK/zm','Lisa.Hackett-Cole50@gmail.com','produser',74000,12,'2023-06-21 05:41:45','2023-06-21 05:41:45');

