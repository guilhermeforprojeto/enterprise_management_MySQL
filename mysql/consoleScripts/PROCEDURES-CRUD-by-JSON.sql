CREATE PROCEDURE departamento_crud(
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Departamento(Nome_Departamento) VALUES(JSON_EXTRACT(json_str, '$.Nome_Departamento'));
  ELSEIF op = 'update' THEN
    UPDATE Departamento SET Nome_Departamento = JSON_EXTRACT(json_str, '$.Nome_Departamento') WHERE ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento');
  ELSEIF op = 'delete' THEN
    DELETE FROM Departamento WHERE ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento');
  ELSEIF op = 'read' THEN
    SELECT * FROM Departamento WHERE ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento');
  END IF;
END;


SHOW CREATE PROCEDURE departamento_crud;


CREATE PROCEDURE funcionario_crud (
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Funcionario (
      ID_Funcionario,
      Nome_Funcionario,
      CPF_Funcionario,
      RG_Funcionario,
      Sexo_Funcionario,
      Data_Nascimento_Funcionario,
      Possui_Habilitacao_Funcionario,
      Salario_Funcionario,
      Carga_Horaria_Semanal_Funcionario,
      ID_Departamento
    )
    VALUES (
      JSON_EXTRACT(json_str, '$.ID_Funcionario'),
      JSON_EXTRACT(json_str, '$.Nome_Funcionario'),
      JSON_EXTRACT(json_str, '$.CPF_Funcionario'),
      JSON_EXTRACT(json_str, '$.RG_Funcionario'),
      JSON_EXTRACT(json_str, '$.Sexo_Funcionario'),
      JSON_EXTRACT(json_str, '$.Data_Nascimento_Funcionario'),
      JSON_EXTRACT(json_str, '$.Possui_Habilitacao_Funcionario'),
      JSON_EXTRACT(json_str, '$.Salario_Funcionario'),
      JSON_EXTRACT(json_str, '$.Carga_Horaria_Semanal_Funcionario'),
      JSON_EXTRACT(json_str, '$.ID_Departamento')
    );
  ELSEIF op = 'update' THEN
    UPDATE Funcionario 
    SET 
      Nome_Funcionario = JSON_EXTRACT(json_str, '$.Nome_Funcionario'),
      CPF_Funcionario = JSON_EXTRACT(json_str, '$.CPF_Funcionario'),
      RG_Funcionario = JSON_EXTRACT(json_str, '$.RG_Funcionario'),
      Sexo_Funcionario = JSON_EXTRACT(json_str, '$.Sexo_Funcionario'),
      Data_Nascimento_Funcionario = JSON_EXTRACT(json_str, '$.Data_Nascimento_Funcionario'),
      Possui_Habilitacao_Funcionario = JSON_EXTRACT(json_str, '$.Possui_Habilitacao_Funcionario'),
      Salario_Funcionario = JSON_EXTRACT(json_str, '$.Salario_Funcionario'),
      Carga_Horaria_Semanal_Funcionario = JSON_EXTRACT(json_str, '$.Carga_Horaria_Semanal_Funcionario'),
      ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento')
    WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
  ELSEIF op = 'delete' THEN
    DELETE FROM Funcionario WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
  ELSEIF op = 'select' THEN
    SELECT * FROM Funcionario WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
  END IF;
END;

SHOW CREATE PROCEDURE funcionario_crud




CREATE PROCEDURE projeto_crud(
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Projeto(Nome_Projeto, Data_Inicio, Data_Fim, Orcamento, ID_Departamento) 
    VALUES(JSON_EXTRACT(json_str, '$.Nome_Projeto'), JSON_EXTRACT(json_str, '$.Data_Inicio'), 
           JSON_EXTRACT(json_str, '$.Data_Fim'), JSON_EXTRACT(json_str, '$.Orcamento'), 
           JSON_EXTRACT(json_str, '$.ID_Departamento'));
  ELSEIF op = 'update' THEN
    UPDATE Projeto SET Nome_Projeto = JSON_EXTRACT(json_str, '$.Nome_Projeto'), 
           Data_Inicio = JSON_EXTRACT(json_str, '$.Data_Inicio'), 
           Data_Fim = JSON_EXTRACT(json_str, '$.Data_Fim'), 
           Orcamento = JSON_EXTRACT(json_str, '$.Orcamento'), 
           ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento')
    WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  ELSEIF op = 'delete' THEN
    DELETE FROM Projeto WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  ELSEIF op = 'read' THEN
    SELECT * FROM Projeto WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  END IF;
END;

SHOW CREATE PROCEDURE projeto_crud



CREATE PROCEDURE trabalho_crud(
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Trabalho(Titulo_Trabalho, Descricao_Trabalho, Data_Inicio_Trabalho, Data_Fim_Trabalho, Status_Trabalho, ID_Funcionario, ID_Projeto)
    VALUES(JSON_EXTRACT(json_str, '$.Titulo_Trabalho'), JSON_EXTRACT(json_str, '$.Descricao_Trabalho'), JSON_EXTRACT(json_str, '$.Data_Inicio_Trabalho'),
           JSON_EXTRACT(json_str, '$.Data_Fim_Trabalho'), JSON_EXTRACT(json_str, '$.Status_Trabalho'), JSON_EXTRACT(json_str, '$.ID_Funcionario'), 
           JSON_EXTRACT(json_str, '$.ID_Projeto'));
  ELSEIF op = 'update' THEN
    UPDATE Trabalho SET Titulo_Trabalho = JSON_EXTRACT(json_str, '$.Titulo_Trabalho'), Descricao_Trabalho = JSON_EXTRACT(json_str, '$.Descricao_Trabalho'),
           Data_Inicio_Trabalho = JSON_EXTRACT(json_str, '$.Data_Inicio_Trabalho'), Data_Fim_Trabalho = JSON_EXTRACT(json_str, '$.Data_Fim_Trabalho'),
           Status_Trabalho = JSON_EXTRACT(json_str, '$.Status_Trabalho'), ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario'), 
           ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto')
    WHERE ID_Trabalho = JSON_EXTRACT(json_str, '$.ID_Trabalho');
  ELSEIF op = 'delete' THEN
    DELETE FROM Trabalho WHERE ID_Trabalho = JSON_EXTRACT(json_str, '$.ID_Trabalho');
  ELSEIF op = 'read' THEN
    SELECT * FROM Trabalho WHERE ID_Trabalho = JSON_EXTRACT(json_str, '$.ID_Trabalho');
  END IF;
END;


SHOW CREATE PROCEDURE trabalho_crud;




CREATE TABLE Supervisao (
  ID_Supervisao INT(4) PRIMARY KEY,
  Data_Inicio_Supervisao DATE,
  Data_Fim_Supervisao DATE,
  ID_Projeto INT(4),
  ID_Funcionario INT(4),
  FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
  FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE PROCEDURE supervisao_crud(
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Supervisao(Data_Inicio_Supervisao, Data_Fim_Supervisao, ID_Projeto, ID_Funcionario) 
    VALUES(JSON_EXTRACT(json_str, '$.Data_Inicio_Supervisao'), JSON_EXTRACT(json_str, '$.Data_Fim_Supervisao'),
           JSON_EXTRACT(json_str, '$.ID_Projeto'), JSON_EXTRACT(json_str, '$.ID_Funcionario'));
  ELSEIF op = 'update' THEN
    UPDATE Supervisao SET Data_Inicio_Supervisao = JSON_EXTRACT(json_str, '$.Data_Inicio_Supervisao'), 
    Data_Fim_Supervisao = JSON_EXTRACT(json_str, '$.Data_Fim_Supervisao'), 
    ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto'), 
    ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario') 
    WHERE ID_Supervisao = JSON_EXTRACT(json_str, '$.ID_Supervisao');
  ELSEIF op = 'delete' THEN
    DELETE FROM Supervisao WHERE ID_Supervisao = JSON_EXTRACT(json_str, '$.ID_Supervisao');
  ELSEIF op = 'read' THEN
    SELECT * FROM Supervisao WHERE ID_Supervisao = JSON_EXTRACT(json_str, '$.ID_Supervisao');
  END IF;
END;

SHOW CREATE PROCEDURE supervisao_crud;

