CREATE DATABASE archtech;
USE archtech ;

CREATE TABLE empresa (
  emp_idEmpresa INT AUTO_INCREMENT,
  emp_nome VARCHAR(45),
  emp_nomeFantasia VARCHAR(45),
  emp_cnpj CHAR(14),
  emp_logradouro VARCHAR(100),
  emp_numLogradouro INT,
  emp_CEP CHAR(8),
  emp_email VARCHAR(45),
  emp_telefone CHAR(10),
  emp_telefoneCelular CHAR(11),
  PRIMARY KEY (emp_idEmpresa)
);

CREATE TABLE representante (
  rpt_idRepresentante INT AUTO_INCREMENT,
  rpt_nome VARCHAR(45),
  rpt_celular CHAR(11),
  rpt_email VARCHAR(45),
  emp_idEmpresa INT,
  PRIMARY KEY (rpt_idRepresentante, emp_idEmpresa)
);

CREATE TABLE usuario (
  usr_idUsuario INT AUTO_INCREMENT,
  usr_login VARCHAR(45),
  usr_senha VARCHAR(45),
  usr_tipo CHAR(1),
  rpt_idRepresentante INT,
  PRIMARY KEY (usr_idUsuario)
);

CREATE TABLE corredor (
  crd_idCorredor INT AUTO_INCREMENT,
  crd_corredor INT,
  crd_setor VARCHAR(45),
  emp_idEmpresa INT,
  PRIMARY KEY (crd_idCorredor)
);

CREATE TABLE dados (
  crd_idCorredor INT,
  dds_idDados INT AUTO_INCREMENT,
  dds_horaInicio TIME,
  dds_horaFinal TIME,
  dds_data DATE,
  dds_fluxo INT,
  PRIMARY KEY (dds_idDados)
);


ALTER TABLE representante ADD FOREIGN KEY (emp_idEmpresa) REFERENCES empresa (emp_idEmpresa);

ALTER TABLE usuario ADD FOREIGN KEY (rpt_idRepresentante) REFERENCES representante (rpt_idRepresentante);

ALTER TABLE corredor ADD FOREIGN KEY (emp_idEmpresa) REFERENCES empresa (emp_idEmpresa);

ALTER TABLE dados ADD FOREIGN KEY (crd_idCorredor) REFERENCES corredor (crd_idCorredor);
