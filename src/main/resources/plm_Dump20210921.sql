-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: plm
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `component_vendor_details`
--

DROP TABLE IF EXISTS `component_vendor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_vendor_details`
--

LOCK TABLES `component_vendor_details` WRITE;
/*!40000 ALTER TABLE `component_vendor_details` DISABLE KEYS */;
INSERT INTO `component_vendor_details` VALUES (1,1,'URZ1E470MDD','KEMET','493-15938-ND','Digikey','0.55','0.22770','0.14421'),(2,2,'CL31B102KBCNNNC','Samsung Electro-Mechanics','1276-1050-1-ND','Digikey','0.12000','0.04100','0.02378'),(28,29,'DDTD113ZC-7-F','Diodes Incorporated','DDTD113ZC-7FDICT-ND',' Digi-Key','0.31000','0.13290','0.05947'),(29,30,'ISS55EP06LMXTSA1','Infineon Technologies','448-ISS55EP06LMXTSA1CT-ND','Digi-Key ','0.36000','0.15600','0.06977'),(30,30,'BT137S-800G,118','WeEn Semiconductors','1740-1035-1-ND','Digi-Key','0.72000','0.48270','0.30528'),(31,31,'BT137S-800G,118','WeEn Semiconductors','1740-1035-1-ND','Digi-Key','0.72000','0.48270','0.30528'),(32,32,'RMCF0402FT330R','Stackpole Electronics Inc','RMCF0402FT330RCT-ND','Digi-Key','0.10000','0.00610','0.00274'),(33,33,'RMCF0402FT100K','Stackpole Electronics Inc','RMCF0402FT330RCT-ND','Digi-Key','0.10000','0.00610','0.00274'),(34,13,'SMW210RJT','TE Connectivity Passive Product','A103585CT-ND','Digi-Key','0.73000','0.31430','0.17623'),(35,34,'RMCF0805JT160R','Stackpole Electronics Inc','738-RMCF0805JT160RCT-ND','Digi-Key','0.10000','0.00810','0.00366'),(36,35,'RMCF2010JT330R','Stackpole Electronics Inc','RMCF2010JT330RCT-ND','Digi-Key ','0.22000','0.07420','0.03105'),(37,36,'RMCF0402FT1K00','Stackpole Electronics Inc','RMCF0402FT1K00CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(38,37,'RMCF0402FT1M00','Stackpole Electronics Inc','RMCF0402FT1M00CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(39,14,'DV250K3225R2','Bourns Inc.','118-DV250K3225R2CT-ND','Digi-Key','0.92000','0.62070','0.36784'),(40,38,'MDSR-7-10-20','Littelfuse Inc.','HE500-ND','Digi-Key','0.76000','0.61040','0.60200'),(42,40,'AP2210N-3.0TRG1','Diodes Incorporated','AP2210N-3.3TRG1DICT-ND','Digi-Key ','0.43000','0.20300','0.10685'),(43,41,'NCP1013ST65T3G','ON Semiconductor','NCP1013ST65T3GOSCT-ND','Digi-Key','1.14000','0.79260','0.56892'),(44,42,'VOT8024AB','Vishay Semiconductor Opto Division','VOT8024AB-ND','Digi-Key','1.08000','0.75090','0.48972'),(45,43,'M50-3530542','Harwin Inc.','952-3601-ND','Digi-Key ','0.22000','0.14440','0.09999'),(46,3,'25WA220MEFC8X9','Rubycon','25WA220MEFC8X9-ND','Digi-Key','0.46000','0.19110','0.12105'),(47,4,'C907U102MYWDBA7317','KEMET','399-9473-1-ND','Digi-Key','0.31000','0.11970','0.08448'),(48,6,'MMSZ11T1G','ON Semiconductor','MMSZ11T1GOSCT-ND','Digi-Key','0.24000','0.10270','0.04595'),(49,44,'TB002-500-04BE','CUI Devices','102-6147-ND','Digi-Key','1.02000','0.47710','0.34512'),(50,45,'TB002-500-03BE','CUI Devices','102-6146-ND','Digi-Key','0.77000','0.36080','0.26098'),(52,7,'GS1MTR','SMC Diode Solutions','1655-1432-1-ND','Digi-Key','0.18000','0.09040','0.03795'),(53,8,'CMR1U-06M TR13 PBFREE','Central Semiconductor Corp','1514-CMR1U-06MTR13PBFREECT-ND','Digi-Key','1.33000	','0.92600','0.60390'),(54,9,'ISP817AXSMT/R','Isocom Components 2004 LTD','ISP817AXSMCT-ND','Digi-Key','0.52000','0.22790','0.22790'),(55,11,'RL622-471K-RC','Bourns Inc.','M10001-ND','Digi-Key','1.09000','0.73280','0.49896'),(56,12,'744772102','Würth Elektronik','732-3783-ND','Digi-Key','0.96000','0.84700','0.69000'),(57,15,'NCP1013ST65T3G','ON Semiconductor','NCP1013ST65T3GOSCT-ND','Digi-Key ','1.14000','0.79260','0.56892'),(58,47,'T491D106M035AT','KEMET','399-3768-1-ND','Digi-Key','1.14000','0.61940','0.61940'),(59,48,'GRM187R61A226ME15D','Murata Electronics','490-13243-1-ND','Digi-Key','0.54000','0.25120','0.15816'),(60,49,'GRM219R61E475MA73J','Murata Electronics','490-GRM219R61E475MA73JCT-ND','Digi-Key','0.28000','0.09830','0.05951'),(61,50,'VJ2220Y332KXUSTX1','Vishay Vitramon','720-1588-1-ND','Digi-Key','2.03000','1.25200','0.95392'),(63,52,'HV2220Y102KXVATHV','Vishay Vitramon','720-1563-1-ND','Digi-Key ','3.43000','2.12060','1.61568'),(64,53,'CC0603KRX7R7BB105','Yageo','311-1446-1-ND','Digi-Key ','0.16000','0.05250','0.03049'),(65,54,'SP1105-01UTG','Littelfuse Inc.','F10108CT-ND','Digi-Key ','0.53000','0.25040','0.13178'),(66,55,'ESD5V0LB-TP','Micro Commercial Co','ESD5V0LB-TPMSCT-ND','Digi-Key','0.29000	','0.12540','0.05610'),(67,56,'MF-RM008/240-2','Bourns Inc.','MF-RM008/240-2CT-ND','Digi-Key','0.60000','0.39600','0.27000'),(68,57,'TBL007A-500-06GY','CUI Devices','102-TBL007A-500-06GY-ND','Digi-Key','1.76000','0.81356','0.78644'),(69,59,'M20-8770546','Harwin Inc.','952-1975-ND','Digi-Key','0.42000','0.27960','0.19973'),(70,61,'OSTTE050104','On Shore Technology Inc.','ED2743-ND',' Digi-Key','1.00000','0.59080','0.42016'),(71,28,'742792641','Würth Elektronik','732-1592-1-ND','Digi-Key','0.17000','0.15500','0.14100'),(72,62,'NRS4018T3R3MDGJ','Taiyo Yuden','587-2892-1-ND','Digi-Key','0.28000','0.17150','0.11227'),(73,63,'RT314F12','TE Connectivity Potter & Brumfield Relays','PB963-ND','Digi-Key','7.15000','5.36313','4.17130'),(74,64,'NUD3124LT1G','ON Semiconductor','NUD3124LT1GOSCT-ND','Digi-Key','0.46000','0.29320','0.17804'),(75,65,'AC0402FR-0731K6L','Yageo','YAG5289CT-ND','Digi-Key ','0.10000','0.00900','0.00402'),(76,66,'RMCF0402FT10K0','Stackpole Electronics Inc','RMCF0402FT10K0CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(77,67,'RNCP0805FTD20R0','Stackpole Electronics Inc','RNCP0805FTD20R0CT-ND','Digi-Key','0.10000','0.02830','0.01272'),(78,68,'AC0805JR-07120RL','Yageo','13-AC0805JR-07120RLCT-ND','Digi-Key','0.10000','0.01730','0.00777'),(79,69,'P10KADCT-ND','Panasonic Electronic Components','P10KADCT-ND','Digi-Key ','0.12000','0.04140','0.01822'),(80,70,'RMCF0402ZT0R00','Stackpole Electronics Inc','RMCF0402ZT0R00CT-ND','Digi-Key','0.10000','0.00410','0.00186'),(81,71,'RMCF0402FT100K','Stackpole Electronics Inc','RMCF0402FT100KCT-ND','Digi-Key','0.10000','0.00610','0.00274'),(82,14,'PV250K3225R2','Bourns Inc.','118-PV250K3225R2CT-ND','Digi-Key ','0.63000','0.39600','0.29040'),(83,72,'RAC03-15SK','Recom Power','945-3443-ND','Digi-Key ','6.89000','6.10310','5.51250'),(84,73,'ST1480ACDR','STMicroelectronics','497-3726-1-ND','Digi-Key','1.73000','1.20800','0.86712'),(86,75,'AP7370-50Y-13','Diodes Incorporated','AP7370-50Y-13DICT-ND','Digi-Key','0.43000','0.23540','0.13242'),(87,76,'AOZ6682CI','Alpha & Omega Semiconductor Inc.','785-1852-1-ND','Digi-Key','0.62000','0.41840','0.26458'),(88,77,'STM32L152C8T6','STMicroelectronics','497-11196-ND','Digi-Key','5.73000','4.21925','3.60620'),(89,78,'GJM1555C1H120FB01D','Murata Electronics','490-11190-1-ND','Digi-Key','0.24000','0.08440','0.05111'),(90,79,'500R07S2R4BV4T','Johanson Technology Inc.','712-1280-1-ND','Digi-Key','0.26000','0.10100','0.06237'),(91,81,'GRM155R61A102KA01D','Murata Electronics','490-6295-1-ND','Digi-Key ','0.10000','0.01300','0.00727'),(92,82,'CL05A106MQ5NUNC','Samsung Electro-Mechanics','1276-1451-1-ND','Digi-Key','0.28000','0.09540','0.05774'),(93,18,'GRM155R71H104KE14J','Murata Electronics','490-13342-1-ND','Digi-Key','0.10000','0.01520','0.00854'),(94,83,'500R07S0R3AV4T','Johanson Technology Inc.','712-1245-1-ND','Digi-Key ','0.18000','0.06270','0.03795'),(95,84,'500R07S0R8AV4T','Johanson Technology Inc.','712-1604-1-ND','Digi-Key','0.29000','0.10030','0.06072'),(96,85,'GRM155R71E473JA88D','Murata Electronics','490-7762-1-ND','Digi-Key','0.10000','0.03270','0.01834'),(97,86,'SMAJ28CA-TR','STMicroelectronics','497-4620-1-ND','Digi-Key ','0.40000','0.21960','0.12355'),(98,87,'BAS4002ARPPE6327HTSA1','Infineon Technologies','BAS4002ARPPE6327HTSA1CT-ND','Digi-Key ','0.50000','0.32230','0.20020'),(99,88,'DDZ5V1B-7','Diodes Incorporated','DDZ5V1BDICT-ND','Digi-Key','0.26000	','0.11290','0.05049'),(100,89,'FM20C04VBNN','METZ CONNECT USA Inc.','1849-FM20C04VBNN-ND','Digi-Key ','0.56000','0.42267','0.29064'),(101,90,'TBP02R2-381-05BE','CUI Devices','102-6495-ND','Digi-Key','0.98000','0.46050','0.33310'),(102,91,'M22-2510405','Harwin Inc.','952-1313-ND','Digi-Key','0.31000','0.20290','0.14494'),(103,92,'M22-5320305','Harwin Inc.','M22-5320305P-ND','Digi-Key','0.71000','0.51340','0.36830'),(104,93,'872630693','Molex','WM20491CT-ND','Digi-Key','0.78000','0.50970	','0.41176'),(105,95,'L-07C2N2SV6T','Johanson Technology Inc.','712-1414-1-ND','Digi-Key','0.10000','0.03210','0.02221'),(106,96,'APDS-9250','Broadcom Limited','516-3293-1-ND','Digi-Key ','2.69000','1.45200','1.12530'),(107,97,'Q 38,40-JXS21-10-10/10-FU-WA-LF','Jauch Quartz','1908-1208-1-ND','Digi-Key','0.70000','0.51300','0.48600'),(108,98,'EFR32MG21B020F1024IM32-B','Silicon Labs','336-EFR32MG21B020F1024IM32-BRCT-ND','Digi-Key ','6.96000','5.22000','4.35000'),(109,99,'L-07C1N0SV6T','Johanson Technology Inc.','712-1410-1-ND','Digi-Key','0.10000','0.03210','0.02221'),(110,100,'HK10059N1J-T','Taiyo Yuden','587-1518-1-ND','Digi-Key','0.10000','0.01780','0.01234'),(112,101,'MMBT2222A-7-F','Diodes Incorporated','MMBT2222A-FDICT-ND','Digi-Key','0.14000','0.06820','0.02862'),(113,102,'RMCF0805FT220R','Stackpole Electronics Inc','RMCF0805FT220RCT-ND','Digi-Key','0.10000','0.01090','0.00488'),(114,103,'RMCF0402FT120RCT-ND','Stackpole Electronics Inc','RMCF0402FT120RCT-ND','Digi-Key','0.10000','0.00610','0.00274'),(115,104,'RMCF0805ZT0R00','Stackpole Electronics Inc','RMCF0805ZT0R00CT-ND','Digi-Key','0.10000	','0.00710','0.00318'),(116,106,'RMCF0402FT2K20','Stackpole Electronics Inc','RMCF0402FT2K20CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(117,107,'RMCF0402JT1R00','Stackpole Electronics Inc','RMCF0402JT1R00CT-ND','Digi-Key ','0.10000','0.00680','0.00305'),(118,108,'VOS615A-4T','Vishay Semiconductor Opto Division','VOS615A-4TCT-ND','Digi-Key','0.58000','0.37100	','0.22525'),(119,109,'EKMC1691111','Panasonic Electric Works','255-6303-ND','Digi-Key ','18.60000','7.72800','6.76200'),(120,78,'GCM1555C1H120FA16J','Murata Electronics','490-16459-1-ND','Digi-Key','0.12000','0.04050','0.02353'),(121,110,'CL05A105KO5NNNC','Samsung Electro-Mechanics','1276-1067-1-ND','Digi-Key','0.10000','0.02050','0.01151'),(122,111,'GRM155C80J224KE01D','Murata Electronics','490-6282-1-ND','Digi-Key','0.12000	','0.03880','0.02178'),(125,94,'PR20B05HBDN','METZ CONNECT USA Inc.','1849-PR20B05HBDN-ND','Digi-Key','0.48000','0.34330','0.24631'),(126,112,'SRR4018-3R3Y','Bourns Inc.','SRR4018-3R3YCT-ND','Digi-Key','0.92000','0.57480','0.54028'),(128,114,'DTD114ECT116','Rohm Semiconductor','DTD114ECT116CT-ND','Digi-Key ','0.33000','0.14230','0.06367'),(129,115,'PMV250EPEAR','Nexperia USA Inc.','1727-2303-1-ND','Digi-Key','0.44000','0.18440','0.09361'),(130,116,'RT0402DRE0710KL','Yageo','311-2217-1-ND','Digi-Key','0.17000','0.05640','0.02360'),(131,118,'RMCF0402FT33K2CT','Stackpole Electronics Inc','RMCF0402FT33K2CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(132,119,'RI-02GP1015','Comus International','1835-1005-ND','Digi-Key','0.51000','0.40900','0.30906'),(133,120,'TPS562201DDCR','Texas Instruments','296-44397-1-ND','Digi-Key','0.77000','0.52030','0.33950'),(135,90,'TBP02P1-381-05BE','CUI Devices','102-6471-ND','Digi-Key','1.62000','0.95670','0.68034'),(136,47,'293D106X0035D2TE3','Vishay Sprague','718-1046-1-ND','Digi-Key ','0.82000','0.37960','0.37960'),(137,122,'GRM21BC8YA106KE11L','Murata Electronics','490-10504-1-ND','Digi-Key ','0.54000	','0.22530','0.14268'),(138,123,'GRM21BR61E226ME44L','Murata Electronics','490-10749-1-ND','Digi-Key','0.46000','0.18980','0.12018'),(139,124,'QBLP617-IW5','QT Brightek (QTB)','1516-1260-1-ND','Digi-Key','0.49000','0.17310','0.13547'),(140,125,'20021121-00010C4LF','Amphenol ICC (FCI)','609-3695-1-ND','Digi-Key','0.88000','0.66440','0.66440'),(141,126,'97730606332R','Würth Elektronik','732-13698-1-ND','Digi-Key','0.83000','0.59340','0.55200'),(142,127,'FTSH-103-01-L-DV','Samtec Inc.','SAM13920CT-ND','Digi-Key','1.60000','1.24110','1.24110'),(143,128,'CLP-103-02-F-D-A','Samtec Inc.','SAM15126-ND','Digi-Key','1.96000','1.52100','1.08645'),(144,129,'TBP01R1-508-05BE','CUI Devices','102-6409-ND','Digi-Key','1.07000','0.50080','0.36229'),(145,131,'ACP3225-102-2P-T000','TDK Corporation','445-8637-1-ND','Digi-Key','1.10000','0.73530','0.56322'),(146,132,'RMCF0402FT100R','Stackpole Electronics Inc','RMCF0402FT100RCT-ND','Digi-Key','0.10000','0.00610','0.00274'),(147,133,'PTS526 SM15 SMTR2 LFS','C&K','CKN12220-1-ND','Digi-Key','0.11000','0.09360','0.06741'),(148,134,'TCS40DLR,LF','Toshiba Semiconductor and Storage','TCS40DLRLFCT-ND','Digi-Key','0.39000','0.20800','0.14400'),(149,136,'3034TR','Keystone Electronics','36-3034CT-ND','Digi-Key','0.42000','0.29450	','0.27132'),(150,137,'CL21B104KBFNNNE','Samsung Electro-Mechanics','1276-1180-1-ND','Digi-Key','0.10000','0.02200','0.01237'),(151,138,'GRT31CC81C226KE01L','Murata Electronics','490-12409-1-ND','Digi-Key','0.56000','0.26010','0.16374'),(152,139,'CC0402KRX5R9BB104','Yageo','311-3342-1-ND','Digi-Key','0.10000','0.01770','0.00993'),(155,142,'CL31A106KAHNNNE','Samsung Electro-Mechanics','1276-1075-1-ND','Digi-Key','0.21000','0.07390','0.04475'),(156,143,'CC0402KRNPO8BN100','Yageo','311-3778-1-ND','Digi-Key','0.10000','0.01220','0.00683'),(157,144,'860010472001','Würth Elektronik','732-8624-1-ND','Digi-Key','0.10000','0.07000	','0.05200	'),(158,145,'UWJ1E220MCL1GB','Nichicon','493-9792-1-ND','Digi-Key ','0.36000','0.15110','0.11334'),(160,147,'PESD5V0V1BA,115','Nexperia USA Inc.','1727-5807-1-ND','Digi-Key','0.44000','0.18340','0.09310'),(161,148,'PESD5V0C1USFYL','Nexperia USA Inc.','1727-2176-1-ND','Digi-Key','0.42000','0.18430','0.08247'),(162,149,'MM5Z5V1T1G','ON Semiconductor','SZMM5Z5V1T1GOSCT-ND','Digi-Key','0.50000','0.21270','0.10800'),(163,150,'CBRSDSH2-40 TR13','Central Semiconductor Corp','CBRSDSH2-40TR13-CT-ND','Digi-Key ','1.14000','1.14000','0.62244'),(164,151,'SMAJ24CATR','SMC Diode Solutions','1655-2296-1-ND','Digi-Key ','0.45000','0.19080','0.09690'),(165,152,'0.47000','ON Semiconductor','1SMB5921BT3GOSCT-ND','Digi-Key','	0.47000','0.22230','0.11702'),(166,153,'FOD817DSDCT-ND','ON Semiconductor','FOD817DSDCT-ND','Digi-Key ','0.50000','0.17680','0.17680'),(167,154,'10018784-10201TLF','Amphenol ICC (FCI)','609-2026-ND','Digi-Key ','0.74000','0.55383	','0.38079'),(168,155,'20021121-00010C4LF','Amphenol ICC (FCI)','609-3695-1-ND','Digi-Key ','0.88000','0.66440','0.66440'),(169,156,'1935242','Phoenix Contact','277-1585-ND','Digi-Key','2.04000','1.77000','1.50450'),(170,157,'ACM1211-701-2PL-TL01','TDK Corporation','445-2212-1-ND','Digi-Key','2.25000','1.45530','1.24740'),(171,158,'UVK2G3R3MPD','Nichicon','493-16116-ND','Digi-Key','0.66000','0.30550','0.19237'),(172,16,'GRM21BR61E106MA73L','Murata Electronics','490-10748-1-ND','Digikey','0.26000','0.10170','0.06279'),(173,19,'GRM155R61E105MA12D','Murata Electronics','490-10018-1-ND','Digi-Key','0.12000','0.03780','0.02119'),(174,159,'C2012X7R1A475K085AC','TDK Corporation','445-14527-1-ND','Digi-Key ','0.29000','0.11420','0.07052'),(175,160,'1264EY-3R3N=P3','Murata Electronics','490-10821-1-ND','Digi-Key','0.46000','0.28880','0.24256'),(176,161,'ACM4520V-142-2P-T00','TDK Corporation','445-15674-1-ND','Digi-Key','1.47000	','0.98700','0.88200'),(177,163,'1255AY-6R8M=P3','Murata Electronics','490-14063-1-ND','Digi-Key','0.46000','0.28880','0.24256'),(178,164,'FQD11P06TM','ON Semiconductor','FQD11P06TMCT-ND','Digi-Key','0.74000','0.49980','0.31610'),(179,165,'PMBT2222A,215','Nexperia USA Inc.','1727-2956-1-ND','Digi-Key ','0.12000','0.06060','0.02544'),(181,48,'C1608X5R1A226M080AC','TDK Corporation','445-9077-1-ND','Digi-Key','0.51000','0.21390','0.13547'),(182,20,'C0402C103J3RACTU','KEMET','399-1279-1-ND','Digi-Key','0.10000','0.02140','0.01202'),(183,23,'SP1112-01UTG','F10109CT-ND','Littelfuse Inc.','Digi-Key','0.53000','0.25040','0.13178'),(184,24,'PPPC041LFBN-RC','Sullins Connector Solutions','S7037-ND','Digi-Key','0.47000','0.33530','0.24057'),(185,25,'PH1-04-UA','Adam Tech','2057-PH1-04-UA-ND','Digi-Key','0.10000','0.04830','0.03500'),(186,26,'OSTOQ053250','On Shore Technology Inc','ED2822-ND','Digi-Key','1.12000','0.52690','0.38117'),(187,27,'PE-1210CCMC601STS','Pulse Electronics Network','1840-1306-1-ND','Digi-Key','0.92000	','0.61690','0.42000'),(188,146,'CL32B225KCJSNNE','Samsung Electro-Mechanics','1276-3362-1-ND','Digi-Key','0.49000','0.16744','0.22600'),(189,166,'MMBT3904-TP','Micro Commercial Co','MMBT3904TPMSCT-ND','Digi-Key ','0.14000','0.06820','0.02862'),(191,166,'MMBT3904,215','Nexperia USA Inc.','1727-4044-1-ND','Digi-Key','0.11000','0.05460','0.02290'),(192,29,'DDTC114ECA-7-F','Diodes Incorporated','DDTC114ECA-FDICT-ND','Digi-Key','0.21000','0.09060','0.04054'),(193,167,'MUN2211T1G','ON Semiconductor','MUN2211T1GOSCT-ND','Digi-Key','0.17000','0.08340','0.03498'),(194,168,'RMCF0402FT59K0','Stackpole Electronics Inc','RMCF0402FT59K0CT-ND','Digi-Key','0.10000	','0.00610','0.00274'),(195,116,'RR0510P-103-D','Susumu','RR05P10.0KDCT-ND','Digi-Key ','0.10000','0.02910','0.01309'),(196,169,'RMCF0402FT54K9','Stackpole Electronics Inc','RMCF0402FT54K9CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(197,170,'RC0805FR-0720RL','Yageo','311-20.0CRCT-ND','Digi-Key ','0.10000','0.01690','0.00759'),(198,171,'RC0402JR-07120RL','Yageo','311-120JRCT-ND','Digi-Key','0.10000','0.00540','0.00244'),(199,32,'RMCF0402JT330R','Stackpole Electronics Inc','RMCF0402JT330RCT-ND','Digi-Key','0.10000','0.00470','0.00213'),(200,35,'CRCW1206330RJNEAHP','Vishay Dale','541-330UACT-ND','Digi-Key ','0.43000','0.14340','0.06003'),(201,106,'RR0510P-222-D','Susumu','RR05P2.2KDCT-ND','Digi-Key','0.10000','0.02910','0.01309'),(202,172,'RMCF0402FT442R','Stackpole Electronics Inc','RMCF0402FT442RCT-ND','Digi-Key','0.10000','0.00610','0.00274'),(203,172,'RC0402FR-07442RL','Yageo','YAG3162CT-ND','Digi-Key','0.10000','0.00660','0.00299'),(204,173,'RMCF0402FT47K0','Stackpole Electronics Inc','RMCF0402FT47K0CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(205,175,'RMCF0402FT49R9','Stackpole Electronics Inc','RMCF0402FT49R9CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(206,176,'RC0402JR-07240RL','Yageo','311-240JRCT-ND','Digi-Key','0.10000','0.00540','0.00244'),(207,177,'RMCF0402FT4K87','Stackpole Electronics Inc','RMCF0402FT4K87CT-ND','Digi-Key','0.10000','0.00610','0.00274'),(208,178,'RC0402JR-072M2L','Yageo','YAG3292CT-ND','Digi-Key','0.10000	','0.00540','0.00244'),(209,179,'RC0402JR-07510KL','Yageo','YAG3305CT-ND','Digi-Key','0.10000','0.00540','0.00244'),(210,180,'RC0402JR-07160KL','Yageo','YAG3276CT-ND','Digi-Key','0.10000','0.00540','0.00244	'),(211,181,'PRPC001DAAN-RC','Sullins Connector Solutions','S2011EC-01-ND','Digi-Key','0.08000','0.04490','0.03716'),(212,182,'1571563-9','TE Connectivity ALCOSWITCH Switches','450-2047-6-ND','Digi-Key','0.49000','0.39310	','0.35812'),(213,74,'SN74LVC1T45DCKR','Texas Instruments','296-16844-1-ND','Digi-Key ','0.60000','0.40230','0.26250'),(215,184,'DP83848CVVX/NOPB','Texas Instruments','DP83848CVVX/NOPBCT-ND','Digi-Key ','5.85000','4.30140','3.66172'),(216,97,'Q 38,40-JXS21-8-10/10-FU-WA-LF','Jauch Quartz','1908-1212-1-ND','Digi-Key','0.70000','0.51300','0.48600'),(217,185,'XRCGB25M000F0L00R0','Murata Electronics','490-5577-1-ND','Digi-Key','0.32000','0.21480','0.17184'),(218,186,'XRCGB24M000F0L00R0','Murata Electronics','490-5575-1-ND','Digi-Key ','0.32000','0.21480','0.17184'),(219,187,'STM32F765ZGT6','STMicroelectronics','497-16632-ND','Digi-Key','17.35000	','13.77125','13.77125'),(220,188,'SPU03M-15','MEAN WELL USA Inc.','1866-4861-ND','Digi-Key','6.62000','5.86550','5.29789'),(221,189,'MAX17612AATB+','Maxim Integrated','MAX17612AATB+-ND','Digi-Key','2.46000	','1.80863','1.59000'),(222,190,'FC-135 32.7680KA-A5','EPSON','SER4103CT-ND','Digi-Key ','0.66000','0.44000','0.35200'),(223,53,'CL21B105KOFNNNG','Samsung Electro-Mechanics','1276-6471-1-ND','Digi-Key ','0.10000','0.02610','0.01464'),(224,191,'EEE-FKV121XSP','Panasonic Electronic Components','P18961CT-ND','Digi-Key ','0.80000','0.37420','0.24943'),(226,193,'39212000440','Littelfuse Inc.','F4536-ND','Digi-Key','0.34000','0.11930','0.08850'),(227,194,'395433002','Molex','WM13970-ND','Digi-Key ','1.11000','0.65900','0.46864'),(228,195,'796682-4','TE Connectivity AMP Connectors','A136640-ND','Digi-Key ','2.04000','1.25760','0.91174'),(229,196,'JD0-0003NL','Pulse Electronics Network','553-2604-ND','Digi-Key','4.97000','3.97940','2.88506'),(230,197,'1-796949-0','TE Connectivity AMP Connectors','1-796949-0-ND','Digi-Key ','5.71000','3.54320','2.61800'),(231,63,'RTS3TF12','TE Connectivity Potter & Brumfield Relays','PB2003-ND','Digi-Key','10.79000','8.09013	','6.29230'),(232,198,'EXB-2HV330JV','Panasonic Electronic Components','Y1330CT-ND','Digi-Key','0.27000','0.08820','0.03690'),(233,199,'RMCF0402JT20R0','Stackpole Electronics Inc','Stackpole Electronics Inc','Digi-Key','0.10000','0.00470','0.00213	'),(234,200,'ERA-2AED101X','Panasonic Electronic Components','P100DECT-ND','Digi-Key','0.19000	','0.06360','0.02664'),(235,174,'RMCF0402JT1K50','Stackpole Electronics Inc','RMCF0402JT1K50CT-ND','Digi-Key','0.10000','0.00470','0.00213'),(236,182,'FSM8JSMAASTR','TE Connectivity ALCOSWITCH Switches','450-2136-1-ND','Digi-Key','0.52000','0.41510','0.37824'),(237,201,'RAC10-12SK/277','Recom Power','945-3122-5-ND','Digi-Key','11.68000','10.01420','9.34655	'),(238,21,'LTST-C193KGKT-5A','Lite-On Inc.','160-1828-2-ND','Digi-Key','0.05980','0.05382	','0.04336'),(239,22,'LTST-C191KRKT','Lite-On Inc.','160-1447-1-ND','Digi-Key','0.26000','0.06560','0.04747'),(240,21,'LTST-C191KSKT','Lite-On Inc.','160-1448-1-ND','Lite-On Inc.','0.28000','0.06990','0.06450'),(241,39,'PIC16F15225-I/MG','Microchip Technology','150-PIC16F15225-I/MG-ND','Digi-Key','0.79000','0.66700','0.66700'),(242,140,'UWT1E101MCL1GS','Nichicon','493-2190-1-ND','Digi-Key','0.50000','0.20770','0.13846'),(243,202,'TB002-500-02BE','CUI Devices','TB002-500-02BE','Digi-Key','0.71000','0.25500','0.18362'),(244,203,'RC0402FR-0710RL','Yageo','311-10.0LRCT-ND','Digi-Key','0.10000','0.01000','0.00451'),(245,205,'SHTC3','Sensirion AG','1649-1100-1-ND','Digi-Key','3.50000','1.90190','1.50150'),(246,206,'GD25Q32CSIGR','GigaDevice Semiconductor (HK) Limited','1970-1025-1-ND','Digi-Key','1.01000','0.80860','0.76164'),(247,207,'7499211002A','Würth Elektronik','732-4976-ND','Digi-Key','9.41000','7.93000','6.60803'),(248,208,'IR19-21C/TR8','Everlight Electronics Co Ltd','1080-1354-1-ND','Digi-Key','0.34000','0.11930','0.08850'),(249,209,'SN74LVC1G08DCKR','Texas Instruments','296-11602-1-ND','Digi-Key','0.32000','0.13900','0.06217');
/*!40000 ALTER TABLE `component_vendor_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components` (
  `componet_id` int NOT NULL AUTO_INCREMENT,
  `component_value` varchar(225) NOT NULL,
  `component_description` blob NOT NULL,
  PRIMARY KEY (`componet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT INTO `components` VALUES (1,'47uF/25V',_binary 'CAP ALUM 47UF 20% 25V RADIAL'),(2,'1nF',_binary 'CAP CER 1000PF 50V X7R 1206'),(3,'220uF/25V',_binary 'CAP ALUM 220UF 20% 25V RADIAL'),(4,'1nF',_binary 'CAP CER 1000PF 400VAC Y5U RADIAL'),(6,'ZENER 11V',_binary 'DIODE ZENER 11V 500MW SOD123'),(7,'GS1MTR',_binary 'DIODE GEN PURP 1KV 1A SMA'),(8,'MURA160T3G',_binary 'DIODE GEN PURP 600V 1A SMA'),(9,'OPTO ISOLATOR',_binary 'OPTOISO 5.3KV TRANS 4SMD'),(11,'470uH',_binary 'FIXED IND 470UH 460MA 1.1 OHM TH'),(12,'1mH',_binary 'FIXED IND 1MH 300MA 1.84 OHM TH'),(13,'10E',_binary 'RES SMD 10 OHM 1% 1W 2515'),(14,'VARISTOR',_binary 'PV SERIES 250V 3225 PKG'),(15,'NCP1013',_binary 'IC OFFLINE SWIT SMPS CM SOT223'),(16,'10uF',_binary '(CAP CER 10UF 25V X5R 0805)'),(18,'100 nF',_binary 'CAP CER 0.1UF 50V X7R 0402'),(19,'1uF',_binary 'CAP CER 1UF 25V X5R 0402'),(20,'10 nF',_binary 'CAP CER 10000PF 25V X7R 0402'),(21,'LED',_binary 'LED GREEN CLEAR SMD'),(22,'LED',_binary 'LED RED CLEAR SMD'),(23,'DIODE TVS',_binary 'TVS DIODE 12VWM 26.5VC 2DFN'),(24,'CON4',_binary 'CONN HDR 4POS 0.1 GOLD PCB'),(25,'CON4',_binary 'CONN HEADER VERT 4POS 2.54MM'),(26,'CON5',_binary 'TERM BLOCK HDR 5POS VERT 3.81MM'),(27,'CHOKE CM',_binary 'CMC 1A 2LN 600 OHM SMD'),(28,'FB',_binary 'FERRITE BEAD 300 OHM 0603 1LN'),(29,'DTD114',_binary 'TRANS PREBIAS NPN 200MW SOT23-3'),(30,'MOSFET_P',_binary 'MOSFET P-CH 60V 180MA SOT23-3'),(31,'BT137S',_binary 'TRIAC 800V 8A DPAK'),(32,'330R',_binary 'RES 330 OHM 1% 1/16W 0402'),(33,'100k',_binary 'RES 100K OHM 1% 1/16W 0402'),(34,'160 R',_binary 'RES 160 OHM 5% 1/8W 0805'),(35,'330 R',_binary 'RES 330 OHM 5% 3/4W 2010'),(36,'1 K',_binary 'RES 1K OHM 1% 1/16W 0402'),(37,'1M',_binary 'RES 1M OHM 1% 1/16W 0402'),(38,'Reed Switch',_binary 'SWITCH REED SPST-NO 350MA 140V'),(39,'PIC16F15225',_binary 'IC MCU 8BIT 14KB FLASH 16QFN'),(40,'AP2210N',_binary 'IC REG LINEAR 3V 300MA SOT23-3'),(41,'NCP1013',_binary 'IC OFFLINE SWIT SMPS CM SOT223'),(42,'VOT8024',_binary 'PHOTOTRIAC 800V ZC SMD4 DIP4'),(43,'PROG',_binary 'CONN HEADER VERT 5POS 1.27MM'),(44,'CON4_5MM',_binary 'TERMINAL BLOCK 4pin, SCREW TYPE, 5.00'),(45,'CON3_5MM',_binary 'TERMINAL BLOCK 3PIN, SCREW TYPE, 5.00'),(47,'10uF',_binary 'CAP TANT 10UF 20% 35V 2917'),(48,'22uF',_binary 'CAP CER 22UF 10V X5R 0604'),(49,'4.7 uF',_binary 'CAP CER 4.7UF 25V X5R 0805'),(50,'3.3 nF',_binary 'CAP CER 3300PF 250VAC X7R 2220'),(52,'1nF',_binary 'CAP CER 1000PF 4KV X7R 2220'),(53,'1 uF',_binary 'CAP CER 1UF 16V X7R 0603'),(54,'DIODE TVS',_binary 'TVS DIODE 5V 10.9V 2DFN'),(55,'TVS',_binary 'TVS DIODE 5V 16V DFN1006-2'),(56,'PTC 80mA',_binary 'PTC RESET FUSE 240V 80MA RADIAL'),(57,'CON6_5MM',_binary 'TERMINAL BLOCK 6_PIN, SCREWLESS, 5.00,'),(59,'PROG1',_binary 'CONN HEADER SMD 5POS 2.54MM'),(61,'CON5',_binary 'TERM BLK 5POS SIDE ENT 3.5MM PCB'),(62,'3.3 uH',_binary 'FIXED IND 3.3UH 2A 66 MOHM SMD'),(63,'RELAY_SPDT_1A',_binary 'RELAY GEN PURPOSE SPDT 16A 12V'),(64,'NUD3124',_binary 'IC PWR DRVR N-CHAN 1:1 SOT23-3'),(65,'31.6 K',_binary 'RES SMD 31.6K OHM 1% 1/16W 0403'),(66,'10 K',_binary 'RES 10K OHM 1% 1/16W 0402'),(67,'20 R',_binary 'RES 20 OHM 1% 1/4W 0805'),(68,'120 R',_binary 'RES SMD 120 OHM 5% 1/8W 0805'),(69,'10 K',_binary 'RES SMD 10K OHM 5% 1/2W 0805'),(70,'0R',_binary 'RES 0 OHM JUMPER 1/16W 0402'),(71,'100 K',_binary 'RES 100K OHM 1% 1/16W 0402'),(72,'RAC03-15SK',_binary 'AC/DC CONVERTER 15V 3W'),(73,'ST1480',_binary 'IC TRANSCEIVER HALF 1/1 8SO'),(74,'74LVC1T45DCKR',_binary 'IC TRNSLTR BIDIRECTIONAL SC70-6'),(75,'AP7370',_binary 'LDO CMOS LOWCURR SOT89'),(76,'AOZ6682CI',_binary 'POWER IC EZ BUCK'),(77,'STM32L152C8T6',_binary 'IC MCU 32BIT 64KB FLASH 48LQFP'),(78,'12 pF',_binary 'CAP CER 12PF 50V C0G/NP0 0402'),(79,'2.4 pF',_binary 'CAP CER 2.4PF 50V C0G/NP0 0402'),(81,'2.2 uF',_binary 'CAP CER 2.2UF 10V X5R 0402'),(82,'10 uF',_binary 'CAP CER 10UF 6.3V X5R 0402'),(83,'0.3 pF',_binary 'CAP CER 0.3PF 50V C0G/NP0 0402'),(84,'0.8 pF',_binary 'CAP CER 0.8PF 50V C0G/NP0 0402'),(85,'47 nF',_binary 'CAP CER 0.047UF 25V X7R 0402'),(86,'TVS DIODE',_binary 'TVS DIODE 28V 59V SMA'),(87,'BAS4002ARPPE6327HTSA1',_binary 'BRIDGE RECT 1P 40V 200MA SOT143'),(88,'DIODE ZENER',_binary 'DIODE ZENER 5.1V 500MW SOD123'),(89,'CON4',_binary 'RECEPTACLE, SMT, SINGLE ROW, 2.0'),(90,'CON5',_binary 'TERMINAL BLOCK, PLUGGABLE, 3.81'),(91,'CON4_2MM',_binary 'CONN HEADER VERT 4POS 2MM'),(92,'CON6A',_binary 'CONN HEADER SMD 6POS 2MM'),(93,'CON6A',_binary 'CONN RCPT 6POS 0.079 GOLD SMD'),(94,'PROG',_binary 'PIN HEADER, THR, DUAL ROW, 1.27'),(95,'2.2 nH',_binary 'FIXED IND 2.2NH 300MA 160 MOHM'),(96,'ALS Sensor',_binary 'SENSOR OPT 550NM AMBIENT 6SMD'),(97,'38.4 MHz',_binary 'CRYSTAL 38.4000MHZ 10PF SMD'),(98,'EFR32MG21',_binary 'RF SoC Mighty Gecko, QFN32, 2.4G, 20dB'),(99,'1.0 nH',_binary 'FIXED IND 1NH 300MA 120 MOHM SMD'),(100,'9.1 nH',_binary 'FIXED IND 9.1NH 360MA 300 MOHM'),(101,'MMBT2222A',_binary 'TRANS NPN 40V 0.6A SMD SOT23-3'),(102,'220E',_binary 'RES 220 OHM 1% 1/8W 0805'),(103,'120 R',_binary 'RES 120 OHM 1% 1/16W 0402'),(104,'0R',_binary 'RES 0 OHM JUMPER 1/8W 0805'),(106,'2.2 K',_binary 'RES 2.2K OHM 1% 1/16W 0402'),(107,'1 R',_binary 'RES 1 OHM 5% 1/16W 0402'),(108,'VOS615',_binary 'OPTOISOLATOR 3.75KV TRANS 4SSOP'),(109,'EKMC1691111',_binary 'SENSOR MOTION PIR SLIGHT MOTION'),(110,'1UF',_binary 'CAP CER 1UF 16V X5R 0402'),(111,'10UF',_binary 'CAP CER 10UF 6.3V X6S 0402'),(112,'3.3UH ',_binary 'FIXED IND 3.3UH 1.95A 65MOHM SMD'),(114,'DTD114E',_binary 'NPN 500MA/50V DIGITAL TRANSISTOR'),(115,'MOSFET_P-ChanneL',_binary 'MOSFET P-CH 40V SOT23'),(116,'10K OHM',_binary 'RES SMD 10K OHM 0.5% 1/16W 0402'),(118,'33.2K OHM',_binary 'RES 33.2K OHM 1% 1/16W 0402'),(119,'Glass Body Reed Switch',_binary 'SWITCH REED SPST-NO 500MA 140V'),(120,' 0.768V 1 Output 2A',_binary 'IC REG BUCK ADJ 2A TSOT23-6'),(122,'10uF',_binary 'CAP CER 10UF 35V X6S 0805'),(123,'22uF',_binary 'CAP CER 22UF 25V X5R 0805'),(124,'LED',_binary 'LED WHITE 0602 SMD R/A'),(125,'PROG_P1.27MM',_binary 'CONN HEADER VERT 10POS 1.27MM'),(126,'SMT standoff',_binary 'SMT STEEL SPACER, M1.6 INTERNAL'),(127,'CON6A_P1.27MM',_binary 'CONN HEADER SMD 6POS 1.27MM'),(128,'CON6A_P(1.27MM)',_binary 'CONN RCPT 6POS 0.05 GOLD SMD'),(129,'CON_5.08MM',_binary 'TERMINAL BLOCK, PLUGGABLE, 5.08,'),(131,'CHOKE_CM',_binary 'CMC 1.5A 2LN 1 KOHM SMD'),(132,'100 R',_binary 'RES 100 OHM 1% 1/16W 0402'),(133,'Tactile Switch',_binary 'TACT 5.2 X 5.2, 1.5 MM H, 160GF,'),(134,'TCS40DLR',_binary 'MAGNETIC SWITCH OMNIPOLAR SOT23F'),(136,'BATTERY',_binary 'BATTERY_RETAINER_3034TR'),(137,'0.1µF',_binary 'CAP CER 0.1UF 50V X7R 0805'),(138,'22µF ',_binary 'CAP CER 22UF 16V X6S 1206'),(139,'100nF',_binary 'CAP CER 0.1UF 50V X5R 0402'),(140,'100uF',_binary 'CAP ALUM 100UF 20% 25V SMD'),(142,'10uF',_binary 'CAP CER 10UF 25V X5R 1206'),(143,'10pF',_binary 'CAP CER 10PF 25V NPO 0402'),(144,'4.7uF/25V',_binary 'CAP ALUM 4.7UF 20% 25V RADIAL'),(145,'22uF/25V',_binary 'CAP ALUM 22UF 20% 25V SMD'),(146,'2.2uF',_binary 'CAP CER 2.2UF 100V X7R 1210'),(147,'DIODE BI-DIR TRIG',_binary 'TVS DIODE 5VWM 12.5VC SOD323'),(148,'DIODE BI-DIR TRIG',_binary 'TVS DIODE 5VWM 3VC DSN0603-2'),(149,'DIODE SCHOTTKY',_binary 'DIODE ZENER 5.1V 500MW SOD523'),(150,'DIODE BRIDGE',_binary 'BRIDGE RECT 1PHASE 40V 2A 4SMDIP'),(151,'DIODE BI-DIR TRIG',_binary 'TVS DIODE 24VWM 38.9VC SMA'),(152,'DIODE ZENER',_binary 'DIODE ZENER 6.8V 3W SMB'),(153,'OPTO ISOLATOR',_binary 'OPTOISOLATOR 5KV TRANSISTOR 4SMD'),(154,'CON_1.00MM',_binary 'CONN PCI EXP FEMALE 64POS 0.039'),(155,'CON_P1.27MM',_binary 'CONN HEADER SMD 10POS 1.27MM'),(156,'CON10_P(5.00MM)',_binary 'TERM BLK 10P SIDE ENTRY 5MM PCB'),(157,'CHOKE CM',_binary 'CMC 8A 2LN 700 OHM SMD'),(158,'3.3µF 400V',_binary 'CAP ALUM 3.3UF 20% 400V RADIAL'),(159,' 4.7UF',_binary 'CAP CER 4.7UF 10V X7R 0805'),(160,'IND 3.3UH',_binary 'FIXED IND 3.3UH 4.8A 21MOHM SMD'),(161,'CHOKE CM',_binary 'CMC 1A 2LN 1.4KOHM SMD AEC-Q200'),(163,'6.8UH',_binary 'FIXED IND 6.8UH 3.4A 36MOHM SMD'),(164,'MOSFET_P',_binary 'MOSFET P-CH 60V 9.4A DPAK'),(165,'NPN BCE',_binary 'TRANS NPN 30V 600MA TO236AB'),(166,'BJT_NPN 40V 200mA',_binary 'TRANS NPN 40V 0.2A SOT23'),(167,' (BJT) NPN - Pre-Biased 50V ',_binary 'TRANS PREBIAS NPN 50V 100MA SC59'),(168,'59K OHM',_binary 'RES 59K OHM 1% 1/16W 0402'),(169,'54.9K OHM',_binary 'RES 54.9K OHM 1% 1/16W 0402'),(170,'20 OHM',_binary 'RES SMD 20 OHM 1% 1/8W 0805'),(171,'120 OHM ',_binary 'RES SMD 120 OHM 5% 1/16W 0402'),(172,'442 OHM',_binary 'RES 442 OHM 1% 1/16W 0402'),(173,'47K OHM ',_binary 'RES 47K OHM 1% 1/16W 0402'),(174,'1.5K OHM ',_binary 'RES SMD 1.5K OHM 5% 1/16W 0402'),(175,'49.9 OHM',_binary 'RES SMD 49.9 OHM 1% 1/16W 0402'),(176,'240 OHM',_binary 'RES SMD 240 OHM 5% 1/16W 0402'),(177,'4.87K OHM',_binary 'RES SMD 4.87K OHM 1% 1/16W 0402'),(178,' 2.2M OHM',_binary 'RES SMD 2.2M OHM 5% 1/16W 0402'),(179,'510K ',_binary 'RES SMD 510K OHM 5% 1/16W 0402'),(180,'160 R',_binary 'RES SMD 160K OHM 5% 1/16W 0402'),(181,'SW SPST_ 2.54mm',_binary 'CONN HEADER VERT 2POS'),(182,'SW DPST',_binary 'SWITCH TACTILE SPST-NO 0.05A 24V'),(184,'DP83848CVV',_binary 'IC TRANSCEIVER 1/1 48LQFP'),(185,'25.0000MHZ',_binary 'CRYSTAL 25.0000MHZ 6PF SMD'),(186,'24MHz',_binary 'CRYSTAL 24.0000MHZ 6PF SMD'),(187,'LQFP144',_binary 'IC MCU 32BIT 1MB FLASH 144LQFP'),(188,'SPU03M-15',_binary 'DC DC CONVERTER 15V 3W'),(189,'MAX17612A',_binary 'IC OVERVOLTAGE/CURRENT 10TDFN'),(190,'32.768KHz',_binary 'CRYSTAL 32.7680KHZ 12.5PF SMD'),(191,'120UF',_binary 'CAP ALUM 120UF 20% 35V SMD'),(193,'2A 250V',_binary 'FUSE BOARD MOUNT 2A 250VAC RAD'),(194,'CON_5.00MM',_binary 'TERM BLK 2POS SIDE ENTRY 5MM PCB'),(195,'CON4PIN_P5.0MM',_binary 'TERM BLK 4POS SIDE ENTRY 5MM PCB'),(196,'CON_JD0-000',_binary 'CONN JACK 1PORT 100 BASE-TX PCB'),(197,'CON10_P5.08MM',_binary 'TERM BLK 10P SIDE ENT 5.08MM PCB'),(198,'RN_33 Ohm ',_binary 'RES ARRAY 8 RES 33 OHM 1506'),(199,'20 R',_binary 'RES 20 OHM 5% 1/16W 0402'),(200,'100 OHM',_binary 'RES SMD 100 OHM 0.5% 1/16W 0402'),(201,'Enclosed AC DC',_binary 'AC/DC CONVERTER 12V 10W'),(202,'CON2_P5.00mm',_binary 'TERMINAL BLOCK, SCREW TYPE, 5.00'),(203,'10E',_binary 'RES SMD 10 OHM 1% 1/16W 0402'),(205,'SHTC3',_binary 'SENSOR HUMI/TEMP I2C 2% SMD'),(206,'GD25Q32CSIGR',_binary 'IC FLASH 32MBIT SPI/QUAD 8SOP'),(207,'CON10_HFJ11-RP48E-L12',_binary 'CONN JACK 1PORT 100 BASE-T PCB'),(208,'DIODE_LED',_binary 'EMITTER IR 940NM 65MA 0603'),(209,'SN74LVC1G',_binary 'IC GATE AND 1CH 2-INP SC70-5');
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'GrydLight Power'),(2,'GrydLight_Minimalistic_TRIAC'),(3,'GrydLight_Wireless_Relay'),(4,'GrydLight_Wired_Sensor_DALI'),(5,'GrydLight_CircularSwitch'),(6,'GrydLight_Wired_Controller'),(15,'GrydLight_Wired_Relay_Controller  ');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_components`
--

DROP TABLE IF EXISTS `product_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_components`
--

LOCK TABLES `product_components` WRITE;
/*!40000 ALTER TABLE `product_components` DISABLE KEYS */;
INSERT INTO `product_components` VALUES (2,'C19',1,1),(3,'C20',1,2),(4,'C21',1,3),(5,'C22',1,4),(6,'C23',1,158),(7,'D22',1,6),(8,'D23',1,7),(9,'D24',1,8),(10,'ISO1',1,9),(11,'J7,J8',1,202),(12,'L3',1,11),(13,'L4',1,12),(14,'R18',1,13),(15,'RV1',1,14),(16,'U7',1,15),(17,'C10',2,16),(18,'C11',2,48),(19,'C19',2,1),(20,'C3,C4,C8,C6,C18',2,18),(22,'C20',2,2),(23,'C21',2,3),(24,'C22',2,4),(25,'C23',2,158),(26,'C5',2,19),(27,'C7,C9',2,20),(28,'D1',2,21),(29,'D2',2,22),(30,'D22',2,6),(31,'D23',2,7),(32,'D24',2,8),(33,'D4,D20,D21',2,23),(34,'ISO1',2,9),(35,'J1,J5',2,24),(36,'J2,J4',2,25),(37,'J3',2,26),(38,'J7',2,44),(39,'J8',2,45),(40,'L1',2,27),(41,'L2',2,28),(42,'L3',2,11),(43,'Q1,Q2,Q5,Q7',2,29),(44,'Q3,Q4,Q6',2,30),(45,'Q8',2,31),(46,'R1,R2,R10,R21',2,32),(47,'R12,R17',2,71),(48,'R18',2,13),(49,'R19,R20',2,34),(50,'R23',2,35),(51,'R3,R6',2,36),(52,'R4,R16',2,37),(53,'R8,R13,R14,R15,R22',2,66),(54,'R7,R9',2,203),(55,'RV1,RV2',2,14),(56,'S1',2,38),(57,'U1',2,109),(59,'U4',2,39),(60,'U5',2,40),(61,'U7',2,41),(62,'U8',2,42),(63,'J6',2,43),(64,'C1',3,47),(65,'C10,C11',3,48),(66,'C18',3,49),(67,'C2',3,50),(68,'C26,C30',3,52),(69,'C3,C5,C19,C20,C21,C22,C23,C31,C54,C56,C57,C58',3,18),(70,'C59,C60',3,53),(71,'C6,C61',3,16),(72,'D10',3,23),(73,'D12,D16,D17',3,54),(74,'D14',3,55),(75,'F1',3,56),(76,'J1',3,57),(77,'J3',3,59),(78,'J7',3,61),(79,'L2,L4,L8,L9,L10',3,28),(80,'L3',3,62),(81,'LS1,LS2',3,63),(82,'Q6,Q7,Q8,Q9',3,64),(83,'R1',3,65),(85,'R10,R11,R67,R68',3,36),(86,'R2,R66,R73,R74,R75,R76',3,66),(87,'R60,R64',3,67),(88,'R61',3,68),(89,'R65',3,69),(90,'R78',3,70),(91,'R9',3,71),(92,'RV1',3,14),(93,'U1',3,72),(94,'U14',3,73),(95,'U15',3,74),(96,'U16',3,75),(97,'U2',3,76),(98,'U4',3,77),(99,'C10,C11',4,78),(100,'C12',4,79),(101,'C13',4,19),(102,'C15',4,20),(103,'C16',4,81),(104,'C17,C19',4,82),(105,'C2,C14,C18,C26,C27,C44,C53,C29',4,18),(106,'C3',4,83),(107,'C45',4,16),(108,'C50,C51',4,48),(109,'C6',4,84),(110,'C7,C9',4,85),(111,'D1',4,21),(112,'D2',4,22),(113,'D4',4,23),(114,'D5',4,86),(115,'D6',4,87),(116,'D8',4,88),(117,'J10,J11',4,89),(118,'J12',4,90),(119,'J13,J14 ',4,91),(120,'J2,J3',4,92),(121,'J7,J8',4,93),(122,'J9',4,94),(123,'L1',4,95),(124,'L2',4,99),(125,'L3,L4',4,100),(126,'L6,L7,L10,L12',4,28),(127,'L8',4,62),(128,'L9',4,27),(129,'Q2,Q3',4,29),(130,'Q5',4,30),(131,'Q6',4,101),(132,'R1,R2,R31',4,32),(133,'R13,R33,R27',4,36),(134,'R14,R24',4,37),(135,'R15,R25,R56',4,70),(136,'R26',4,65),(137,'R30',4,102),(138,'R32',4,103),(139,'R34',4,104),(140,'R35,R36',4,106),(141,'R5,R6,R23,R28',4,66),(142,'R8',4,107),(143,'S1',4,38),(144,'U15',4,76),(145,'U16,U17',4,108),(146,'U2',4,109),(147,'U4',4,98),(148,'Y1',4,97),(149,'U3',4,96),(150,'C1',5,79),(151,'C2',5,84),(152,'C3',5,83),(153,'C5,C8,C12,C15,C19,C26,C27,C28,C29,C30,C41,C44',5,18),(154,'C6,C10',5,85),(155,'C7,C13',5,78),(157,'C9,C11',5,110),(158,'C14',5,81),(159,'C16,C18',5,111),(160,'C17',5,20),(161,'C40',5,47),(162,'C43,C51 ',5,122),(164,'C45,C46,C52',5,123),(166,'D2,D3,D4,D5,D6,D7,D8,D9',5,124),(167,'D26',5,23),(168,'J3',5,125),(169,'J4,J6',5,126),(170,'J5,J7',5,127),(171,'J13,J14',5,128),(172,'J12',5,129),(174,'L1',5,95),(175,'L2',5,99),(176,'L3,L4',5,100),(177,'L5,L6,L15',5,28),(178,'L12',5,131),(179,'L14',5,112),(180,'Q1',5,114),(181,'Q5',5,115),(182,'R3,R4',5,70),(184,'R7',5,107),(186,'R9,R11,R55',5,36),(187,'R59',5,118),(188,'R68,R69,R70',5,116),(189,'S1,S2,S3,S4,S5,S6,S7,S8',5,133),(190,'U1',5,98),(191,'U3',5,98),(192,'U7',5,205),(193,'U13',5,120),(194,'Y1',5,97),(195,'BT1',6,136),(196,'C1,C6',6,137),(199,'C2,C7',6,123),(200,'C4,C8',6,138),(202,'C9,C10,C12,C13,C14,C16,C48,C56,C59,C60,C61,C63,C64,C66,C67,C68,C121,C123,C125,C127,C129,C131,C133,C142,C143,C144,C145,C146,C147,C148,C149,C150,C154',6,139),(203,'C11,C15',6,140),(204,'C49,C50,C51,C52,C53,C118,C172,C184,C185',6,159),(205,'C62,C69',6,142),(206,'C65,C70,C116,C117',6,143),(207,'C119',6,144),(209,'C152,C153',6,146),(211,'C168,C120',6,145),(212,'D1,D2,D5,D6,D7,D10',6,147),(213,'D4,D9',6,148),(214,'D11,D14',6,149),(215,'D12,D15',6,150),(216,'D13,D16',6,151),(217,'D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D48,D49',6,22),(218,'D73',6,152),(219,'ISO1,ISO2,ISO3,ISO4',6,153),(221,'J32,J33',6,154),(222,'J34',6,155),(223,'J47',6,155),(224,'L1',6,157),(225,'L2,L3',6,160),(226,'L4,L5',6,161),(227,'L19',6,28),(228,'L20',6,163),(229,'Q1',6,164),(230,'Q2,Q3',6,165),(231,'Q4,Q5,Q6,Q7,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17',6,114),(232,'RN1,RN2',6,198),(233,'R2,R7',6,168),(234,'R3',6,118),(235,'R5,R9,R19,R26,R51,R52,R53,R54,R55,R158,R169,R189,R190,R248,R268,R270',6,116),(236,'R8',6,169),(237,'R10,R12,R13,R15',6,170),(238,'R11,R14',6,171),(239,'R16,R23',6,32),(240,'R17,R22,R24,R29,R211',6,35),(242,'R18,R25',6,171),(243,'R20,R27,R95,R96,R97,R98',6,36),(244,'R21,R28,R209,R210',6,106),(245,'R37,R40,R41,R42,R43,R44,R45,R46,R47,R48,R49,R50',6,172),(246,'R56,R58,R59,R60,R159,R249,R269,R271',6,37),(247,'R61,R272,R273',6,173),(248,'R85',6,174),(249,'R86,R87,R88,R89',6,175),(250,'R90,R91',6,176),(251,'R93,R94,R171,R172,R173,R174,R175,R176,R177,R178,R263,R264,R265,R266,R267,R319,R320,R321',6,70),(252,'R99',6,177),(253,'R160,R161,R163,R316,R323',6,177),(254,'R205,R207',6,178),(255,'R206',6,179),(256,'R208',6,180),(257,'R322',6,104),(258,'SW3,SW4,SW5,SW6,SW7,SW8,SW9,SW10,SW11',6,182),(259,'U1,U3',6,120),(260,'U4,U6',6,73),(261,'U5,U7',6,74),(262,'U14',6,134),(264,'U16',6,206),(265,'SW1,SW2',6,181),(266,'U26',6,184),(267,'U27',6,185),(268,'U34',6,186),(269,'U36',6,187),(270,'U39',6,188),(271,'U40',6,189),(272,'Y2',6,190),(273,'J48',6,207),(274,'BT1',7,136),(275,'C1,C6',7,53),(276,'C2,C7',7,123),(277,'C4,C8',7,138),(279,'C11,C15',7,140),(280,'C49,C50,C51,C52,C53,C118,C186,C187,C188,C189',7,159),(282,'C65,C70,C116,C117',7,143),(283,'C152,C153',7,146),(285,'C167,C9,C10,C12,C13,C14,C16,C48,C56,C59,C60,C61,C63,C64,C66,C67,C68,C121,C123,C125,C127,C129,C131,C133,C142,C143,C144,C145,C146,C147,C148,C149,C150,C154',7,139),(286,'C62,C69',7,142),(287,'C180,C181,C182,C183',7,52),(288,'C184',7,191),(290,'C185',7,18),(291,'D1,D2,D5,D6,D7,D10,D4,D9',7,147),(292,'D29',7,208),(293,'D30,D31,D32,D33,D34,D35,D36,D37,D38,D39,D40,D41,D48,D49,D74,D75,D76,D77',7,22),(294,'F1',7,193),(295,'J1',7,194),(296,'J32,J33',7,154),(297,'J34',7,155),(298,'J39,J40,J42',7,156),(299,'J44',7,196),(300,'J45',7,197),(301,'LS2,LS3,LS6,LS9',7,63),(302,'L1',7,157),(303,'L2,L3',7,160),(304,'L19,L23',7,28),(305,'Q1',7,164),(307,'Q4,Q5,Q6,Q7,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q32,Q33,Q34,Q35',7,114),(308,'Q36,Q37,Q38,Q39,Q40,Q41,Q42,Q43',7,64),(309,'RN1,RN2',7,198),(310,'R3',7,118),(311,'R5,R9,R51,R52,R53,R54,R55,R97,R158,R189,R190,R218,R220,R222,R224',7,116),(312,'R8',7,169),(313,'R10,R12,R13,R15',7,199),(314,'R11,R14',7,171),(315,'R37,R40,R41,R42,R43,R44,R45,R46,R47,R48,R49,R50,R226,R227,R228,R229',7,172),(316,'R38',7,200),(317,'R56,R58,R59,R60,R159,R219,R221,R223,R225',7,107),(318,'R61',7,173),(319,'R85',7,174),(320,'R86,R87,R88,R89',7,175),(321,'R90,R91',7,176),(322,'R93,R94,R98,R169,R171,R172,R173,R174,R175,R176,R177,R178',7,70),(323,'R95,R96,R230,R231',7,36),(324,'R99',7,177),(325,'R160,R161,R163,R206,R207,R214,R215,R232,R233,R234,R235',7,104),(326,'SW1,SW2',7,181),(327,'SW3,SW4,SW5,SW6,SW7,SW8,SW9,SW10,SW11,SW12',7,182),(328,'U1,U3',7,120),(329,'U4,U6',7,73),(330,'U5,U7',7,74),(331,'U14',7,134),(332,'U16',7,206),(333,'U26',7,184),(334,'U27',7,185),(335,'U34',7,186),(336,'U36',7,187),(337,'U38',7,209),(338,'U42',7,201),(339,'Y2',7,190),(340,'R8,R10,R12,R14,R16,R6,R22,R23,R24,R25,R26,R27,R28,R29,R30 ',5,33);
/*!40000 ALTER TABLE `product_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_version`
--

DROP TABLE IF EXISTS `product_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_version` (
  `product_version_id` int NOT NULL AUTO_INCREMENT,
  `version_number` varchar(225) NOT NULL,
  `timestamp` datetime NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`product_version_id`),
  KEY `product_version_fk1_idx` (`product_id`),
  CONSTRAINT `product_version_fk1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_version`
--

LOCK TABLES `product_version` WRITE;
/*!40000 ALTER TABLE `product_version` DISABLE KEYS */;
INSERT INTO `product_version` VALUES (1,'V2','2021-07-02 00:00:00',1),(2,'V1','2021-07-19 00:00:00',2),(3,'V3.2','2021-07-19 00:00:00',3),(4,'V5.2','2021-07-19 00:00:00',4),(5,'V3_20DB ','2021-07-19 00:00:00',5),(6,'V7.0','2021-07-20 00:00:00',6),(7,'V4.2','2021-07-20 00:00:00',15);
/*!40000 ALTER TABLE `product_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_history`
--

DROP TABLE IF EXISTS `purchase_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_history` (
  `purchase_history_id` int NOT NULL AUTO_INCREMENT,
  `purchase_count` int NOT NULL,
  `available_count` int NOT NULL,
  `product_version_id` int NOT NULL,
  `order_id` varchar(225) NOT NULL,
  PRIMARY KEY (`purchase_history_id`),
  KEY `purchase_history_fk2_idx` (`product_version_id`),
  KEY `purchase_history_fk3_idx` (`order_id`),
  CONSTRAINT `purchase_history_fk2` FOREIGN KEY (`product_version_id`) REFERENCES `product_version` (`product_version_id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_history_fk3` FOREIGN KEY (`order_id`) REFERENCES `purchase_order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_history`
--

LOCK TABLES `purchase_history` WRITE;
/*!40000 ALTER TABLE `purchase_history` DISABLE KEYS */;
INSERT INTO `purchase_history` VALUES (1,600,600,1,'A101'),(2,600,600,2,'A101'),(3,120,120,1,'A101'),(12,150,150,1,'A102'),(13,150,150,2,'A102'),(16,220,220,3,'A101'),(17,12,12,3,'A102');
/*!40000 ALTER TABLE `purchase_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `order_id` varchar(225) NOT NULL,
  `order_date` datetime NOT NULL,
  `purchase_vendor_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `purchase_order_fk1_idx` (`purchase_vendor_id`),
  CONSTRAINT `purchase_order_fk1` FOREIGN KEY (`purchase_vendor_id`) REFERENCES `purchase_vendors` (`purchase_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES ('A101','2021-07-19 00:00:00',1),('A102','2021-07-05 00:00:00',2);
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_vendors`
--

DROP TABLE IF EXISTS `purchase_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_vendors` (
  `purchase_vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(225) NOT NULL,
  PRIMARY KEY (`purchase_vendor_id`),
  UNIQUE KEY `vendor_name_UNIQUE` (`vendor_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_vendors`
--

LOCK TABLES `purchase_vendors` WRITE;
/*!40000 ALTER TABLE `purchase_vendors` DISABLE KEYS */;
INSERT INTO `purchase_vendors` VALUES (2,'Abdul'),(1,'AmaraRaja');
/*!40000 ALTER TABLE `purchase_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_order_details`
--

DROP TABLE IF EXISTS `sell_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell_order_details` (
  `sell_order_detail_id` varchar(225) NOT NULL,
  `company_name` varchar(225) NOT NULL,
  `company_address` varchar(225) NOT NULL,
  `sell_order_date` datetime NOT NULL,
  PRIMARY KEY (`sell_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_order_details`
--

LOCK TABLES `sell_order_details` WRITE;
/*!40000 ALTER TABLE `sell_order_details` DISABLE KEYS */;
INSERT INTO `sell_order_details` VALUES ('S101','MicroSoft','Noida','2021-08-02 00:00:00');
/*!40000 ALTER TABLE `sell_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_order_product_details`
--

DROP TABLE IF EXISTS `sell_order_product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_order_product_details`
--

LOCK TABLES `sell_order_product_details` WRITE;
/*!40000 ALTER TABLE `sell_order_product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_order_product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'admin@grydsense.com','$2a$10$DwqOtk0ug7Scezi0Jt29yOfyd5d9QzmVEL8XhwYSue.7HNc38Abm.');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_files`
--

DROP TABLE IF EXISTS `version_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version_files` (
  `version_file_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(225) NOT NULL,
  `file_extension` varchar(225) DEFAULT NULL,
  `product_version_id` int NOT NULL,
  PRIMARY KEY (`version_file_id`),
  KEY `version_files_fk1_idx` (`product_version_id`),
  CONSTRAINT `version_files_fk1` FOREIGN KEY (`product_version_id`) REFERENCES `product_version` (`product_version_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_files`
--

LOCK TABLES `version_files` WRITE;
/*!40000 ALTER TABLE `version_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `version_files` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-21 16:56:52
