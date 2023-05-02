from django.contrib import admin
from django.urls import path, include

from rest_framework import routers
from empresa.api.viewsets import DepartamentoViewSet, FuncionarioViewSet

router = routers.DefaultRouter()

router.register(r'departamento', DepartamentoViewSet, basename='departamento')
router.register(r'funcionario', FuncionarioViewSet, basename='funcionario')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
]
