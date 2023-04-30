
CREATE PROCEDURE 004proc_funcionario_projeto_crud (
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Funcionario_Projeto (
      ID_Funcionario,
      ID_Projeto,
      Carga_Horaria
    )
    VALUES (
      JSON_EXTRACT(json_str, '$.ID_Funcionario'),
      JSON_EXTRACT(json_str, '$.ID_Projeto'),
      JSON_EXTRACT(json_str, '$.Carga_Horaria')
    );
  ELSEIF op = 'update' THEN
    UPDATE Funcionario_Projeto 
    SET 
      Carga_Horaria = JSON_EXTRACT(json_str, '$.Carga_Horaria')
    WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario') AND ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  ELSEIF op = 'delete' THEN
    DELETE FROM Funcionario_Projeto WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario') AND ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  ELSEIF op = 'select' THEN
    SELECT * FROM Funcionario_Projeto WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario') AND ID_Projeto = JSON_EXTRACT(json_str, '$.ID_Projeto');
  END IF;
END;



SHOW CREATE PROCEDURE 004proc_funcionario_projeto_crud;