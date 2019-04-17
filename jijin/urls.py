from django.urls import path
from . import views

urlpatterns = [
    path("", views.index),
    path("shouye/", views.shouye),

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
    path("guquan/technology/",views.guquan),
    path("guquan/internet/",views.guquan),
    path("guquan/medical/",views.guquan),

    path("guquan/add/", views.guquan_add),
    path("guquan_file/", views.guquan_file),

    path("guquan/list_handle/", views.guquan_list),
    path("guquan/list_handle/technology/", views.guquan_list),
    path("guquan/list_handle/internet/", views.guquan_list),
    path("guquan/list_handle/medical/", views.guquan_list),

    path("guquan/guquan_delete/", views.guquan_delete),
    path("guquan/guquan_edit/", views.guquan_edit),
    path("guquan/guquan_person/", views.guquan_person),
    path("guquan/guquan_jijin/", views.guquan_jijin),

    path("guquan/add_file", views.add_file),


    # 二级市场管理模块
    path("market/", views.market),
    path("market/hongkong/", views.market),
    path("market/A_share/", views.market),
    path("market/US_stocks/", views.market),

    path("market/add/", views.market_add),
    path("market/add_gaikuang/", views.market_addGaikuang),
    path("market/add_detail/", views.market_addDetail),
    # path("market/test/", views.market),
    path("market/list_handle/", views.market_list),
    path("market/list_handle/hongkong/", views.market_list),
    path("market/list_handle/A_share/", views.market_list),
    path("market/list_handle/US_stocks/", views.market_list),
    # path("market/detail_data/", views.detail_data),
    path("market/market_delete/", views.market_delete),
    path("market/gaikuang_edit/", views.gaikuang_edit),
    path("market/detail_edit/", views.detail_edit),


    # 行业研究
    path("industry/", views.industry),
    path("industry/add/", views.industry_add),
    path("industry/list_handle/", views.industry_list),
    path("industry/industry_delete/", views.industry_delete),
    path("industry/industry_person/", views.industry_person),
    path("industry/industry_edit/", views.industry_edit),


    # 审批流程
    path("approval/", views.approval),
    path("approval/finance/", views.finance),
    path("approval/finance/list/", views.finance_list),

    path("approval/administration/", views.administration),
    path("approval/administration/list/", views.administration_list),

    path("approval/manpower/", views.manpower),
    path("approval/manpower/list/", views.manpower_list),


   # 合作机构
    path("cooperative/", views.cooperative),
    path("cooperative/add/", views.cooperative_add),
    path("cooperative/list_handle/", views.cooperative_list),
    path("cooperative/cooperative_delete/", views.cooperative_delete),
    path("cooperative/cooperative_edit/", views.cooperative_edit),


    # 人才库
    path("personnel/",views.personnel),
    path("personnel/add/", views.personnel_add),
    path("personnel/list_handle/", views.personnel_list),
    path("personnel/personnel_delete/", views.personnel_delete),
    path("personnel/personnel_edit/", views.personnel_edit),


    # 中介机构
    path("agency/", views.agency),
    path("agency/add/", views.agency_add),
    path("agency/list_handle/", views.agency_list),
    path("agency/agency_delete/", views.agency_delete),
    path("agency/agency_edit/", views.agency_edit),


    # 消息
    path("message/", views.message),
    path("message/list_handle/", views.message_list),
    path("message/message_delete/", views.message_delete),
    path("message/SetRead/", views.SetRead),





]