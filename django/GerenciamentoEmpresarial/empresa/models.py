from django.db import models

import uuid

# Criar table
class Departamento(models.Model):
    ID_Departamento = models.AutoField(primary_key=True)
    Nome_Departamento = models.CharField(max_length=40, unique=True)

    class Meta:
        db_table = 'Departamento'

class Funcionario(models.Model):
    ID_Funcionario = models.AutoField(primary_key=True)
    Nome_Funcionario = models.CharField(max_length=42, unique=True)
    CPF_Funcionario = models.CharField(max_length=13, unique=True, null=True, blank=True)
    RG_Funcionario = models.CharField(max_length=12, unique=True, null=True, blank=True)
    Sexo_Funcionario = models.CharField(max_length=12, null=True, blank=True)
    Data_Nascimento_Funcionario = models.DateField(null=True, blank=True)
    Possui_Habilitacao_Funcionario = models.BooleanField(default=False)
    Salario_Funcionario = models.CharField(max_length=12, null=True, blank=True)
    Carga_Horaria_Semanal_Funcionario = models.CharField(max_length=12, null=True, blank=True)
    ID_Departamento = models.ForeignKey(Departamento, on_delete=models.CASCADE)

    class Meta:
        db_table = 'Funcionario'