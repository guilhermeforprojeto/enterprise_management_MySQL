# Anexo 1 - Regras de Negócio

- Banco de dados chamado Empresa que tem como objetivo registrar os
  departamentos, funcionários e projetos desenvolvidos pela companhia;
- A empresa é organizada em Departamentos;
- Cada departamento possui um nome único;
- Um departamento possui diversos funcionários;
- Cada funcionário possui Nome, CPF e RG únicos;
- Cada funcionário também possui as seguintes informações:
- - Sexo;
- - Data de Nascimento;
- - Informação se possui Habilitação;
- - Valor do salário;
- - Carga Horária Semanal;
- Um departamento possui diversos projetos;
- Cada projeto possui um nome único em seu departamento;
- Cada projeto também possui as seguintes informações:
- - Quantidade de horas necessárias para conclusão do projeto;
- - Data do prazo estimado;
- - Quantidade de horas realizadas;
- - Data do ultimo calculo de horas;
- Cada projeto possui um supervisor que é um funcionário;
- Um funcionário pode supervisionar diversos projetos, tendo a carga horária que é
  gasta supervisionando o projeto;
- Um funcionário pode trabalhar em diversos projetos, tendo a carga horária que é
  gasta em cada;
- Os funcionários podem ser adicionados ou removidos de projetos a qualquer
  momento;
- A soma das cargas horárias em que o funcionário supervisiona e trabalha em
  projetos não pode ultrapassar a carga horária do funcionário;
- O cálculo da quantidade de horas realizadas no projeto é realizado baseado na
  quantidade de horas trabalhadas pelos funcionários e no número de semanas
  passadas desde o ultimo calculo;
- O prazo estimado do projeto deve ser calculado com base na quantidade de horas
  gastas pelos funcionários e no número de horas restantes;
- Os usuários do sistema podem solicitar que as quantidades de horas realizadas e os
  prazos estimados dos projetos sejam atualizados.
