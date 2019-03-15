from django.urls import path
from . import views

urlpatterns = [
    path("", views.index),

    # 日程模块
    path("calender/", views.calender),
    path("calender/add/", views.calender_add),
    path("calender_handle/", views.calender_handle),
    path("calender/list/", views.calender_list),
    path("calender/list_handle/", views.calender_list_handle),
    path("calender/calender_delete/", views.calender_delete),
    path("calender/calender_edit/", views.calender_edit),
    path("calender/calender_user/", views.calender_user),
    path("calender/calender_test/", views.calender_test),

    # 事件模块
    path("event/", views.event),
    path("event/add/", views.event_add),
    path("event/list_handle/", views.event_list),
    path("event/event_delete/", views.event_delete),
    path("event/event_fund/", views.event_fund),
    path("event/event_edit/", views.event_edit),

    # 基金模块
    path("jijin/", views.jijin),
    path("jijin/add/", views.jijin_add),
    path("jijin/list_handle/", views.jijin_list),
    path("jijin/jijin_delete/", views.jijin_delete),
    path("jijin/jijin_edit/", views.jijin_edit),
    path("jijin/test/", views.test),

    # 股权直投管理模块
    path("guquan/", views.guquan),
    path("guquan/add/", views.guquan_add),
    path("guquan_file/", views.guquan_file),
    path("guquan/list_handle/", views.guquan_list),
    path("guquan/guquan_delete/", views.guquan_delete),
    path("guquan/guquan_edit/", views.guquan_edit),
    path("guquan/guquan_person/", views.guquan_person),
    path("guquan/guquan_jijin/", views.guquan_jijin),

    path("guquan/add_file", views.add_file),

]