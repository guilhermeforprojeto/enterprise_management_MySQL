CREATE PROCEDURE 005proc_supervisor_crud(
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Supervisor(ID_Funcionario, ID_Projeto, Carga_Horaria_Supervisao) 
    VALUES(JSON_EXTRACT(json_str, '$.ID_Funcionario'), JSON_EXTRACT(json_str, '$.ID_Projeto'),
           JSON_EXTRACT(json_str, '$.Carga_Horaria_Supervisao'));
  ELSEIF op = 'update' THEN
    UPDATE Supervisor SET ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario'), 
    ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto'), 
    Carga_Horaria_Supervisao = JSON_EXTRACT(json_str, '$.Carga_Horaria_Supervisao') 
    WHERE ID_Supervisor = JSON_EXTRACT(json_str, '$.ID_Supervisor');
  ELSEIF op = 'delete' THEN
    DELETE FROM Supervisor WHERE ID_Supervisor = JSON_EXTRACT(json_str, '$.ID_Supervisor');
  ELSEIF op = 'read' THEN
    SELECT * FROM Supervisor WHERE ID_Supervisor = JSON_EXTRACT(json_str, '$.ID_Supervisor');
  END IF;
END;

-- Veja se foi criada 
SHOW CREATE PROCEDURE 005proc_supervisor_crud;


-- Verifique os ids que vai usar para insert
SELECT * from Supervisor;
SELECT * from Funcionario;
SELECT * from Funcionario_Projeto;
--
-- Atenção, verifique a carga horaria do funcionário supervisor(SELECT * from Funcionario_Projeto;) pois a
-- trigger 001carga_horaria_supervisao não permite gravar uma carga horaria maior.
CALL 005proc_supervisor_crud('{"ID_Funcionario": 1, "ID_Projeto": 3, "Carga_Horaria_Supervisao": 25}', 'insert');


SELECT * from Supervisor;

CALL 005proc_supervisor_crud('{"ID_Supervisor": 1, "ID_Funcionario": 1, "ID_Projeto": 3, "Carga_Horaria_Supervisao": 40}', 'update');

SELECT * from Supervisor;

CALL 005proc_supervisor_crud('{"ID_Supervisor": 1}', 'read');

SELECT * from Supervisor;

CALL 005proc_supervisor_crud('{"ID_Supervisor": 1}', 'delete');

SELECT * from Supervisor;