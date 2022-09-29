from django.shortcuts import render
from rest_framework import viewsets
from .serializers import ClientInfoSerializer, ClientContactSerializer, InventorySerializer, ResourceSerializer
from .models import ClientInfo, ClientContact, Inventory, Resource

class ClientInfoView(viewsets.ModelViewSet):
    queryset = ClientInfo.objects.all()
    serializer_class = ClientInfoSerializer
    
    
class ClientContactView(viewsets.ModelViewSet):
    queryset = ClientContact.objects.all()
    serializer_class = ClientContactSerializer
    
    
class InventoryView(viewsets.ModelViewSet):
    queryset = Inventory.objects.all()
    serializer_class = InventorySerializer
    
    
class ResourceView(viewsets.ModelViewSet):
    queryset = Resource.objects.all()
    serializer_class = ResourceSerializer