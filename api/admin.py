from django.contrib import admin
from .models import ClientInfo, ClientContact, Inventory, Resource

class ClientInfoAdmin(admin.ModelAdmin):
    list_display = ("client_id", "client_name", "address", "phone_number", "is_deleted")
    
class ClientContactAdmin(admin.ModelAdmin):
    list_display = ("client_contacts_id", "client", "email_address", "phone_number", "contact_name", "is_deleted")
    
class InventoryAdmin(admin.ModelAdmin):
    list_display = ("inventory_id", "item_name", "storage_type", "max_item_capacity", "client", "is_deleted")

class ResourceAdmin(admin.ModelAdmin):
    list_display = ("resource_id", "resource_name", "resource_type", "max_num_resources", "current_num_resources", "inventory", "is_deleted")
    
admin.site.register(ClientInfo)
admin.site.register(ClientContact)
admin.site.register(Inventory)
admin.site.register(Resource)