
CREATE DATABASE archtech;
USE archtech;


CREATE TABLE empresa (
  emp_idEmpresa INT NOT NULL,
  emp_nome VARCHAR(45) NULL,
  emp_nomeFantasia VARCHAR(45) NULL,
  emp_cnpj CHAR(14) NULL,
  emp_endereco VARCHAR(45) NULL,
  emp_email VARCHAR(45) NULL,
  emp_telefone CHAR(8) NULL,
  PRIMARY KEY (emp_idEmpresa));



CREATE TABLE representante (
  emp_idEmpresa INT,
  rpt_idRepresentante INT,
  rpt_nome VARCHAR(45) NULL,
  rpt_telefone VARCHAR(45) NULL,
  rpt_email VARCHAR(45) NULL,
  PRIMARY KEY (emp_idEmpresa, rpt_idRepresentante),
    FOREIGN KEY (emp_idEmpresa)
    REFERENCES empresa (emp_idEmpresa));



CREATE TABLE usuario (
  rpt_idRepresentante INT,
  usr_idUsuario INT,
  usr_login VARCHAR(45),
  usr_senha VARCHAR(45),
  usr_tipo CHAR(1),
  PRIMARY KEY (usr_idUsuario),
    FOREIGN KEY (rpt_idRepresentante) REFERENCES representante (rpt_idRepresentante));

CREATE TABLE gondola (
  emp_idEmpresa INT NOT NULL,
  gnd_idGondola INT NOT NULL,
  gnd_corredor INT NULL,
  gnd_setor VARCHAR(45) NULL,
  PRIMARY KEY (emp_idEmpresa, gnd_idGondola),
  INDEX fk_gondola_empresa1_idx (emp_idEmpresa ASC) VISIBLE,
  CONSTRAINT fk_gondola_empresa1
    FOREIGN KEY (emp_idEmpresa) REFERENCES empresa (emp_idEmpresa));




CREATE TABLE dados (
  gnd_idGondola INT,
  dds_idDados INT,
  dds_horaInicio TIME,
  dds_horaFinal TIME,
  dds_data DATE,
  dds_qtdPassagem INT,
  PRIMARY KEY (gnd_idGondola, dds_idDados),
  INDEX fk_dados_gondola1_idx (gnd_idGondola ASC) VISIBLE,
  CONSTRAINT fk_dados_gondola1
    FOREIGN KEY (gnd_idGondola)
    REFERENCES archtech.gondola (gnd_idGondola));
    
