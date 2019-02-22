-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 22-Fev-2019 às 20:39
-- Versão do servidor: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `indeorum`
--
CREATE DATABASE IF NOT EXISTS `indeorum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `indeorum`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_classification`
--

DROP TABLE IF EXISTS `tb_classification`;
CREATE TABLE IF NOT EXISTS `tb_classification` (
  `clas_id` bigint(20) unsigned NOT NULL,
  `clas_type` varchar(128) NOT NULL,
  `clas_subtype` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_classification`
--

INSERT INTO `tb_classification` (`clas_id`, `clas_type`, `clas_subtype`) VALUES(141, 'bibliograficas', 'other');
INSERT INTO `tb_classification` (`clas_id`, `clas_type`, `clas_subtype`) VALUES(142, 'bibliograficas', 'journal');
INSERT INTO `tb_classification` (`clas_id`, `clas_type`, `clas_subtype`) VALUES(143, 'bibliograficas', 'article');
INSERT INTO `tb_classification` (`clas_id`, `clas_type`, `clas_subtype`) VALUES(144, 'bibliograficas', 'book');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution`
--

DROP TABLE IF EXISTS `tb_institution`;
CREATE TABLE IF NOT EXISTS `tb_institution` (
  `inst_id` bigint(20) unsigned NOT NULL,
  `inst_name` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_institution`
--

INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(126, 'Brown-Williams Research Institute');
INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(121, 'Faulkner-Fox University');
INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(128, 'Jordan-Watts Company');
INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(123, 'Morris-Copeland University');
INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(130, 'Obrien-Bailey University');
INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(122, 'Reynolds PLC Research Institute');
INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(125, 'Robinson LLC Company');
INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(127, 'Thomas Ltd Research Institute');
INSERT INTO `tb_institution` (`inst_id`, `inst_name`) VALUES(129, 'West-Walton Research Institute');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_production`
--

DROP TABLE IF EXISTS `tb_production`;
CREATE TABLE IF NOT EXISTS `tb_production` (
  `prod_id` bigint(20) unsigned NOT NULL,
  `prod_name` varchar(128) NOT NULL,
  `prod_dt_publication` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_production`
--

INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(121, 'Phased impactful capability', '1994-12-17');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(122, 'Multi-layered hybrid moderator', '1978-03-08');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(123, 'Optional real-time Graphical User Interface', '2016-09-01');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(124, 'Universal tertiary access', '2007-04-29');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(125, 'Optional empowering monitoring', '2017-03-06');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(126, 'Implemented encompassing project', '2018-09-30');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(127, 'Devolved mobile knowledgebase', '2009-08-13');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(128, 'Secured context-sensitive artificial intelligence', '2018-11-08');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(129, 'Compatible national system engine', '2016-12-23');
INSERT INTO `tb_production` (`prod_id`, `prod_name`, `prod_dt_publication`) VALUES(130, 'Mandatory zero administration functionalities', '2014-01-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_production_classification`
--

DROP TABLE IF EXISTS `tb_production_classification`;
CREATE TABLE IF NOT EXISTS `tb_production_classification` (
  `prod_clas_id` bigint(20) unsigned NOT NULL,
  `prod_id` bigint(20) unsigned NOT NULL,
  `clas_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_production_classification`
--

INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(121, 121, 142);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(122, 122, 141);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(123, 123, 143);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(124, 124, 142);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(125, 125, 142);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(126, 126, 141);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(127, 127, 141);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(128, 128, 144);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(129, 129, 142);
INSERT INTO `tb_production_classification` (`prod_clas_id`, `prod_id`, `clas_id`) VALUES(130, 130, 144);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_researcher`
--

DROP TABLE IF EXISTS `tb_researcher`;
CREATE TABLE IF NOT EXISTS `tb_researcher` (
  `res_id` bigint(20) unsigned NOT NULL,
  `res_name` varchar(128) NOT NULL,
  `res_job` varchar(128) NOT NULL,
  `res_dt_start` varchar(128) NOT NULL,
  `res_dt_end` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_researcher`
--

INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(121, 'Alexis', 'Insurance broker', '2008-09-10', NULL);
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(122, 'Brian', 'Interpreter', '2009-11-28', NULL);
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(123, 'Rebecca Duncan', 'Geophysical data processor', '2010-05-21', '2018-05-28');
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(124, 'Joanne', 'Futures trader', '2009-09-14', NULL);
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(125, 'Justin', 'Therapist, occupational', '2008-05-14', NULL);
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(126, 'Emma Wheeler', 'Counselling psychologist', '2011-01-16', '2017-05-28');
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(127, 'Henry', 'Surveyor, building control', '2008-05-09', NULL);
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(128, 'Christopher Wilson', 'Psychologist, sport and exercise', '2009-12-02', '2018-11-13');
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(129, 'Kiara Flores', 'Surgeon', '2010-05-27', '2014-04-14');
INSERT INTO `tb_researcher` (`res_id`, `res_name`, `res_job`, `res_dt_start`, `res_dt_end`) VALUES(130, 'Craig Hood', 'Drilling engineer', '2012-10-21', '2014-05-02');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_researcher_production_institution`
--

DROP TABLE IF EXISTS `tb_researcher_production_institution`;
CREATE TABLE IF NOT EXISTS `tb_researcher_production_institution` (
  `res_prod_inst_id` bigint(20) unsigned NOT NULL,
  `res_id` bigint(20) unsigned NOT NULL,
  `prod_id` bigint(20) unsigned NOT NULL,
  `inst_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_researcher_production_institution`
--

INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(121, 121, 121, 121);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(122, 122, 122, 122);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(123, 123, 123, 123);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(124, 124, 124, 121);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(125, 125, 125, 125);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(126, 126, 126, 126);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(127, 127, 127, 127);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(128, 128, 128, 128);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(129, 129, 129, 129);
INSERT INTO `tb_researcher_production_institution` (`res_prod_inst_id`, `res_id`, `prod_id`, `inst_id`) VALUES(130, 130, 130, 130);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_classification`
--
ALTER TABLE `tb_classification`
  ADD PRIMARY KEY (`clas_id`), ADD UNIQUE KEY `clas_id` (`clas_id`), ADD UNIQUE KEY `clas_subtype` (`clas_subtype`);

--
-- Indexes for table `tb_institution`
--
ALTER TABLE `tb_institution`
  ADD PRIMARY KEY (`inst_id`), ADD UNIQUE KEY `id_institution` (`inst_id`), ADD UNIQUE KEY `inst_name` (`inst_name`);

--
-- Indexes for table `tb_production`
--
ALTER TABLE `tb_production`
  ADD PRIMARY KEY (`prod_id`), ADD UNIQUE KEY `id_production` (`prod_id`);

--
-- Indexes for table `tb_production_classification`
--
ALTER TABLE `tb_production_classification`
  ADD PRIMARY KEY (`prod_clas_id`), ADD UNIQUE KEY `prod_clas_id` (`prod_clas_id`), ADD KEY `prod_id` (`prod_id`), ADD KEY `clas_id` (`clas_id`);

--
-- Indexes for table `tb_researcher`
--
ALTER TABLE `tb_researcher`
  ADD PRIMARY KEY (`res_id`), ADD UNIQUE KEY `id_researcher` (`res_id`);

--
-- Indexes for table `tb_researcher_production_institution`
--
ALTER TABLE `tb_researcher_production_institution`
  ADD PRIMARY KEY (`res_prod_inst_id`), ADD UNIQUE KEY `res_prod_inst_id` (`res_prod_inst_id`), ADD KEY `inst_id` (`inst_id`), ADD KEY `prod_id` (`prod_id`), ADD KEY `res_id_fk` (`res_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_classification`
--
ALTER TABLE `tb_classification`
  MODIFY `clas_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `tb_institution`
--
ALTER TABLE `tb_institution`
  MODIFY `inst_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `tb_production`
--
ALTER TABLE `tb_production`
  MODIFY `prod_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `tb_production_classification`
--
ALTER TABLE `tb_production_classification`
  MODIFY `prod_clas_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `tb_researcher`
--
ALTER TABLE `tb_researcher`
  MODIFY `res_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `tb_researcher_production_institution`
--
ALTER TABLE `tb_researcher_production_institution`
  MODIFY `res_prod_inst_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_production_classification`
--
ALTER TABLE `tb_production_classification`
ADD CONSTRAINT `class_id` FOREIGN KEY (`clas_id`) REFERENCES `tb_classification` (`clas_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `prod_id_fk` FOREIGN KEY (`prod_id`) REFERENCES `tb_production` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tb_researcher_production_institution`
--
ALTER TABLE `tb_researcher_production_institution`
ADD CONSTRAINT `inst_id` FOREIGN KEY (`inst_id`) REFERENCES `tb_institution` (`inst_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `tb_production` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `res_id` FOREIGN KEY (`res_id`) REFERENCES `tb_researcher` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
