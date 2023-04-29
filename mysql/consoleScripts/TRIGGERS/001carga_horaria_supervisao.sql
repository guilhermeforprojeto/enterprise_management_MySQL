
CREATE TRIGGER 001trg_carga_horaria_supervisao
BEFORE INSERT ON Supervisor
FOR EACH ROW
BEGIN
    DECLARE total_carga_horaria_supervisao INT;
    DECLARE total_carga_horaria_funcionario INT;
    
    -- busca a carga horária total do funcionário
    SET total_carga_horaria_funcionario = (SELECT IFNULL(SUM(Carga_Horaria),0)  
    FROM Funcionario_Projeto
    WHERE ID_Funcionario = NEW.ID_Funcionario);
    -- busca a carga horária total dos projetos supervisionados pelo funcionário
    SET total_carga_horaria_supervisao = (SELECT IFNULL(SUM(Carga_Horaria_Supervisao),0) 
    FROM Supervisor
    WHERE ID_Funcionario = NEW.ID_Funcionario );
    
    -- verifica se a soma das cargas horárias dos projetos supervisionados ultrapassa a carga horária do funcionário
    IF (total_carga_horaria_supervisao + NEW.Carga_Horaria_Supervisao) > total_carga_horaria_funcionario THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A carga horária de supervisão do funcionário ultrapassa sua carga horária total';
    END IF;
END;



-- - TESTES 
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