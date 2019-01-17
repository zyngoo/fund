from django.urls import path
from . import views

urlpatterns = [
    path("", views.index),
    path("calender/", views.calender),
    path("calender/add/", views.calender_add),
    path("calender_handle/", views.calender_handle),
    path("calender/list/", views.calender_list),
    path("calender/list_handle/", views.calender_list_handle),
    path("calender/calender_delete/", views.calender_delete),
    path("calender/calender_edit/", views.calender_edit),



]