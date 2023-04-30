CREATE PROCEDURE 003proc_projeto_crud(
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



CALL projeto_crud('{"Nome_Projeto": "Novo Projeto", "Data_Inicio": "2023-05-01", "Data_Fim": "2023-12-31", "Orcamento": 50000, "ID_Departamento": 1}', 'insert');

CALL projeto_crud('{"ID_Projeto": 1, "Nome_Projeto": "Projeto Atualizado", "Data_Inicio": "2022-02-01", "Data_Fim": "2022-12-31", "Orcamento": 120000, "ID_Departamento": 2}', 'update');

CALL projeto_crud('{"ID_Projeto": 1}', 'delete');

CALL projeto_crud('{"ID_Projeto": 2}', 'read');
