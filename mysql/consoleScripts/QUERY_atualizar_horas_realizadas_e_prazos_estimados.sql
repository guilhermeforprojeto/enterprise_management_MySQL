-- Os usuários do sistema podem solicitar que as quantidades de horas realizadas 
-- e os  prazos estimados dos projetos sejam atualizado
##



SELECT Quantidade_Horas_Realizadas, Quantidade_Horas_Necessarias ,  Prazo_Estimado FROM Projeto ;

-- exemplo do resultado do select a cima print
Quantidade_Horas_Realizadas|Quantidade_Horas_Necessarias|Prazo_Estimado|
---------------------------+----------------------------+--------------+
                        176|                         100|           -76|
                         88|                         150|            62|
                         
#
--                 
-- Atualizando  a quantidade de horas realiadas e automaticamente como a trigger "atualiza_prazo_estimado" 
-- o campo Prazo_Estimado  também vai ser atualizado

Antes checar se a trigger esta ativa

SHOW TRIGGERS 
                
-- Exemplo do que se espera para seguir com teste
-- 
-- Trigger                  |Event |Table              |
-- -------------------------+------+-------------------+
-- atualiza_horas_realizadas|INSERT|Funcionario_Projeto|
-- atualiza_prazo_estimado  |UPDATE|Projeto            |


-- Com a trigger ativa, siga para o update 

UPDATE Projeto SET Quantidade_Horas_Realizadas = (90) WHERE ID_Projeto = 1;


SELECT Quantidade_Horas_Realizadas, Quantidade_Horas_Necessarias ,  Prazo_Estimado FROM Projeto ;

Quantidade_Horas_Realizadas|Quantidade_Horas_Necessarias|Prazo_Estimado|
---------------------------+----------------------------+--------------+
                         90|                         100|            10|
                         88|                         150|            62|
                         
                         
--  Aqui vemos que o prazo foi atualizado automaticamente pois a Quantidade_Horas_Realizadas mudou
