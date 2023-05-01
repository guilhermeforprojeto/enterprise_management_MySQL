CREATE TRIGGER 002trg_atualiza_horas_realizadas
BEFORE INSERT ON Funcionario_Projeto
FOR EACH ROW
BEGIN
  DECLARE semanas_passadas DECIMAL(10,2);
  DECLARE horas_trabalhadas INT;
  
  SELECT TIMESTAMPDIFF(WEEK, COALESCE(p.Data_Ultimo_Calculo_Horas, NOW()), NOW()) INTO semanas_passadas
  FROM Projeto p WHERE p.ID_Projeto = NEW.ID_Projeto;
  
  SELECT SUM(fp.Carga_Horaria) INTO horas_trabalhadas
  FROM Funcionario_Projeto fp
  WHERE fp.ID_Projeto = NEW.ID_Projeto;
  
  UPDATE Projeto SET Data_Ultimo_Calculo_Horas = NOW() WHERE ID_Projeto = NEW.ID_Projeto;
  
  IF semanas_passadas <= 0 THEN
    UPDATE Projeto SET Quantidade_Horas_Realizadas = Quantidade_Horas_Realizadas + horas_trabalhadas
    WHERE ID_Projeto = NEW.ID_Projeto;
  ELSE
    UPDATE Projeto SET Quantidade_Horas_Realizadas = Quantidade_Horas_Realizadas + (horas_trabalhadas * semanas_passadas)
    WHERE ID_Projeto = NEW.ID_Projeto;
  END IF;
END;

-- INSERTS PARA TESTE DA TRIGGER


-- Inserir Departamentos
INSERT INTO Departamento (Nome_Departamento) VALUES ('Departamento 1');
INSERT INTO Departamento (Nome_Departamento) VALUES ('Departamento 2');

-- Inserir Funcionários
INSERT INTO Funcionario (Nome_Funcionario, CPF_Funcionario, RG_Funcionario, Sexo_Funcionario, Data_Nascimento_Funcionario, Possui_Habilitacao_Funcionario, Salario_Funcionario, Carga_Horaria_Semanal_Funcionario, ID_Departamento) 
VALUES ('Funcionario 1', '12345678901', '12345678', 'Masculino', '1990-01-01', 1, '1000.00', 40, 1);

INSERT INTO Funcionario (Nome_Funcionario, CPF_Funcionario, RG_Funcionario, Sexo_Funcionario, Data_Nascimento_Funcionario, Possui_Habilitacao_Funcionario, Salario_Funcionario, Carga_Horaria_Semanal_Funcionario, ID_Departamento) 
VALUES ('Funcionario 2', '23456789012', '23456789', 'Feminino', '1995-01-01', 0, '800.00', 30, 1);

INSERT INTO Funcionario (Nome_Funcionario, CPF_Funcionario, RG_Funcionario, Sexo_Funcionario, Data_Nascimento_Funcionario, Possui_Habilitacao_Funcionario, Salario_Funcionario, Carga_Horaria_Semanal_Funcionario, ID_Departamento) 
VALUES ('Funcionario 3', '34567890123', '34567890', 'Masculino', '1997-01-01', 0, '700.00', 30, 2);

-- Inserir Projetos
INSERT INTO Projeto (Nome_Projeto, Quantidade_Horas_Necessarias, Prazo_Estimado, ID_Departamento, Carga_Horaria_Funcionario, Carga_Horaria_Supervisao, ID_Funcionario_Supervisor, Data_Ultimo_Calculo_Horas) 
VALUES ('Projeto 1', 100, 10, 1, 40, 10, 1, '2023-01-24');

INSERT INTO Projeto (Nome_Projeto, Quantidade_Horas_Necessarias, Prazo_Estimado, ID_Departamento, Carga_Horaria_Funcionario, Carga_Horaria_Supervisao, ID_Funcionario_Supervisor, Data_Ultimo_Calculo_Horas) 
VALUES ('Projeto 2', 150, 15, 2, 40, 15, 2, '2023-02-23');

-- REINICIAR TESTE DE INSERTS 
DELETE FROM Projeto;

DELETE FROM Funcionario_Projeto;
-- Inserir Projetos DATA ULTIMO CALCULO 2 SEMANAS SENDO HOJE 2023-04-24
INSERT INTO Projeto (Nome_Projeto, Quantidade_Horas_Necessarias, Prazo_Estimado, ID_Departamento, Carga_Horaria_Funcionario, Carga_Horaria_Supervisao, ID_Funcionario_Supervisor, Data_Ultimo_Calculo_Horas) 
VALUES ('Projeto 1', 100, 10, 1, 40, 10, 1, '2023-04-10');

INSERT INTO Projeto (Nome_Projeto, Quantidade_Horas_Necessarias, Prazo_Estimado, ID_Departamento, Carga_Horaria_Funcionario, Carga_Horaria_Supervisao, ID_Funcionario_Supervisor, Data_Ultimo_Calculo_Horas) 
VALUES ('Projeto 2', 150, 15, 2, 40, 15, 2, '2023-04-5');


-- COMO A TRIGGER ACIONA A PARTIR DO INSERT NA TABELA Funcionario_Projeto, ENTÃO AQUI VEJA O VALOR ATUAL  DE Quantidade_Horas_Realizadas

SELECT Data_Ultimo_Calculo_Horas  FROM Projeto;

SELECT ID_Projeto, Nome_Projeto, Quantidade_Horas_Realizadas FROM Projeto ;
SELECT ID_Projeto, Nome_Projeto, Quantidade_Horas_Realizadas FROM Projeto ;

-- ATE AQUI CONSTA 0 HORAS REALIADAS 

-- Inserir Funcionários e Projetos Associados
INSERT INTO Funcionario_Projeto (ID_Funcionario, ID_Projeto, Carga_Horaria) VALUES (1, 1, 44);
INSERT INTO Funcionario_Projeto (ID_Funcionario, ID_Projeto, Carga_Horaria) VALUES (2, 1, 44);
INSERT INTO Funcionario_Projeto (ID_Funcionario, ID_Projeto, Carga_Horaria) VALUES (3, 2, 44);
INSERT INTO Funcionario_Projeto (ID_Funcionario, ID_Projeto, Carga_Horaria) VALUES (3, 3, 44);
INSERT INTO Funcionario_Projeto (ID_Funcionario, ID_Projeto, Carga_Horaria) VALUES (3, 4, 44);

-- Inserir Supervisor
INSERT INTO Supervisor (ID_Funcionario, ID_Projeto, Carga_Horaria_Supervisao) VALUES (1, 1, 10);
INSERT INTO Supervisor (ID_Funcionario, ID_Projeto, Carga_Horaria_Supervisao) VALUES (2, 2, 15);

