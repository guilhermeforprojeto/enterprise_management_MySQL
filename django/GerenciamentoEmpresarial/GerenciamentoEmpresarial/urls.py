from django.contrib import admin
from django.urls import path, include

from rest_framework import routers

from empresa.api import viewsets as departamentoviewsets

route = routers.DefaultRouter()

route.register(r'departamento',
               departamentoviewsets.DepartamentoViewSet, basename='departamento')


urlpatterns = [
    path('admin/', admin.site.urls),
    path('',  include(route.urls)),
]
