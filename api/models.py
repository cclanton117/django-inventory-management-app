from django.db import models

class ClientInfo(models.Model):
    client_id = models.AutoField(primary_key=True)
    client_name = models.CharField(max_length=40)
    address = models.CharField(max_length=255)
    phone_number = models.CharField(max_length=12)
    is_deleted = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'client_info'
        
    def __str__(self):
        return self.client_name
    
    
class ClientContact(models.Model):
    client_contacts_id = models.AutoField(primary_key=True)
    client = models.ForeignKey('ClientInfo', models.DO_NOTHING)
    email_address = models.CharField(max_length=40)
    phone_number = models.CharField(max_length=12)
    contact_name = models.CharField(max_length=50)
    is_deleted = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'client_contacts'
    
    def __str__(self):
        return self.contact_name


class Inventory(models.Model):
    inventory_id = models.AutoField(primary_key=True)
    item_name = models.CharField(max_length=40)
    storage_type = models.CharField(max_length=40)
    max_item_capacity = models.IntegerField()
    client = models.ForeignKey(ClientInfo, models.DO_NOTHING)
    is_deleted = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'inventory'
        
    def __str__(self):
        return self.item_name


class Resource(models.Model):
    resource_id = models.AutoField(primary_key=True)
    resource_name = models.CharField(max_length=40)
    resource_type = models.CharField(max_length=40)
    max_num_resources = models.IntegerField()
    current_num_resources = models.IntegerField()
    inventory = models.ForeignKey(Inventory, models.DO_NOTHING)
    is_deleted = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'resources'
        
    def __str__(self):
        return self.resource_name


class AbcLogs(models.Model):
    change_id = models.IntegerField(blank=True, null=True)
    username = models.CharField(max_length=40, blank=True, null=True)
    action_taken = models.CharField(max_length=55, blank=True, null=True)
    action_used_on = models.CharField(max_length=55, blank=True, null=True)
    changed_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'abc_logs'
