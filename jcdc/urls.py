from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from api import views

# create a router object
router = routers.DefaultRouter()
 
# register the router
router.register(r'client',views.ClientInfoView, 'client')
router.register(r'contact',views.ClientContactView, 'contact')
router.register(r'inventory',views.InventoryView, 'inventory')
router.register(r'resource',views.ResourceView, 'resource')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls))
]