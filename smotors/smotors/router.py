from clientes.viewsets import ClientesViewset
from rest_framework import routers

router=routers.DefaultRouter()
router.register('Clientes',ClientesViewset)


#url/clientes

