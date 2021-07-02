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
