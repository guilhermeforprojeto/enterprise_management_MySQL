from rest_framework import viewsets
from rest_framework.response import Response
from django.db import connection

class DepartamentoProcedureViewSet(viewsets.ViewSet):
    
    def create(self, request):
        json_str = request.data.get('json_str')
        op = request.data.get('op')

        with connection.cursor() as cursor:
            cursor.callproc('001proc_departamento_crud', [json_str, op])
            result = cursor.fetchall()

        # Realize qualquer tratamento necessário nos resultados da procedure
        # e retorne a resposta apropriada
        return Response({'message': 'Operação executada com sucesso!'})

    def update(self, request, pk=None):
        json_str = request.data.get('json_str')
        op = request.data.get('op')

        with connection.cursor() as cursor:
            cursor.callproc('001proc_departamento_crud', [json_str, op])
            result = cursor.fetchall()

        # Realize qualquer tratamento necessário nos resultados da procedure
        # e retorne a resposta apropriada
        return Response({'message': 'Operação executada com sucesso!'})

    def delete(self, request, pk=None):
        json_str = request.data.get('json_str')
        op = request.data.get('op')

        with connection.cursor() as cursor:
            cursor.callproc('001proc_departamento_crud', [json_str, op])
            result = cursor.fetchall()

        # Realize qualquer tratamento necessário nos resultados da procedure
        # e retorne a resposta apropriada
        return Response({'message': 'Operação executada com sucesso!'})

    def retrieve(self, request, pk=None):
        json_str = request.data.get('json_str')
        op = request.data.get('op')

        with connection.cursor() as cursor:
            cursor.callproc('001proc_departamento_crud', [json_str, op])
            result = cursor.fetchall()

        # Realize qualquer tratamento necessário nos resultados da procedure
        # e retorne a resposta apropriada
        return Response({'message': 'Operação executada com sucesso!'})
