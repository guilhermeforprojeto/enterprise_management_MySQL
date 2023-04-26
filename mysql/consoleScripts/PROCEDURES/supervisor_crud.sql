-- 
-- CREATE PROCEDURE supervisor_crud(
-- 

CREATE PROCEDURE supervisor_crud(
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
SHOW CREATE PROCEDURE Supervisor_crud;

-- Chamando procedure Supervisor_crud com insert,update,read,delete

CALL supervisor_crud('"ID_Funcionario": 1, "ID_Projeto": 1, "Carga_Horaria_Supervisao": 40}', 'insert');

-- PRINT 
ID_Supervisor|ID_Funcionario|ID_Projeto|Carga_Horaria_Supervisao|
-------------+--------------+----------+------------------------+
            3|             1|         1|                      40|

CALL supervisor_crud('{"ID_Supervisor": 3, "ID_Funcionario": 2, "ID_Projeto": 2, "Carga_Horaria_Supervisao": 16}', 'update');
-- PRINT 
ID_Supervisor|ID_Funcionario|ID_Projeto|Carga_Horaria_Supervisao|
-------------+--------------+----------+------------------------+
            3|             2|         2|                      16|
            
CALL supervisor_crud('{"ID_Supervisor": 3}', 'read');

CALL supervisor_crud('{"ID_Supervisor": 3}', 'delete');

-- PRINT 

ID_Supervisor|ID_Funcionario|ID_Projeto|Carga_Horaria_Supervisao|
-------------+--------------+----------+------------------------+

