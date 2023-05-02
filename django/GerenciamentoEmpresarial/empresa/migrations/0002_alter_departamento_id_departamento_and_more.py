# Generated by Django 4.0.6 on 2023-05-01 23:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('empresa', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='departamento',
            name='ID_Departamento',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='departamento',
            name='Nome_Departamento',
            field=models.CharField(max_length=40, unique=True),
        ),
        migrations.CreateModel(
            name='Funcionario',
            fields=[
                ('ID_Funcionario', models.AutoField(primary_key=True, serialize=False)),
                ('Nome_Funcionario', models.CharField(max_length=42, unique=True)),
                ('CPF_Funcionario', models.CharField(blank=True, max_length=13, null=True, unique=True)),
                ('RG_Funcionario', models.CharField(blank=True, max_length=12, null=True, unique=True)),
                ('Sexo_Funcionario', models.CharField(blank=True, max_length=12, null=True)),
                ('Data_Nascimento_Funcionario', models.DateField(blank=True, null=True)),
                ('Possui_Habilitacao_Funcionario', models.BooleanField(default=False)),
                ('Salario_Funcionario', models.CharField(blank=True, max_length=12, null=True)),
                ('Carga_Horaria_Semanal_Funcionario', models.CharField(blank=True, max_length=12, null=True)),
                ('ID_Departamento', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='empresa.departamento')),
            ],
            options={
                'db_table': 'Funcionario',
            },
        ),
    ]
