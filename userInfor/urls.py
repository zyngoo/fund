from django.urls import path
from . import views

urlpatterns = [
    path("login/", views.login),
    path("logout/", views.logout),
    path("register_handle/", views.register_handle),
    path("upload/", views.upload),
    path("test/", views.test),
    path("account/",views.count),
    path("account/edit/",views.account_edit),
    path("account/chpwd/",views.password_edit),
    path("account/chpwd_handle/",views.password_change),
    path("account/expwd/",views.password_exist),

]
