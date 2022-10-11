from django.shortcuts import render, HttpResponse, redirect

#from smotors.clientes.formsCliente import ClienteForm
from .models import Clientes

from .formsCliente import ClienteForm
# Create your views here.
#@app.route('/ ')


def crearCliente(request) :
        #aqui se envia los datos de enviar
        if request.method == 'POST' :
                form = ClienteForm(request.POST) # CREA EL FORMULARIO CON LOS DATOS
                #print (request.POST)
                if form.is_valid() :
                        form.save()
                        return redirect('clientes')#redirige a la pagina clientes
        else :
                form = ClienteForm() #se crea un forms
        contexto = {
                'form': form,
                'tituloh1': 'Crear Cliente'

        }
        return render(request, 'crearCliente.html', contexto)


def contactenos(request) :
        return render(request, 'contactenos.html')


def inicio(request) :
        return render(request, 'index.html')

def  clientes(request):
        #return HttpResponse('<h1>Pagina Principal</h1>')

        clientes = Clientes.objects.all()#se trae todos los registros de la tabla clientes
        print(clientes)#definir llave
        contexto = {
                'clientes' : clientes
        }
        return render(request, 'clientes.html', contexto)
#no funciono lo de ver el get  luego de reiniciar sí funcionó

#@app.route('editarCliente/<int:id')
def editarCliente(request, id) :
        # print('*'*70)
        # print(id)
        # print-('*'*70)-
        
        cliente = Clientes.objects.get(id_cliente = id)   #revisar como se llama en el import 
#aqui se envia los datos de enviar
        if request.method == 'POST':  #cuando boton guardar
        # CREA EL FORMULARIO CON LOS DATOS
                form = ClienteForm(request.POST, instance=cliente)
                #print (request.POST)
                if form.is_valid():
                        form.save() # salva 
                        return redirect('clientes')  # redirige a la pagina clientes
        form = ClienteForm( instance=cliente)# se le pasa un forms vacio, pero luego se le dice toma los datos
        contexto = {
                'form' : form,
                'tituloh1' : 'Actualizar Cliente'
        }
        return render(request, 'crearCliente.html', contexto)


def  eliminarCliente(request, id) :
        cliente = Clientes.objects.get(id_cliente=id)
        if request.method == 'POST' :
                cliente.delete()
                return redirect('clientes')
        contexto = {
                'tituloh1' : 'Eliminar Cliente',
                'nombre_cliente' : cliente.nombre_cliente
                }
        return render(request, 'eliminar.html', contexto)

