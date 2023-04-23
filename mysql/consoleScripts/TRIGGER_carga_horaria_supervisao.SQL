CREATE TRIGGER trg_carga_horaria_supervisao
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
END

###########################





DROP TRIGGER trg_carga_horaria_supervisao;

SHOW TRIGGERS LIKE 'Supervisor';