from clientes.viewsets import ClientesViewset
from rest_framework import routers

router=routers.DefaultRouter()
router.register('clientes',ClientesViewset)


#url/clientes

