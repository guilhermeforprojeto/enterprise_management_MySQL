CREATE PROCEDURE projeto_crud(
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