-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`empresa` (
  `emp_idEmpresa` INT NOT NULL,
  `emp_nome` VARCHAR(45) NULL,
  `emp_nomeFantasia` VARCHAR(45) NULL,
  `emp_cnpj` CHAR(14) NULL,
  `emp_endereco` VARCHAR(45) NULL,
  `emp_email` VARCHAR(45) NULL,
  `emp_telefone` CHAR(8) NULL,
  PRIMARY KEY (`emp_idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`representante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`representante` (
  `emp_idEmpresa` INT NOT NULL,
  `rpt_idRepresentante` INT NOT NULL,
  `rpt_nome` VARCHAR(45) NULL,
  `rpt_telefone` VARCHAR(45) NULL,
  `rpt_email` VARCHAR(45) NULL,
  PRIMARY KEY (`emp_idEmpresa`, `rpt_idRepresentante`),
  INDEX `fk_representante_empresa1_idx` (`emp_idEmpresa` ASC) VISIBLE,
  CONSTRAINT `fk_representante_empresa1`
    FOREIGN KEY (`emp_idEmpresa`)
    REFERENCES `mydb`.`empresa` (`emp_idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `rpt_idRepresentante` INT NOT NULL,
  `usr_idUsuario` INT NOT NULL,
  `usr_login` VARCHAR(45) NULL,
  `usr_senha` VARCHAR(45) NULL,
  PRIMARY KEY (`rpt_idRepresentante`, `usr_idUsuario`),
  INDEX `fk_usuario_representante1_idx` (`rpt_idRepresentante` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_representante1`
    FOREIGN KEY (`rpt_idRepresentante`)
    REFERENCES `mydb`.`representante` (`rpt_idRepresentante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gondola`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gondola` (
  `gnd_idGondola` INT NOT NULL,
  `gnd_corredor` INT NULL,
  `gnd_setor` VARCHAR(45) NULL,
  PRIMARY KEY (`gnd_idGondola`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dados` (
  `gnd_idGondola` INT NOT NULL,
  `dds_idDados` INT NOT NULL,
  `dds_horaInicio` TIME NULL,
  `dds_horaFinal` TIME NULL,
  `dds_data` DATE NULL,
  `dds_qtdPassagem` VARCHAR(45) NULL,
  PRIMARY KEY (`gnd_idGondola`, `dds_idDados`),
  INDEX `fk_dados_gondola1_idx` (`gnd_idGondola` ASC) VISIBLE,
  CONSTRAINT `fk_dados_gondola1`
    FOREIGN KEY (`gnd_idGondola`)
    REFERENCES `mydb`.`gondola` (`gnd_idGondola`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
 