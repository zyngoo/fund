from django.shortcuts import *
from django.http import HttpResponse, JsonResponse
import json
from pprint import pprint
from .common import Common
from .MysqlHepler import MysqlHelper
from . import getData
from fund import settings

'''
    日程模块
'''


def index(request):
    return render(request, "shouye.html", {"active_nav":"shouye"})


def shouye(request):
    return render(request, "shouye.html", {"active_nav":"shouye"})


def calender(request):
    return render(request, "calender/calender.html", {"active_nav": "calender", "tab_nav": ""})


def calender_add(request):
    content = getData.getCalender()
    content["tab_nav"] = "add"
    content["active_nav"] = "calender"
    # print(content)
    return render(request, "calender/calender_add.html", content)


# 增加数据
def calender_handle(request):
    sql = "insert into schedule_schedule ("
    for key in request.POST:
        sql = sql + key + ", "
    sql = sql.rstrip(", ") + ") values ("
    for key in request.POST:
        sql = sql + "\'" + request.POST.get(key) + "\'" + ","
    sqlEnd = sql.rstrip(",") + ")"
    # print(sqlEnd)
    # insertData = "insert into schedule_schedule (schedule_name, person_id, association_id, participation," \
    #             "is_public, address, is_all_day_event,start_time, end_time, time_id, util_time," \
    #             "remind_id, meeting_summary) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    # params = [name,person,guanlian,participant,is_public,address, is_all_day,starttime, endtime,time,utiltime,remind, abstract]
    MysqlHelper().insert_sql(sqlEnd)

    return redirect("/jijin/calender/list")


def calender_list(request):
    return render(request, "calender/calender_list.html", {"active_nav": "calender", "tab_nav": "show"})


# 取值
def calender_list_handle(request):
    # sql = "SELECT schedule_id, schedule_name, person_name, association_name, start_time, end_time  from calender_list"
    # sql = "SELECT schedule_id, schedule_name, person_name, association_name, date_format(start_time, '%%Y-%%m-%%d %%H:%%i:%%s'), date_format(end_time, '%%Y-%%m-%%d %%H:%%i:%%s'),is_delete," \
    #       "participation, is_public, address, is_all_day_event, remind_name, time_select, meeting_summary, date_format(util_time, '%%Y-%%m-%%d %%H:%%i:%%s'), person_id, association_id, remind_id,time_id" \
    #       "   from calender_list where is_delete=0"
    # sql = "select * from calender_list where is_delete=0"
    #
    # helper = MysqlHelper()
    # results = helper.dict_fetchall(sql)
    # print(request.path)

    count, data = MysqlHelper().pagePagAll(request, "calender_list", "", "")
    # print("count: ", count)
    # print("data: ", data)

    # field = ["schedule_id", "schedule_name", "person_name", "association_name", "start_time", "end_time", "is_delete",
    #          "participation", "is_public", "address", "is_all_day_event",
    #          "remind_name", "time_select", "meeting_summary", "util_time", "person_id", "association_id", "remind_id",
    #          "time_id"]
    # jsonData = []
    # for row in results:
    #     # print(row)
    #     data = {}
    #     for key in range(len(field)):
    #         data[field[key]] = row[key]
    #     jsonData.append(data)

    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data

    # jsonDatar = json.dumps(result, ensure_ascii=False)
    # print(jsonDatar)
    # return  HttpResponse(jsonDatar)
    #
    # print(result)
    return JsonResponse(result)


# 删除数据
def calender_delete(requset):
    id = requset.POST.get('schedule_id')
    sqlDelete = 'update schedule_schedule set is_delete=1 where schedule_id=%s'
    param = [id]
    result = MysqlHelper().update(sqlDelete, param)

    return HttpResponse(json.dumps(result))


# 修改数据
def calender_edit(request):
    sql = "update  schedule_schedule set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where schedule_id=" + request.POST.get("schedule_id")
    print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    print(params)

    result = MysqlHelper().update(sql, params)


    return HttpResponse(json.dumps(result))


