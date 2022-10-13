from rest_framework import viewsets

from . import models, serializers


class ClientesViewset(viewsets.ModelViewSet):
    queryset=models.Clientes.objects.all()
    serializer_class=serializers.clientesSerializer
    