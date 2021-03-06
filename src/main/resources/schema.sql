CREATE TABLE `components` (
  `componet_id` int NOT NULL AUTO_INCREMENT,
  `component_value` varchar(225) NOT NULL,
  `component_description` blob NOT NULL,
  PRIMARY KEY (`componet_id`)
);

CREATE TABLE `component_vendor_details` (
  `component_vendor_detail_id` int NOT NULL AUTO_INCREMENT,
  `componet_id` int NOT NULL,
  `manufacturer_part_number` varchar(225) NOT NULL,
  `manufacturer` varchar(225) NOT NULL,
  `vendor_part_number` varchar(225) NOT NULL,
  `vendor` varchar(225) NOT NULL,
  `cost_per_unit` varchar(225) NOT NULL,
  `cost_per_hundred_units` varchar(225) NOT NULL,
  `cost_per_thousand_units` varchar(225) NOT NULL,
  PRIMARY KEY (`component_vendor_detail_id`),
  KEY `component_vendor_details_fk1_idx` (`componet_id`),
  CONSTRAINT `component_vendor_details_fk1` FOREIGN KEY (`componet_id`) REFERENCES `components` (`componet_id`) ON DELETE CASCADE
);

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`)
);

CREATE TABLE `product_version` (
  `product_version_id` int NOT NULL AUTO_INCREMENT,
  `version_number` varchar(225) NOT NULL,
  `timestamp` datetime NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`product_version_id`),
  KEY `product_version_fk1_idx` (`product_id`),
  CONSTRAINT `product_version_fk1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
);

CREATE TABLE `product_components` (
  `product_component_id` int NOT NULL AUTO_INCREMENT,
  `reference_id` varchar(225) NOT NULL,
  `product_version_id` int NOT NULL,
  `componet_id` int NOT NULL,
  PRIMARY KEY (`product_component_id`),
  KEY `product_components_fk1_idx` (`product_version_id`),
  KEY `product_components_fk2_idx` (`componet_id`),
  CONSTRAINT `product_components_fk1` FOREIGN KEY (`product_version_id`) REFERENCES `product_version` (`product_version_id`) ON DELETE CASCADE,
  CONSTRAINT `product_components_fk2` FOREIGN KEY (`componet_id`) REFERENCES `components` (`componet_id`) ON DELETE CASCADE
);

CREATE TABLE `version_files` (
  `version_file_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(225) NOT NULL,
  `file_extension` varchar(225) DEFAULT NULL,
  `product_version_id` int NOT NULL,
  PRIMARY KEY (`version_file_id`),
  KEY `version_files_fk1_idx` (`product_version_id`),
  CONSTRAINT `version_files_fk1` FOREIGN KEY (`product_version_id`) REFERENCES `product_version` (`product_version_id`) ON DELETE CASCADE
);

CREATE TABLE `user_details` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

INSERT INTO `user_details` (`user_id`, `email`, `password`) VALUES ('1', 'admin@grydsense.com', '$2a$10$DwqOtk0ug7Scezi0Jt29yOfyd5d9QzmVEL8XhwYSue.7HNc38Abm.');

CREATE TABLE `purchase_vendors` (
  `purchase_vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(225) NOT NULL,
  PRIMARY KEY (`purchase_vendor_id`),
  UNIQUE KEY `vendor_name_UNIQUE` (`vendor_name`)
);

CREATE TABLE `sell_order_details` (
  `sell_order_detail_id` varchar(225) NOT NULL,
  `company_name` varchar(225) NOT NULL,
  `company_address` varchar(225) NOT NULL,
  `sell_order_date` datetime NOT NULL,
  PRIMARY KEY (`sell_order_detail_id`)
);

CREATE TABLE `sell_order_product_details` (
  `sell_order_product_detail_id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `sell_order_detail_id` varchar(225) NOT NULL,
  `purchase_history_id` int NOT NULL,
  PRIMARY KEY (`sell_order_product_detail_id`),
  KEY `sell_order_product_details_fk1_idx` (`sell_order_detail_id`),
  KEY `sell_order_product_details_fk2_idx` (`purchase_history_id`),
  CONSTRAINT `sell_order_product_details_fk1` FOREIGN KEY (`sell_order_detail_id`) REFERENCES `sell_order_details` (`sell_order_detail_id`) ON DELETE CASCADE,
  CONSTRAINT `sell_order_product_details_fk2` FOREIGN KEY (`purchase_history_id`) REFERENCES `purchase_history` (`purchase_history_id`) ON DELETE CASCADE
);

CREATE TABLE `purchase_order` (
  `order_id` varchar(225) NOT NULL,
  `order_date` datetime NOT NULL,
  `purchase_vendor_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `purchase_order_fk1_idx` (`purchase_vendor_id`),
  CONSTRAINT `purchase_order_fk1` FOREIGN KEY (`purchase_vendor_id`) REFERENCES `purchase_vendors` (`purchase_vendor_id`)
);

CREATE TABLE `purchase_history` (
  `purchase_history_id` int NOT NULL AUTO_INCREMENT,
  `purchase_count` int NOT NULL,
  `available_count` int NOT NULL,
  `product_version_id` int NOT NULL,
  `order_id` varchar(225) NOT NULL,
  PRIMARY KEY (`purchase_history_id`),
  KEY `purchase_history_fk2_idx` (`product_version_id`),
  KEY `purchase_history_fk3_idx` (`order_id`),
  CONSTRAINT `purchase_history_fk2` FOREIGN KEY (`product_version_id`) REFERENCES `purchase_vendors` (`purchase_vendor_id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_history_fk3` FOREIGN KEY (`order_id`) REFERENCES `purchase_order` (`order_id`) ON DELETE CASCADE
);