#  取出shedule_person 数据表的id 与名字 组合成字典传送回去
def calender_user(request):
    sql = 'select * from schedule_person'
    allname = MysqlHelper().dict_fetchall(sql)

    return HttpResponse(json.dumps(allname))


def calender_test(request):
    sql = "select * from schedule_person "
    MysqlHelper().dict_fetchall(sql)
    return HttpResponse("ok")


"""
    事件模块
"""


def event(request):
    return render(request, "event/event_list.html", {"active_nav": "event", "tab_nav": "show"})


def event_list(request):
    # sql = "select title_id, event_name, fund_name, event_type, event_publisher, publish_date, event_status, event_content from event_list where is_delete=0"
    # data = MysqlHelper().dict_fetchall(sql)

    count, data = MysqlHelper().pagePagAll(request, "event_list", "", "")

    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data

    # print(result)
    # {'title_id': 1, 'event_name': '事件一', 'fund_name': 'zhanglei', 'event_type': '事件', 'event_publisher': 'zyngoo', 'publish_date': '2019 - 02 - 27', 'event_status': '代办', 'event_content': '测试事件一'}
    return JsonResponse(result)


def event_add(request):
    if request.method == "POST":
        # print(request.POST)
        sql = "insert into event_fund_event ("
        for key in request.POST:
            if key != "file":
                sql = sql + key + ", "
        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            if key != "file":
                sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"

        MysqlHelper().insert_sql(sql)
        # print(sql)
        return redirect("/jijin/event")

    content = getData.getFund()
    content["tab_nav"] = "add"
    content["active_nav"] = "event"
    return render(request, "event/event_add.html", content)


def event_delete(request):
    id = request.POST.get("title_id")
    sqlDelete = "update event_fund_event set is_delete=1 where title_id=%s"
    param = [id]
    result = MysqlHelper().update(sqlDelete, param)

    return HttpResponse(json.dumps(result))


def event_fund(request):
    sql = "select * from fund_fund"
    fund_fund = MysqlHelper().dict_fetchall(sql)
    # print(fund_fund)
    return HttpResponse(json.dumps(fund_fund))


def event_edit(request):
    # print(request.POST)
    sql = "update event_fund_event set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where title_id=" + request.POST.get("title_id")
    print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    print(params)

    result = MysqlHelper().update(sql, params)

    return HttpResponse(json.dumps(result))


"""
    基金模块
"""


def jijin(request):
    return render(request, "jijin/jijin_list.html", {"active_nav": "jijin", "tab_nav": "show"})


def jijin_list(request):
    # sql = "select * from jijin_jijin where is_delete=0"
    # data = MysqlHelper().dict_fetchall(sql)
    # print(request.path)

    count, data = MysqlHelper().pagePagAll(request, "jijin_jijin", "", "")
    # print("count: ", count)
    # print("data: ", data)
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data
    return JsonResponse(result)


def jijin_add(request):
    # if request.method == "POST":
    #     # data1 = {k: request.POST[k] for k in list(request.POST.keys())[:16]}
    #     # # print(data1)
    #     # data2 = {k: request.POST[k] for k in list(request.POST.keys())[16:-6]}
    #     # # print(data2)
    #     # data3 = {k: request.POST[k] for k in list(request.POST.keys())[-6:]}
    #     # print(data3)
    #     sql = "insert into jijin_jijin ("
    #     for key in request.POST:
    #         sql += key + ", "
    #
    #     sql = sql.rstrip(", ") + ") values ("
    #     for key in request.POST:
    #         sql += "\'" + request.POST.get(key) + "\'" + ", "
    #     sql = sql.rstrip(", ") + ")"
    #
    #     # print(sql)
    #     MysqlHelper().insert_sql(sql)

    return render(request, "jijin/jijin_add.html", {"active_nav": "jijin", "tab_nav": "add"})


def jijin_addHandle(request):
    print("ajax:")
    print(request.POST)
    sql = "insert into jijin_jijin ("
    for key in request.POST:
        sql += key + ", "

    sql = sql.rstrip(", ") + ") values ("
    for key in request.POST:
        sql += "\'" + request.POST.get(key) + "\'" + ", "
    sql = sql.rstrip(", ") + ")"

    # print(sql)
    rows = MysqlHelper().insert_sql(sql)
    print(rows)
    if rows == "ok":
        return HttpResponse("1")
    elif rows == "error":
        return HttpResponse("2")
    else:
        return HttpResponse("3")

    # return render(request, "jijin/jijin_add.html")


