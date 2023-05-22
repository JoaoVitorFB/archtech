-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
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
	(1, 1, 'Higiene', 1);

-- Copiando dados para a tabela archtech.dados: ~0 rows (aproximadamente)

-- Copiando dados para a tabela archtech.empresa: ~1 rows (aproximadamente)
INSERT INTO `empresa` (`emp_idEmpresa`, `emp_nome`, `emp_nomeFantasia`, `emp_cnpj`, `emp_logradouro`, `emp_numlogradouro`, `emp_CEP`, `emp_email`, `emp_telefone`, `emp_telefoneCelular`) VALUES
	(1, 'São Paulo Tech School', 'SP Tech', '01236547854785', 'Haddock Lobo', 595, '01485477', 'contato@sptech.school', '1156617632', '11987456329');

-- Copiando dados para a tabela archtech.representante: ~1 rows (aproximadamente)
INSERT INTO `representante` (`rpt_idRepresentante`, `rpt_nome`, `rpt_celular`, `rpt_email`, `emp_idEmpresa`) VALUES
	(1, 'Fernando Brandão', '11963256585', 'fernando.brandao@sptech.school', 1);

-- Copiando dados para a tabela archtech.usuario: ~2 rows (aproximadamente)
INSERT INTO `usuario` (`usr_idUsuario`, `usr_login`, `usr_senha`, `usr_tipo`, `rpt_idRepresentante`) VALUES
	(1, 'brandao', 'brandao123', '1', 1),
	(2, 'joao', 'joao123', '2', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
