from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from empresa.api.viewsets import DepartamentoProcedureViewSet

router = routers.DefaultRouter()
router.register(r'departamento_procedure', DepartamentoProcedureViewSet, basename='departamento_procedure')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
]
