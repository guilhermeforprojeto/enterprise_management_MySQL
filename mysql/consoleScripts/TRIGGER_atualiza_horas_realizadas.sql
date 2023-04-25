CREATE TRIGGER atualiza_horas_realizadas
BEFORE INSERT ON Funcionario_Projeto
FOR EACH ROW
BEGIN
  DECLARE semanas_passadas DECIMAL(10,2);
  DECLARE horas_trabalhadas INT;
  
  SELECT TIMESTAMPDIFF(WEEK, COALESCE(p.Data_Ultimo_Calculo_Horas, NOW()), NOW()) INTO semanas_passadas
  FROM Projeto p WHERE p.ID_Projeto = NEW.ID_Projeto;
  
  SELECT SUM(fp.Carga_Horaria) INTO horas_trabalhadas
  FROM Funcionario_Projeto fp
  WHERE fp.ID_Projeto = NEW.ID_Projeto;
  
  UPDATE Projeto SET Data_Ultimo_Calculo_Horas = NOW() WHERE ID_Projeto = NEW.ID_Projeto;
  
  IF semanas_passadas <= 0 THEN
    UPDATE Projeto SET Quantidade_Horas_Realizadas = Quantidade_Horas_Realizadas + horas_trabalhadas
    WHERE ID_Projeto = NEW.ID_Projeto;
  ELSE
    UPDATE Projeto SET Quantidade_Horas_Realizadas = Quantidade_Horas_Realizadas + (horas_trabalhadas * semanas_passadas)
    WHERE ID_Projeto = NEW.ID_Projeto;
  END IF;
END;
