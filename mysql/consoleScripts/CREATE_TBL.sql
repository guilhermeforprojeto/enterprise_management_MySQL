###########################################################
-- Criar uma tabela por vez devido das chaves estrangeiras 
###########################################################


CREATE TABLE Departamento (
  ID_Departamento INT(4) PRIMARY KEY,
  Nome_Departamento VARCHAR(40)
);

CREATE TABLE Funcionario (
  ID_Funcionario INT(4) PRIMARY KEY,
  Nome_Funcionario VARCHAR(40),
  CPF_Funcionario VARCHAR(11),
  RG_Funcionario VARCHAR(9),
  Sexo_Funcionario VARCHAR(9),
  Data_Nascimento_Funcionario DATE,
  Possui_Habilitacao_Funcionario BOOLEAN,
  Salario_Funcionario VARCHAR(9),
  Carga_Horaria_Semanal_Funcionario VARCHAR(9),
  ID_Departamento INT(4),
  FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);



CREATE TABLE Projeto (
  ID_Projeto INT(4) PRIMARY KEY,
  Nome_Projeto VARCHAR(40),
  Quantidade_Horas_Necessarias INT(4),
  Prazo_Estimado INT(4),
  Quantidade_Horas_Realizadas INT(4),
  Data_Ultimo_Calculo_Horas DATE,
  ID_Departamento INT(4),
  ID_Funcionario_Supervisor INT(4),
  FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
  FOREIGN KEY (ID_Funcionario_Supervisor) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Trabalho (
ID_Trabalho INT(4) PRIMARY KEY,
ID_Funcionario INT(4),
ID_Projeto INT(4),
FOREIGN KEY  (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario),
FOREIGN KEY (ID_Projeto) REFERENCES  Projeto(ID_Projeto),
Quantidade_Horas_Trabalhadas INT(4),
Data_Inicio_Trabalho DATE,
Data_Fim_Trabalho DATE
);

CREATE TABLE Supervisao(
ID_Supervisao INT(4) PRIMARY KEY,
ID_Funcionario_Supervisor  INT(4),
ID_Projeto  INT(4),
FOREIGN KEY (ID_Funcionario_Supervisor) REFERENCES Funcionario(ID_Funcionario),
FOREIGN KEY (ID_Projeto) REFERENCES  Projeto(ID_Projeto),
Carga_Horaria_Semana_Supervisao  INT(4)
);