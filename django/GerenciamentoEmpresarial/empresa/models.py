from django.db import models

import uuid


class Departamento(models.Model):
    ID_Departamento = models.CharField(
        primary_key=True, max_length=4, editable=False)
    Nome_Departamento = models.CharField(max_length=40)

    def save(self, *args, **kwargs):
        if not self.ID_Departamento:
            # Gera um novo UUID e guarda apenas os 4 primeiros caracteres
            self.ID_Departamento = uuid.uuid4().hex[:4]
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'Departamento'
