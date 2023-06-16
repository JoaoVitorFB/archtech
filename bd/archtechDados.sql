-- Active: 1685655382997@@127.0.0.1@3306@archtech
-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.32 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE archtech;

-- Copiando dados para a tabela archtech.corredor: ~1 rows (aproximadamente)
INSERT INTO `corredor` (`crd_idCorredor`, `crd_corredor`, `crd_setor`, `emp_idEmpresa`) VALUES
	(1, 1, 'Higiene', 2),
	(2, 2, 'Beleza e Cuidados Pessoais', 2),
	(3, 3, 'Bomboniere', 2),
	(4, 4, 'Bebidas', 2),
	(5, 5, 'Bebidas Alcólicas', 2),
	(6, 6, 'Frios', 2);

-- Copiando dados para a tabela archtech.empresa: ~2 rows (aproximadamente)
INSERT INTO `empresa` (`emp_idEmpresa`, `emp_nome`, `emp_nomeFantasia`, `emp_cnpj`, `emp_logradouro`, `emp_numLogradouro`, `emp_CEP`, `emp_email`, `emp_telefone`, `emp_telefoneCelular`) VALUES
	(1, 'Archtech', 'Archtech', '52118011269854', 'Avenida Rebouças', 741, '25487411', 'contato@archtech.com', '1152698521', '11965874470'),
	(2, 'São Paulo Tech School', 'SPTech', '08236658741057', 'Rua Haddock Lobo', 595, '03654725', 'contato@sptech.school', '1169987402', '11985321478');

-- Copiando dados para a tabela archtech.representante: ~5 rows (aproximadamente)
INSERT INTO `representante` (`rpt_idRepresentante`, `rpt_nome`, `rpt_celular`, `rpt_email`, `emp_idEmpresa`) VALUES
	(1, 'João Vitor Ferreira Batista', '11985090740', 'joao.batista@archtech.school', 1),
	(2, 'Vitor Hideki Nakamura', '11902140187', 'vitor.nakamura@archtech.com', 1),
	(3, 'Gilberto Santana Campos Junior', '11963365474', 'gilberto.santana@archtech.com', 1),
	(4, 'Diogo Borges Pinto', '11903214054', 'diogo.borges@archtech.com', 1);
	-- (5, 'Fernando Brandão', '11901474542', 'fernando.brandao@sptech.school', 2);

-- Copiando dados para a tabela archtech.usuario: ~5 rows (aproximadamente)
INSERT INTO `usuario` (`usr_idUsuario`, `usr_login`, `usr_senha`, `usr_tipo`, `rpt_idRepresentante`) VALUES
	(1, 'joao', 'joao123', '1', 1),
	(2, 'hideki', 'hideki123', '1', 2),
	(3, 'gilberto', 'gilberto123', '1', 3),
	(4, 'diogo', 'diogo123', '1', 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
