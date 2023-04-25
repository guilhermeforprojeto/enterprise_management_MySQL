
CREATE TRIGGER atualiza_prazo_estimado
BEFORE UPDATE ON Projeto
FOR EACH ROW
BEGIN
  DECLARE horas_necessarias INT;
  DECLARE horas_realizadas INT;
  DECLARE prazo_estimado INT;
  
  SET horas_necessarias = NEW.Quantidade_Horas_Necessarias;
  SET horas_realizadas = NEW.Quantidade_Horas_Realizadas;
  SET prazo_estimado = horas_necessarias - horas_realizadas;
  SET NEW.Prazo_Estimado = prazo_estimado;
END;
