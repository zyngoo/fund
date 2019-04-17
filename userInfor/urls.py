from django.urls import path
from . import views

urlpatterns = [
    path("login/", views.login),
    path("logout/", views.logout),
    path("register_handle/", views.register_handle),
    path("upload/", views.upload),
    path("test/", views.test),
    path("count/",views.count),
    path("count/edit/",views.countEdit),
    # path("count/edit_handle/",views.countEdit_handle),

]
