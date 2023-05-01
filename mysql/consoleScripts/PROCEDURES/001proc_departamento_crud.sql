CREATE PROCEDURE 001proc_departamento_crud(
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


SELECT * from Departamento;

SHOW CREATE PROCEDURE 001proc_departamento_crud;


CALL 001proc_departamento_crud('{"Nome_Departamento": "DBA"}', 'insert');
SELECT * from Departamento;
CALL 001proc_departamento_crud('{"ID_Departamento": 1, "Nome_Departamento": "BACKEND"}', 'update');
SELECT * from Departamento;
CALL 001proc_departamento_crud('{"ID_Departamento": 1}', 'read');
CALL 001proc_departamento_crud('{"ID_Departamento": 1}', 'delete');
SELECT * from Departamento;