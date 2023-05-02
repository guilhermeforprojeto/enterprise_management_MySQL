from rest_framework import viewsets, status
from rest_framework.response import Response
from empresa.api import serializers
from empresa import models
from .serializers import FuncionarioSerializer


class DepartamentoViewSet(viewsets.ViewSet):
    serializer_class = serializers.DepartamentoSerializer

    def list(self, request):
        departamentos = models.Departamento.objects.all()
        serializer = self.serializer_class(departamentos, many=True)
        return Response(serializer.data)

    def create(self, request):
        serializer = self.serializer_class(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def retrieve(self, request, pk=None):
        departamento = models.Departamento.objects.get(pk=pk)
        serializer = self.serializer_class(departamento)
        return Response(serializer.data)

    def update(self, request, pk=None):
        departamento = models.Departamento.objects.get(pk=pk)
        serializer = self.serializer_class(departamento, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, pk=None):
        departamento = models.Departamento.objects.get(pk=pk)
        departamento.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class FuncionarioViewSet(viewsets.ViewSet):
    serializer_class = serializers.FuncionarioSerializer 
    def list(self, request):
        queryset = models.Funcionario.objects.all() # alteração aqui
        serializer = FuncionarioSerializer(queryset, many=True)
        return Response(serializer.data)
    
    def create(self, request):
        serializer = FuncionarioSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def retrieve(self, request, pk=None):
        queryset = models.Funcionario.objects.all() # alteração aqui
        funcionario = get_object_or_404(queryset, pk=pk)
        serializer = FuncionarioSerializer(funcionario)
        return Response(serializer.data)
    
    def update(self, request, pk=None):
        funcionario = models.Funcionario.objects.get(pk=pk) # alteração aqui
        serializer = FuncionarioSerializer(funcionario, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def destroy(self, request, pk=None):
        funcionario = models.Funcionario.objects.get(pk=pk) # alteração aqui
        funcionario.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