def jijin_delete(request):
    id = request.POST.get("fund_id")
    print(request.POST)
    sqlData = "update jijin_jijin set is_delete=1 where fund_id=%s"
    param = [id]
    result = MysqlHelper().update(sqlData, param)
    return HttpResponse(json.dumps(result))


def jijin_edit(request):
    pprint(request.POST)
    sql = "update jijin_jijin set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where fund_id=" + request.POST.get("fund_id")
    # print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    # print(params)

    resutl = MysqlHelper().update(sql, params)

    return HttpResponse(json.dumps(resutl))


def test(request):
    return render(request, "jijin/select_test.html")


# 股权直投管理模块
def guquan(request):
    type = (request.path).split("/")[-2]
    print(type)
    if type == "guquan":
        type = ""
    content = {"type": type, "active_nav": type, "tab_nav": "show"}
    return render(request, "guquan/guquan_list.html", content)


def guquan_add(request):
    if request.method == "POST":
        print(request.POST)
        sql = "insert into guquan_management_technology ("
        for key in request.POST:
            if key != "file":
                sql = sql + key + ", "
        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            if key != "file":
                sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"
        print(sql)
        MysqlHelper().insert_sql(sql)
        return redirect("/jijin/guquan")

    jijin = getData.getJijin()
    person = getData.getFundPerson()
    nav = {"active_nav": "guanquan", "tab_nav": "add"}
    content = dict(jijin, **person, **nav)
    print(content)
    return render(request, "guquan/guquan_add.html", content)


def guquan_list(request):
    # print(request.path)
    type = (request.path).split("/")[-2]
    if type == "technology":
        type = "科技产业"
        sql = "select * from guquan_list where is_delete=0 and project_industry=" + "\'" + type + "\'"
        count, data = MysqlHelper().pagePagAll(request, "guquan_list", "", "project_industry='科技产业'")
    elif type == "internet":
        type = "互联网产业"
        sql = "select * from guquan_list where is_delete=0 and project_industry=" + "\'" + type + "\'"
        count, data = MysqlHelper().pagePagAll(request, "guquan_list", "", "project_industry='互联网产业'")
    elif type == "medical":
        type = "医疗产业"
        sql = "select * from guquan_list where is_delete=0 and project_industry=" + "\'" + type + "\'"
        count, data = MysqlHelper().pagePagAll(request, "guquan_list", "", "project_industry='医疗产业'")
    else:
        sql = "select * from guquan_list where is_delete=0"
        count, data = MysqlHelper().pagePagAll(request, "guquan_list", "", "")

    # print(sql)

    # count, data = MysqlHelper().pagePagAll(request, "guquan_list", "")
    # data = MysqlHelper().dict_fetchall(sql)
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data
    # print(result)
    return JsonResponse(result)


def guquan_delete(request):
    id = request.POST.get("id")
    sql = "update guquan_management_technology set is_delete=1 where id=%s"
    param = [id]
    result = MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps(result))


def guquan_edit(request):
    pprint(request.POST)
    sql = "update guquan_management_technology set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where id=" + request.POST.get("id")
    # print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    print(params)

    result = MysqlHelper().update(sql, params)

    return HttpResponse(json.dumps(result))


def guquan_person(request):
    sqlPerson = "select * from fund_person"
    person = MysqlHelper().dict_fetchall(sqlPerson)
    print(person)
    return HttpResponse(json.dumps(person))


def guquan_jijin(request):
    sqlJijin = "select fund_id, fundname from jijin_jijin"
    jijin = MysqlHelper().dict_fetchall(sqlJijin)

    return HttpResponse(json.dumps(jijin))


def guquan_file(request):
    file = request.FILES["file"]
    # print("settings.MEDIA_ROOT", settings.MEDIA_ROOT)
    # print("file.name: ", file.name)
    fname = "%s/files/%s" % (settings.MEDIA_ROOT, file.name)
    # print(fname)

    with open(fname, "wb") as pic:
        for c in file.chunks():
            pic.write(c)
    # return HttpResponse("ok")
    res = {"url": fname}
    return JsonResponse(res)


