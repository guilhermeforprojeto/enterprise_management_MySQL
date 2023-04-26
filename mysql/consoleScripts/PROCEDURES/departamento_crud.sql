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

CALL departamento_crud('{"Nome_Departamento": "PROCEDURE insert 1"}', 'insert');
CALL departamento_crud('{"ID_Departamento": 1, "Nome_Departamento": "PROCEDURE departamento_crud"}', 'update');
CALL departamento_crud('{"ID_Departamento": 1}', 'read');
CALL departamento_crud('{"ID_Departamento": 1}', 'delete');

SELECT * FROM Departamento