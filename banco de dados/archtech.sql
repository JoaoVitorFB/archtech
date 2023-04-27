CREATE DATABASE archtech;
USE archtech;


CREATE TABLE empresa (
  emp_idEmpresa INT AUTO_INCREMENT NOT NULL,
  emp_nome VARCHAR(45) NULL,
  emp_nomeFantasia VARCHAR(45) NULL,
  emp_cnpj CHAR(14) NULL,
  emp_endereco VARCHAR(45) NULL,
  emp_email VARCHAR(45) NULL,
  emp_telefone CHAR(8) NULL,
  PRIMARY KEY (emp_idEmpresa));



CREATE TABLE representante (
  emp_idEmpresa INT,
  rpt_idRepresentante INT AUTO_INCREMENT,
  rpt_nome VARCHAR(45) NULL,
  rpt_telefone VARCHAR(45) NULL,
  rpt_email VARCHAR(45) NULL,
  PRIMARY KEY (emp_idEmpresa, rpt_idRepresentante)
	);



CREATE TABLE usuario (
  rpt_idRepresentante INT,
  usr_idUsuario INT AUTO_INCREMENT,
  usr_login VARCHAR(45),
  usr_senha VARCHAR(45),
  usr_tipo CHAR(1),
  PRIMARY KEY (usr_idUsuario)
);

CREATE TABLE gondola (
  emp_idEmpresa INT NOT NULL,
  gnd_idGondola INT AUTO_INCREMENT NOT NULL,
  gnd_corredor INT NULL,
  gnd_setor VARCHAR(45) NULL,
  PRIMARY KEY (emp_idEmpresa, gnd_idGondola)
);




CREATE TABLE dados (
  gnd_idGondola INT,
  dds_idDados INT AUTO_INCREMENT,
  dds_horaInicio TIME,
  dds_horaFinal TIME,
  dds_data DATE,
  dds_qtdPassagem INT,
  PRIMARY KEY (gnd_idGondola, dds_idDados)
  );
    
ALTER TABLE representante ADD FOREIGN KEY (emp_idEmpresa) REFERENCES empresa (emp_idEmpresa);
ALTER TABLE usuario ADD FOREIGN KEY (rpt_idRepresentante) REFERENCES representante (rpt_idRepresentante);
ALTER TABLE gondola ADD FOREIGN KEY (emp_idEmpresa) REFERENCES empresa (emp_idEmpresa);
ALTER TABLE dados ADD FOREIGN KEY (gnd_idGondola) REFERENCES archtech.gondola (gnd_idGondola);