def add_file(request):
    if request.method == "POST":
        print(request.POST)
    return render(request, "guquan/file_upload.html")


# 二级市场管理模块

def market(request):
    type = (request.path).split("/")[-2]
    if type == "market":
        type = ""
    content = {"type": type, "active_nav": type, "tab_nav": "show"}
    return render(request, "market/market_list.html", content)


def market_add(request):
    if request.method == "POST":
        print(request.POST)
        sql = "insert into market_management ("
        for key in request.POST:
            sql = sql + key + ", "
        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"
        print(sql)

        MysqlHelper().insert_sql(sql)
        return redirect("/jijin/market/")

    content = {"active_nav": "market", "tab_nav": "add"}
    return render(request, "market/market_add.html", content)


# def market_addGaikuang(request):
#     if request.method == "POST":
#         print(request.POST)
#         sql = "insert into market_management_gaikuang ("
#         for key in request.POST:
#             sql = sql + key + ", "
#         sql = sql.rstrip(", ") + ") values ("
#         for key in request.POST:
#             sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
#         sql = sql.rstrip(", ") + ")"
#         print(sql)
#
#         MysqlHelper().insert_sql(sql)
#         return redirect("/jijin/market/")
#     return render(request, "market/market_add.html")
#
#
# def market_addDetail(request):
#     if request.method == "POST":
#         print(request.POST)
#         sql = "insert into market_management_detail ("
#         for key in request.POST:
#             sql = sql + key + ", "
#         sql = sql.rstrip(", ") + ") values ("
#         for key in request.POST:
#             sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
#         sql = sql.rstrip(", ") + ")"
#         # print(sql)
#         MysqlHelper().insert_sql(sql)
#         return redirect("/jijin/market/")
#     return render(request, "market/market_add.html")


def market_delete(request):
    id = request.POST.get("id")
    sql = "update market_management set is_delete=1 where id=%s"
    param = [id]
    result = MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps(result))


def market_list(request):
    type = (request.path).split("/")[-2]
    if type == "hongkong":
        # type = "港股"
        # sql = "select * from market_list where is_delete=0 and stock_type=" + "\'" + type + "\'"
        count, data = MysqlHelper().pagePagAll(request, "market_management", "", "stock_type='港股'")
    elif type == "A_share":
        # type = "A股"
        # sql = "select * from market_list where is_delete=0 and stock_type=" + "\'" + type + "\'"
        count, data = MysqlHelper().pagePagAll(request, "market_management", "", "stock_type='A股'")
    elif type == "US_stocks":
        # type = "美股"
        # sql = "select * from market_list where is_delete=0 and stock_type=" + "\'" + type + "\'"
        count, data = MysqlHelper().pagePagAll(request, "market_management", "", "stock_type='美股'")
    else:
        # sql = "select * from  market_list where is_delete=0"
        count, data = MysqlHelper().pagePagAll(request, "market_management", "", "")

    # data = MysqlHelper().dict_fetchall(sql)
    print("count", count)
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data
    # print(result)
    return JsonResponse(result)


#
# def detail_data(request):
#     id = request.POST.get("id")
#     sql = "SELECT * from market_management_detail LEFT JOIN market_management_gaikuang on " \
#           "market_management_detail.gaikuang_id=market_management_gaikuang.id and market_management_gaikuang.id=%s"
#     detail_data = MysqlHelper().dict_fetchall(sql, [id])
#     print(detail_data)
#
#     return HttpResponse(json.dumps(detail_data))

def market_edit(request):
    print(request.POST)
    sql = "update market_management set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where id=" + request.POST.get("id")
    # print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    print(params)

    result = MysqlHelper().update(sql, params)
    return HttpResponse(json.dumps(result))


