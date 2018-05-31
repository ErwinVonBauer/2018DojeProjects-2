-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: groupware
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `approval`
--

DROP TABLE IF EXISTS `approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval` (
  `aprov_ai` int(11) NOT NULL AUTO_INCREMENT COMMENT '결재기본키',
  `draft_ai` int(11) NOT NULL COMMENT '기안기본키',
  `user_ai` int(11) NOT NULL COMMENT '유저기본키',
  `dep_ai` int(11) NOT NULL COMMENT '부서기본키',
  `rank_ai` int(11) NOT NULL COMMENT '직급기본키',
  `apl_ai` int(11) NOT NULL COMMENT '결재라인기본키',
  `aprov_reg` timestamp NULL DEFAULT NULL COMMENT '결재등록시간',
  `aprov_status` int(11) DEFAULT NULL,
  `aprov_title` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`aprov_ai`,`draft_ai`,`user_ai`,`dep_ai`,`rank_ai`,`apl_ai`),
  KEY `FK_user_TO_approval` (`user_ai`,`dep_ai`,`rank_ai`),
  KEY `FK_approvalline_TO_approval` (`apl_ai`),
  CONSTRAINT `FK_approvalline_TO_approval` FOREIGN KEY (`apl_ai`) REFERENCES `approvalline` (`apl_ai`),
  CONSTRAINT `FK_user_TO_approval` FOREIGN KEY (`user_ai`, `dep_ai`, `rank_ai`) REFERENCES `user` (`user_ai`, `dep_ai`, `rank_ai`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='결재';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval`
--

LOCK TABLES `approval` WRITE;
/*!40000 ALTER TABLE `approval` DISABLE KEYS */;
INSERT INTO `approval` VALUES (3,6,4,2,2,1,'2018-05-31 02:17:26',1,'휴가결재1'),(4,6,3,1,1,1,'2018-05-31 06:36:24',1,'두번째결재'),(5,10,3,1,1,6,'2018-05-31 06:57:10',1,'두번째결재');
/*!40000 ALTER TABLE `approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvalline`
--

DROP TABLE IF EXISTS `approvalline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approvalline` (
  `apl_ai` int(11) NOT NULL AUTO_INCREMENT COMMENT '결재라인기본키',
  `apl_content` varchar(1500) DEFAULT NULL COMMENT '결재라인내용',
  `apl_name` varchar(500) DEFAULT NULL COMMENT '결재라인이름',
  `apl_memo` varchar(1000) NOT NULL COMMENT '결재라인메모',
  PRIMARY KEY (`apl_ai`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='결재라인';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvalline`
--

LOCK TABLES `approvalline` WRITE;
/*!40000 ALTER TABLE `approvalline` DISABLE KEYS */;
INSERT INTO `approvalline` VALUES (1,'테스트용결재라인입니다','첫결재','첫 결재라인'),(5,'이준용,기획부,대리\r\n이번 결재 담당자입니다','두번째결재라인','간단한두번째결재라인'),(6,'관리자,총무부,사원','세번째결재라인','3번째결재라인');
/*!40000 ALTER TABLE `approvalline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dep_ai` int(11) NOT NULL AUTO_INCREMENT COMMENT '부서기본키',
  `dep_name` varchar(700) DEFAULT NULL COMMENT '부서명칭',
  PRIMARY KEY (`dep_ai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='부서';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'총무부'),(2,'기획부');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `doc_ai` int(11) NOT NULL AUTO_INCREMENT COMMENT '문서기본키',
  `apl_ai` int(11) DEFAULT NULL COMMENT '결재라인기본키',
  `draft_ai` int(11) DEFAULT NULL COMMENT '기안기본키',
  `user_ai` int(11) DEFAULT NULL COMMENT '유저기본키',
  `dep_ai` int(11) DEFAULT NULL COMMENT '부서기본키',
  `rank_ai` int(11) DEFAULT NULL COMMENT '직급기본키',
  PRIMARY KEY (`doc_ai`),
  KEY `apl_ai` (`apl_ai`),
  KEY `FK_draft_TO_document` (`draft_ai`,`user_ai`,`dep_ai`,`rank_ai`),
  CONSTRAINT `FK_draft_TO_document` FOREIGN KEY (`draft_ai`, `user_ai`, `dep_ai`, `rank_ai`) REFERENCES `draft` (`draft_ai`, `user_ai`, `dep_ai`, `rank_ai`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`apl_ai`) REFERENCES `approvalline` (`apl_ai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='문서관리';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `draft`
--

DROP TABLE IF EXISTS `draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `draft` (
  `draft_ai` int(11) NOT NULL AUTO_INCREMENT COMMENT '기안기본키',
  `user_ai` int(11) NOT NULL COMMENT '유저기본키',
  `dep_ai` int(11) NOT NULL COMMENT '부서기본키',
  `rank_ai` int(11) NOT NULL COMMENT '직급기본키',
  `draft_name` varchar(500) NOT NULL COMMENT '문서이름',
  `draft_content` varchar(2000) NOT NULL COMMENT '문서내용',
  `draft_type` varchar(200) NOT NULL COMMENT '문서종류',
  `draft_temp` int(11) DEFAULT NULL COMMENT '임시저장여부',
  `draft_important` int(11) DEFAULT NULL COMMENT '중요문서여부',
  PRIMARY KEY (`draft_ai`,`user_ai`,`dep_ai`,`rank_ai`),
  KEY `FK_user_TO_draft` (`user_ai`,`dep_ai`,`rank_ai`),
  CONSTRAINT `FK_user_TO_draft` FOREIGN KEY (`user_ai`, `dep_ai`, `rank_ai`) REFERENCES `user` (`user_ai`, `dep_ai`, `rank_ai`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='문서작성(기안)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `draft`
--

LOCK TABLES `draft` WRITE;
/*!40000 ALTER TABLE `draft` DISABLE KEYS */;
INSERT INTO `draft` VALUES (6,1,1,1,'휴가보내주세요-수정됨','<p>&nbsp;</p><p>제목이곧내용-수정되었어요l</p>\r\n	\r\n	\r\n	\r\n	','report',0,1),(10,4,2,2,'휴가문서2','<p>두번째 휴가문서</p>','vacation',0,1);
/*!40000 ALTER TABLE `draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `rank_ai` int(11) NOT NULL AUTO_INCREMENT COMMENT '직급기본키',
  `rank_name` varchar(500) DEFAULT NULL COMMENT '직급명칭',
  PRIMARY KEY (`rank_ai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='직급';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (1,'사원'),(2,'대리');
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_ai` int(11) NOT NULL AUTO_INCREMENT COMMENT '유저기본키',
  `dep_ai` int(11) NOT NULL DEFAULT '1' COMMENT '부서기본키',
  `rank_ai` int(11) NOT NULL DEFAULT '1' COMMENT '직급기본키',
  `user_id` varchar(300) NOT NULL COMMENT '유저아이디',
  `user_pw` varchar(300) NOT NULL COMMENT '유저비밀번호',
  `user_name` varchar(150) NOT NULL COMMENT '유저이름',
  `user_reg` timestamp NULL DEFAULT NULL COMMENT '유저등록시간',
  PRIMARY KEY (`user_ai`,`dep_ai`,`rank_ai`),
  KEY `FK_department_TO_user` (`dep_ai`),
  KEY `FK_rank_TO_user` (`rank_ai`),
  CONSTRAINT `FK_department_TO_user` FOREIGN KEY (`dep_ai`) REFERENCES `department` (`dep_ai`),
  CONSTRAINT `FK_rank_TO_user` FOREIGN KEY (`rank_ai`) REFERENCES `rank` (`rank_ai`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='유저';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,1,'test1234','1234','이준용','2018-04-04 08:33:28'),(2,1,1,'ljlj','','이ㅑㅐ','2018-04-09 23:38:55'),(3,1,1,'admin','1234','관리자','2018-04-19 04:42:14'),(4,2,2,'test1','1234','이준용','2018-05-09 08:02:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-31 16:01:13
