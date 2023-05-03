from django.contrib import admin
from django.urls import path, include

from rest_framework import routers
from empresa.api.viewsets import DepartamentoViewSet, FuncionarioViewSet, ProjetoViewSet

router = routers.DefaultRouter()

router.register(r'departamento', DepartamentoViewSet, basename='departamento')
router.register(r'funcionario', FuncionarioViewSet, basename='funcionario')
router.register(r'projeto', ProjetoViewSet, basename='projeto')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
]
