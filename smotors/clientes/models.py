from unittest.util import _MAX_LENGTH
from django.db import models

# Create your models here.
#
class Clientes(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    cedula_cliente = models.IntegerField()
    nombre_cliente = models.CharField(max_length=50)
    apellidos_cliente = models.CharField(max_length=50)
    direccion_cliente = models.CharField(max_length=100)
    ciudad_cliente = models.CharField(max_length=50)
    pais_cliente = models.CharField(max_length=50)
    telefono_cliente = models.IntegerField()
    email_cliente = models.CharField(max_length=50)


    def __str__(self):
        return f'{self.nombre_cliente} {self.apellidos_cliente}'