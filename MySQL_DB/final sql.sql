CREATE TABLE `total_list` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `imgsrc` varchar(2000) DEFAULT NULL,
  `recipe_tag` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `recipe_ingredient` (
  `idx_ing` int NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(100) DEFAULT NULL,
  `total_list_ID` int NOT NULL,
  PRIMARY KEY (`idx_ing`),
  KEY `fk_recipe_ingredient_total_list1_idx` (`total_list_ID`),
  CONSTRAINT `fk_recipe_ingredient_total_list1` FOREIGN KEY (`total_list_ID`) REFERENCES `total_list` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `recipe_cooking` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `cooking_order` varchar(500) DEFAULT NULL,
  `cooking_order_no` int DEFAULT NULL,
  `total_list_ID` int NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `fk_recipe_cooking_total_list_idx` (`total_list_ID`),
  CONSTRAINT `fk_recipe_cooking_total_list` FOREIGN KEY (`total_list_ID`) REFERENCES `total_list` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `user_detail_favfood` (
  `user_detail_temp` bigint NOT NULL,
  `favfood` varchar(255) DEFAULT NULL,
  KEY `FKlkvp390g614jttbic0npi1gny` (`user_detail_temp`),
  CONSTRAINT `FKlkvp390g614jttbic0npi1gny` FOREIGN KEY (`user_detail_temp`) REFERENCES `userdetail` (`temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `user_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `auth` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gnu0k8vv6ptioedbxbfsnan9g` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `user_list` (
  `id` int NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_pwd` varchar(45) DEFAULT NULL,
  `user_specification` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
CREATE TABLE `user_recipe_list` (
  `user_idx` int NOT NULL,
  `user_id` int NOT NULL,
  `recipe_idxl` int DEFAULT NULL,
  `recipe_rating` int DEFAULT NULL,
  `user_search` int DEFAULT NULL,
  PRIMARY KEY (`user_idx`),
  KEY `fk_user_recipe_list_user_list1_idx` (`user_id`),
  KEY `fk_user_recipe_list_recipe_cooking1_idx` (`recipe_idxl`),
  CONSTRAINT `fk_user_recipe_list_recipe_cooking1` FOREIGN KEY (`recipe_idxl`) REFERENCES `recipe_cooking` (`idx`),
  CONSTRAINT `fk_user_recipe_list_user_list1` FOREIGN KEY (`user_id`) REFERENCES `user_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `user_detail_foodtaste` (
  `user_detail_temp` bigint NOT NULL,
  `foodtaste` varchar(255) DEFAULT NULL,
  KEY `FK3xcmdpj24jpku3mv4cguubnux` (`user_detail_temp`),
  CONSTRAINT `FK3xcmdpj24jpku3mv4cguubnux` FOREIGN KEY (`user_detail_temp`) REFERENCES `userdetail` (`temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