# def detail_edit(request):
#     # print(request.POST)
#     sql = "update market_management_gaikuang set "
#     for key in request.POST:
#         sql = sql + key + "=%s, "
#     sql = sql.rstrip(", ") + " where id=" + request.POST.get("detail_id")
#     # print(sql)
#
#     params = []
#     for key in request.POST:
#         params.append(request.POST.get(key))
#     # print(params)
#
#     MysqlHelper().update(sql, params)
#     return HttpResponse(json.dumps("ok"))


# 行业研究
def industry(request):
    content = {"active_nav": "industry", "tab_nav": "show"}
    return render(request, "industry/industry_list.html", content)


def industry_add(request):
    if request.method == "POST":
        print(request.POST)
        sql = "insert into research_industry_research ("
        for key in request.POST:
            if key != "file":
                sql = sql + key + ", "
        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            if key != "file":
                sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"
        print(sql)
        MysqlHelper().insert_sql(sql)
        return redirect("/jijin/industry/")

    person = getData.getFundPerson()
    nav = {"active_nav": "industry", "tab_nav": "add"}
    content = dict(person, **nav)
    return render(request, "industry/industry_add.html", content)


def industry_list(request):
    # sql = "select * from industry_list where is_delete=0"
    # data = MysqlHelper().dict_fetchall(sql)
    count, data = MysqlHelper().pagePagAll(request, "industry_list", "", "")
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data
    # print(result)
    return JsonResponse(result)


def industry_delete(request):
    id = request.POST.get("id")
    print(id)
    sql = "update research_industry_research set is_delete=1 where industry_research_id=%s"
    param = [id]
    result = MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps(result))


def industry_person(request):
    sqlPerson = "select * from fund_person"
    person = MysqlHelper().dict_fetchall(sqlPerson)
    # print(person)
    return HttpResponse(json.dumps(person))


def industry_edit(request):
    print(request.POST)
    sql = "update research_industry_research set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where industry_research_id=" + request.POST.get("industry_research_id")
    # print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    # print(params)

    result = MysqlHelper().update(sql, params)
    return HttpResponse(json.dumps(result))


# 审批流程
def approval(request):
    return render(request, "approval/approval.html")


def finance(request):
    return render(request, "approval/caiwu_index.html")


def finance_list(request):
    return render(request, "approval/caiwu_list.html")


def administration(request):
    return render(request, "approval/xingzheng_index.html")


def administration_list(request):
    return render(request, "approval/xingzheng_list.html")


def manpower(request):
    return render(request, "approval/renli_index.html")


def manpower_list(request):
    return render(request, "approval/renli_list.html")


"""
    合作机构
"""


def cooperative(request):
    content = {"active_nav": "cooperative", "tab_nav": "show"}
    return render(request, "cooperative/cooperative_list.html", content)


def cooperative_add(request):
    if request.method == "POST":
        print(request.POST)
        sql = "insert into other_cooperative_organization ("
        for key in request.POST:
            sql = sql + key + ", "
        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"
        # print(sql)
        MysqlHelper().insert_sql(sql)
        return redirect("/jijin/cooperative/")

    content = {"active_nav": "cooperative", "tab_nav": "add"}
    return render(request, "cooperative/cooperative_add.html", content)


def cooperative_list(request):
    # sql = "select * from other_cooperative_organization where is_delete=0"
    # data = MysqlHelper().dict_fetchall(sql)
    count, data = MysqlHelper().pagePagAll(request, "other_cooperative_organization", "", "")
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data
    # print(result)
    return JsonResponse(result)


def cooperative_delete(request):
    id = request.POST.get("id")
    print(id)
    sql = "update other_cooperative_organization set is_delete=1 where id=%s"
    param = [id]
    result = MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps(result))


def cooperative_edit(request):
    print(request.POST)
    sql = "update other_cooperative_organization set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where id=" + request.POST.get("id")
    # print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    # print(params)

    result = MysqlHelper().update(sql, params)
    return HttpResponse(json.dumps(result))


'''
    人才库
'''

def personnel(request):
    content = {"active_nav": "personnel", "tab_nav": "show"}
    return render(request, "personnel/personnel_list.html", content)


