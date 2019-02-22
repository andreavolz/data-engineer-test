-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 22-Fev-2019 às 12:48
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_classification`
--

CREATE TABLE IF NOT EXISTS `tb_classification` (
  `clas_id` bigint(20) unsigned NOT NULL,
  `clas_type` varchar(128) NOT NULL,
  `clas_subtype` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_institution`
--

CREATE TABLE IF NOT EXISTS `tb_institution` (
  `inst_id` bigint(20) unsigned NOT NULL,
  `inst_name` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_production`
--

CREATE TABLE IF NOT EXISTS `tb_production` (
  `prod_id` bigint(20) unsigned NOT NULL,
  `prod_name` varchar(128) NOT NULL,
  `prod_dt_publication` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_production_classification`
--

CREATE TABLE IF NOT EXISTS `tb_production_classification` (
  `prod_clas_id` bigint(20) unsigned NOT NULL,
  `prod_id` bigint(20) unsigned NOT NULL,
  `clas_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_researcher`
--

CREATE TABLE IF NOT EXISTS `tb_researcher` (
  `res_id` bigint(20) unsigned NOT NULL,
  `res_name` varchar(128) NOT NULL,
  `res_job` varchar(128) NOT NULL,
  `res_dt_start` varchar(128) NOT NULL,
  `res_dt_end` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_researcher_production_institution`
--

CREATE TABLE IF NOT EXISTS `tb_researcher_production_institution` (
  `res_prod_inst_id` bigint(20) unsigned NOT NULL,
  `res_id` bigint(20) unsigned NOT NULL,
  `prod_id` bigint(20) unsigned NOT NULL,
  `inst_id` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

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
  MODIFY `clas_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `tb_institution`
--
ALTER TABLE `tb_institution`
  MODIFY `inst_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `tb_production`
--
ALTER TABLE `tb_production`
  MODIFY `prod_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `tb_production_classification`
--
ALTER TABLE `tb_production_classification`
  MODIFY `prod_clas_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `tb_researcher`
--
ALTER TABLE `tb_researcher`
  MODIFY `res_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `tb_researcher_production_institution`
--
ALTER TABLE `tb_researcher_production_institution`
  MODIFY `res_prod_inst_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=91;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_production_classification`
--
ALTER TABLE `tb_production_classification`
ADD CONSTRAINT `class_id` FOREIGN KEY (`clas_id`) REFERENCES `tb_classification` (`clas_id`),
ADD CONSTRAINT `prod_id_fk` FOREIGN KEY (`prod_id`) REFERENCES `tb_production` (`prod_id`);

--
-- Limitadores para a tabela `tb_researcher_production_institution`
--
ALTER TABLE `tb_researcher_production_institution`
ADD CONSTRAINT `inst_id` FOREIGN KEY (`inst_id`) REFERENCES `tb_institution` (`inst_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `tb_production` (`prod_id`),
ADD CONSTRAINT `res_id` FOREIGN KEY (`res_id`) REFERENCES `tb_researcher` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
