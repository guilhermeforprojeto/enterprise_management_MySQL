-- TESTES 
-- Confirme se a trigger existe
SHOW CREATE TRIGGER trg_carga_horaria_supervisao;
-- Veja o campo Carga_Horaria 
SELECT * FROM Funcionario_Projeto WHERE ID_Funcionario ='3' AND ID_Projeto='4';
-- Tente inserir em Carga_Horaria_Supervisao um valor maior.
INSERT INTO Supervisor (ID_Funcionario, ID_Projeto, Carga_Horaria_Supervisao) 
VALUES (3, 4, 712);
-- Espera-se desse teste que retorne SQL Error [1644] [45000]: A carga horária de supervisão do funcionário ultrapassa sua carga horária total

-- Agora faça outro insert com valor a baixo
SELECT * FROM Funcionario_Projeto WHERE ID_Funcionario ='3' AND ID_Projeto='4';
INSERT INTO Supervisor (ID_Funcionario, ID_Projeto, Carga_Horaria_Supervisao) 
VALUES (3, 4, 12);
-- Espera-se desse teste que o valor seja inserido com sucesso