def personnel_add(request):
    if request.method == "POST":
        print(request.POST)
        sql = "insert into other_talent_pool ("
        for key in request.POST:
            if key != "file":
                sql = sql + key + ", "
        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            if key != "file":
                sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"
        print(sql)
        MysqlHelper().insert_sql(sql)
        return redirect("/jijin/personnel/")

    content = {"active_nav": "personnel", "tab_nav": "add"}
    return render(request, "personnel/personnel_add.html", content)


def personnel_list(request):
    # sql = "select * from other_talent_pool where is_delete=0"
    # data = MysqlHelper().dict_fetchall(sql)
    count, data = MysqlHelper().pagePagAll(request, "other_talent_pool", "", "")
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data
    # print(result)
    return JsonResponse(result)


def personnel_delete(request):
    id = request.POST.get("id")
    print(id)
    sql = "update other_talent_pool set is_delete=1 where id=%s"
    param = [id]
    result = MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps(result))


def personnel_edit(request):
    print(request.POST)
    sql = "update other_talent_pool set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where id=" + request.POST.get("id")
    # print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    # print(params)

    result = MysqlHelper().update(sql, params)
    return HttpResponse(json.dumps(result))


# 中介机构
def agency(request):
    content = {"active_nav": "agency", "tab_nav": "show"}
    return render(request, "agency/agency_list.html", content)

def agency_add(request):
    if request.method == "POST":
        print(request.POST)
        sql = "insert into other_intermediary_organ ("
        for key in request.POST:
            sql = sql + key + ", "
        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"
        print(sql)
        MysqlHelper().insert_sql(sql)
        return redirect("/jijin/agency/")

    content = {"active_nav": "agency", "tab_nav": "add"}
    return render(request, "agency/agency_add.html", content)


def agency_list(request):
    # sql = "select * from other_intermediary_organ where is_delete=0"
    # data = MysqlHelper().dict_fetchall(sql)
    count, data = MysqlHelper().pagePagAll(request, "other_intermediary_organ", "", "")
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = count
    result["data"] = data
    print(result)
    return JsonResponse(result)


def agency_delete(request):
    id = request.POST.get("id")
    # print(id)
    sql = "update other_intermediary_organ set is_delete=1 where id=%s"
    param = [id]
    result = MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps(result))


def agency_edit(request):
    print(request.POST)
    sql = "update other_intermediary_organ set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where id=" + request.POST.get("id")

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))

        result = MysqlHelper().update(sql, params)
    return HttpResponse(json.dumps(result))


# 消息
def message(request):
    type = (request.path).split("/")[-2]
    print(type)
    # type = (request.path).split("/")[-2]
    if type == "all":
        content = {"active_nav": "message", "tab_nav": "all"}
        return render(request, "message/message_all.html", content)
    content = {"active_nav": "message", "tab_nav": "unread"}
    return render(request, "message/message_list.html", content)


def message_list(request):
    type = (request.path).split("/")[-2]
    print(type)
    if type == "unread_handle":
        sql = "SELECT box.* from msg_mail_box box, msg_mail_relation rela " \
              "WHERE box.ID=rela.MailID and box.IsDelete=0 and rela.IsRead=0"
    elif type == "all_handle":
        sql = "SELECT box.* from msg_mail_box box, msg_mail_relation rela " \
              "WHERE box.ID=rela.MailID and box.IsDelete=0 "
    else:
        return JsonResponse({"msg": "data error"})
    # sql = "SELECT box.Title, box.Content, DATE_FORMAT(box.SendDate, '%%Y-%%m-%%d %%H:%%i:%%s') , rela.IsRead from msg_mail_box box, msg_mail_relation rela WHERE box.ID=rela.MailID and box.IsDelete=0"
    data = MysqlHelper().dict_fetchall(sql)
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = len(data)
    result["data"] = data
    # print(result)
    return JsonResponse(result)


def message_delete(request):
    id = request.POST.get("id")
    # print(id)
    sql = "update msg_mail_box set IsDelete=1 where ID=%s"
    param = [id]
    result = MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps(result))


def SetRead(request):
    id = request.POST.get("id")
    # print(id)
    sql = "update msg_mail_relation set IsRead=1 where ID=%s"
    param = [id]
    result = MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps(result))
