CREATE PROCEDURE 003proc_projeto_crud(
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Projeto(Nome_Projeto, ID_Departamento) 
    VALUES(JSON_EXTRACT(json_str, '$.Nome_Projeto'),
           JSON_EXTRACT(json_str, '$.ID_Departamento'));
  ELSEIF op = 'update' THEN
    UPDATE Projeto SET Nome_Projeto = JSON_EXTRACT(json_str, '$.Nome_Projeto'),
           ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento')
    WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  ELSEIF op = 'delete' THEN
    DELETE FROM Projeto WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  ELSEIF op = 'read' THEN
    SELECT * FROM Projeto WHERE ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  END IF;
END

DROP PROCEDURE 003proc_projeto_crud

SELECT * FROM Projeto;


CALL 003proc_projeto_crud('{"Nome_Projeto": "Sistema Gerencial", "ID_Departamento": 2}', 'insert');

CALL 003proc_projeto_crud('{"ID_Projeto": 1, "Nome_Projeto": "ERP WEB", "ID_Departamento": 2}', 'update');

CALL 003proc_projeto_crud('{"ID_Projeto": 2}', 'delete');

CALL 003proc_projeto_crud('{"ID_Projeto": 2}', 'read');
