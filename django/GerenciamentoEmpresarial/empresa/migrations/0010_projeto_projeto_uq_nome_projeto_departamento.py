# Generated by Django 4.0.6 on 2023-05-03 02:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('empresa', '0009_auto_20230502_0000'),
    ]

    operations = [
        migrations.CreateModel(
            name='Projeto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nome_projeto', models.CharField(max_length=40)),
                ('quantidade_horas_necessarias', models.IntegerField()),
                ('prazo_estimado', models.IntegerField()),
                ('quantidade_horas_realizadas', models.IntegerField()),
                ('data_ultimo_calculo_horas', models.DateField()),
                ('carga_horaria_supervisao', models.IntegerField()),
                ('departamento', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='empresa.departamento')),
                ('funcionario_supervisor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='empresa.funcionario')),
            ],
        ),
        migrations.AddConstraint(
            model_name='projeto',
            constraint=models.UniqueConstraint(fields=('departamento', 'nome_projeto'), name='UQ_Nome_Projeto_Departamento'),
        ),
    ]
