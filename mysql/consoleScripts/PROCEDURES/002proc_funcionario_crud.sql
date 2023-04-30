CREATE PROCEDURE 002proc_funcionario_crud (
  IN json_str TEXT,
  IN op VARCHAR(10)
)
BEGIN
  IF op = 'insert' THEN
    INSERT INTO Funcionario (
      ID_Funcionario,
      Nome_Funcionario,
      CPF_Funcionario,
      RG_Funcionario,
      Sexo_Funcionario,
      Data_Nascimento_Funcionario,
      Possui_Habilitacao_Funcionario,
      Salario_Funcionario,
      Carga_Horaria_Semanal_Funcionario,
      ID_Departamento
    )
    VALUES (
      JSON_EXTRACT(json_str, '$.ID_Funcionario'),
      JSON_EXTRACT(json_str, '$.Nome_Funcionario'),
      JSON_EXTRACT(json_str, '$.CPF_Funcionario'),
      JSON_EXTRACT(json_str, '$.RG_Funcionario'),
      JSON_EXTRACT(json_str, '$.Sexo_Funcionario'),
      JSON_EXTRACT(json_str, '$.Data_Nascimento_Funcionario'),
      JSON_EXTRACT(json_str, '$.Possui_Habilitacao_Funcionario'),
      JSON_EXTRACT(json_str, '$.Salario_Funcionario'),
      JSON_EXTRACT(json_str, '$.Carga_Horaria_Semanal_Funcionario'),
      JSON_EXTRACT(json_str, '$.ID_Departamento')
    );
  ELSEIF op = 'update' THEN
    UPDATE Funcionario 
    SET 
      Nome_Funcionario = JSON_EXTRACT(json_str, '$.Nome_Funcionario'),
      CPF_Funcionario = JSON_EXTRACT(json_str, '$.CPF_Funcionario'),
      RG_Funcionario = JSON_EXTRACT(json_str, '$.RG_Funcionario'),
      Sexo_Funcionario = JSON_EXTRACT(json_str, '$.Sexo_Funcionario'),
      Data_Nascimento_Funcionario = JSON_EXTRACT(json_str, '$.Data_Nascimento_Funcionario'),
      Possui_Habilitacao_Funcionario = JSON_EXTRACT(json_str, '$.Possui_Habilitacao_Funcionario'),
      Salario_Funcionario = JSON_EXTRACT(json_str, '$.Salario_Funcionario'),
      Carga_Horaria_Semanal_Funcionario = JSON_EXTRACT(json_str, '$.Carga_Horaria_Semanal_Funcionario'),
      ID_Departamento = JSON_EXTRACT(json_str, '$.ID_Departamento')
    WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
  ELSEIF op = 'delete' THEN
    DELETE FROM Funcionario WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
  ELSEIF op = 'select' THEN
    SELECT * FROM Funcionario WHERE ID_Funcionario = JSON_EXTRACT(json_str, '$.ID_Funcionario');
  END IF;
END;

SHOW CREATE PROCEDURE funcionario_crud

drop PROCEDURE funcionario_crud

SELECT * from Funcionario;

CALL funcionario_crud('{
  "ID_Funcionario": 1,
  "Nome_Funcionario": "João Silva",
  "CPF_Funcionario": "12345678900",
  "RG_Funcionario": "987654321",
  "Sexo_Funcionario": "Masculino",
  "Data_Nascimento_Funcionario": "1990-01-01",
  "Possui_Habilitacao_Funcionario": true,
  "Salario_Funcionario": 2000.00,
  "Carga_Horaria_Semanal_Funcionario": 40,
  "ID_Departamento": 1
}', 'insert');


CALL funcionario_crud('{
  "ID_Funcionario": 1,
  "Nome_Funcionario": "Guilherme Santana",
  "CPF_Funcionario": "32100078900",
  "RG_Funcionario": "987654321",
  "Sexo_Funcionario": "Masculino",
  "Data_Nascimento_Funcionario": "1990-01-01",
  "Possui_Habilitacao_Funcionario": true,
  "Salario_Funcionario": 5500.00,
  "Carga_Horaria_Semanal_Funcionario": 44,
  "ID_Departamento": 1
}', 'update');

CALL funcionario_crud('{
  "ID_Funcionario": 1
}', 'select');


CALL funcionario_crud('{
  "ID_Funcionario": 1
}', 'delete');
