from rest_framework import viewsets
from empresa.api import serializers
from empresa import models

class DepartamentoViewSet(viewsets.ModelViewSet):
  serializer_class = serializers.DepartamentoSerializer
  queryset = models.Departamento.objects.all()