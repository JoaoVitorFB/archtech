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

-- Copiando dados para a tabela archtech.corredor: ~1 rows (aproximadamente)
INSERT INTO `corredor` (`crd_idCorredor`, `crd_corredor`, `crd_setor`, `emp_idEmpresa`) VALUES
	(1, 1, 'Higiene', 2);

-- Copiando dados para a tabela archtech.dados: ~13 rows (aproximadamente)
INSERT INTO `dados` (`crd_idCorredor`, `dds_idDados`, `dds_horaInicio`, `dds_horaFinal`, `dds_data`, `dds_fluxo`) VALUES
	(1, 1, '09:00:00', '10:00:00', '2023-05-23', 50),
	(1, 2, '10:00:00', '11:00:00', '2023-05-23', 48),
	(1, 3, '11:00:00', '12:00:00', '2023-05-23', 65),
	(1, 4, '12:00:00', '13:00:00', '2023-05-23', 55),
	(1, 5, '13:00:00', '14:00:00', '2023-05-23', 48),
	(1, 6, '14:00:00', '15:00:00', '2023-05-23', 45),
	(1, 7, '15:00:00', '16:00:00', '2023-05-23', 46),
	(1, 8, '16:00:00', '17:00:00', '2023-05-23', 52),
	(1, 9, '17:00:00', '18:00:00', '2023-05-23', 46),
	(1, 10, '18:00:00', '19:00:00', '2023-05-23', 55),
	(1, 11, '19:00:00', '20:00:00', '2023-05-23', 61),
	(1, 12, '20:00:00', '21:00:00', '2023-05-23', 50),
	(1, 13, '21:00:00', '22:00:00', '2023-05-23', 37);

-- Copiando dados para a tabela archtech.empresa: ~2 rows (aproximadamente)
INSERT INTO `empresa` (`emp_idEmpresa`, `emp_nome`, `emp_nomeFantasia`, `emp_cnpj`, `emp_logradouro`, `emp_numLogradouro`, `emp_CEP`, `emp_email`, `emp_telefone`, `emp_telefoneCelular`) VALUES
	(1, 'Archtech', 'Archtech', '52118011269854', 'Avenida Rebouças', 741, '25487411', 'contato@archtech.com', '1152698521', '11965874470'),
	(2, 'São Paulo Tech School', 'SPTech', '08236658741057', 'Rua Haddock Lobo', 595, '03654725', 'contato@sptech.school', '1169987402', '11985321478');

-- Copiando dados para a tabela archtech.representante: ~5 rows (aproximadamente)
INSERT INTO `representante` (`rpt_idRepresentante`, `rpt_nome`, `rpt_celular`, `rpt_email`, `emp_idEmpresa`) VALUES
	(1, 'João Vitor Ferreira Batista', '11985090740', 'joao.batista@archtech.school', 1),
	(2, 'Vitor Hideki Nakamura', '11902140187', 'vitor.nakamura@archtech.com', 1),
	(3, 'Gilberto Santana Campos Junior', '11963365474', 'gilberto.santana@archtech.com', 1),
	(4, 'Diogo Borges Pinto', '11903214054', 'diogo.borges@archtech.com', 1),
	(5, 'Fernando Brandão', '11901474542', 'fernando.brandao@sptech.school', 2);

-- Copiando dados para a tabela archtech.usuario: ~5 rows (aproximadamente)
INSERT INTO `usuario` (`usr_idUsuario`, `usr_login`, `usr_senha`, `usr_tipo`, `rpt_idRepresentante`) VALUES
	(1, 'joao', 'joao123', '1', 1),
	(2, 'hideki', 'hideki123', '1', 2),
	(3, 'gilberto', 'gilberto123', '1', 3),
	(4, 'diogo', 'diogo123', '1', 4),
	(5, 'brandao', 'brandao123', '2', 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
