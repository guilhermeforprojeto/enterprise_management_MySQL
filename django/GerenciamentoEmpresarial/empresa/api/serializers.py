from rest_framework import serializers
from empresa import models
       
class DepartamentoSerializer(serializers.ModelSerializer):
  class Meta:
    model = models.Departamento
    fields = '__all__'


 