# Generated by Django 4.0.6 on 2023-05-01 23:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('empresa', '0007_alter_departamento_table_alter_funcionario_table'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='departamento',
            table='Departamento',
        ),
        migrations.AlterModelTable(
            name='funcionario',
            table='Funcionario',
        ),
    ]