from rest_framework import serializers
from .models import ClientInfo, ClientContact, Inventory, Resource

class ClientInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = ClientInfo
        fields = ('client_id', 'client_name', 'address', 'phone_number', 'is_deleted')
        

class ClientContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = ClientContact
        fields = ('client_contacts_id', 'client', 'email_address', 'phone_number', 'contact_name', 'is_deleted')
        
 
class InventorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Inventory
        fields = ('inventory_id', 'item_name', 'storage_type', 'max_item_capacity',  'client', 'is_deleted')
        
        
class ResourceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Resource
        fields = ('resource_id', 'resource_name', 'resource_type', 'max_num_resources', 'current_num_resources', 'inventory', 'is_deleted')
                