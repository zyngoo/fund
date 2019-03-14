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
    content = getData.getCalender()
    return render(request, "calender/calender.html", content)


def calender(request):
    content = getData.getCalender()
    # print(content)
    return render(request, "calender/calender.html", content)


def calender_add(request):
    content = getData.getCalender()
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
    return render(request, "calender/calender_list.html")


# 取值
def calender_list_handle(request):
    # sql = "SELECT schedule_id, schedule_name, person_name, association_name, start_time, end_time  from calender_list"
    sql = "SELECT schedule_id, schedule_name, person_name, association_name, date_format(start_time, '%%Y-%%m-%%d %%H:%%i:%%s'), date_format(end_time, '%%Y-%%m-%%d %%H:%%i:%%s'),is_delete," \
          "participation, is_public, address, is_all_day_event, remind_name, time_select, meeting_summary, date_format(util_time, '%%Y-%%m-%%d %%H:%%i:%%s'), person_id, association_id, remind_id,time_id" \
          "   from calender_list where is_delete=0"

    helper = MysqlHelper()
    results = helper.fetchall(sql)

    field = ["schedule_id", "schedule_name", "person_name", "association_name", "start_time", "end_time", "is_delete",
             "participation", "is_public", "address", "is_all_day_event",
             "remind_name", "time_select", "meeting_summary", "util_time", "person_id", "association_id", "remind_id",
             "time_id"]
    jsonData = []
    for row in results:
        # print(row)
        data = {}
        for key in range(len(field)):
            data[field[key]] = row[key]
        jsonData.append(data)

    result = {}
    # print(jsonData)
    result["code"] = 0
    result["msg"] = ""
    result["count"] = len(results)
    result["data"] = jsonData

    # jsonDatar = json.dumps(result, ensure_ascii=False)
    # print(jsonDatar)
    # return  HttpResponse(jsonDatar)
    #
    # print(result)
    return JsonResponse(result)


def calender_list_detail(request):
    pass


# 删除数据
def calender_delete(requset):
    id = requset.POST.get('schedule_id')
    sqlDelete = 'update schedule_schedule set is_delete=1 where schedule_id=%s'
    param = [id]
    MysqlHelper().update(sqlDelete, param)

    return HttpResponse(json.dumps('2'))


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

    MysqlHelper().update(sql, params)

    # sql = "update  schedule__schedule set "
    # for key in request.POST:
    #     sql += key + "='" + request.POST.get(key) + "', "
    # print(sql)
    # sql = sql.rstrip(", ") + " where schedule_id=" + request.POST.get("schedule_id")
    # print(sql)
    #
    # conn = Common.mysqlCon()
    # cursor = conn.cursor()
    # try:
    #     cursor.execute(sql)
    #     conn.commit()
    # except Exception as e:
    #     print(e)
    # cursor.close()
    # conn.close()

    return HttpResponse(json.dumps('2'))


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
    return render(request, "event/event_list.html")


def event_list(request):
    sql = "select title_id, event_name, fund_name, event_type, event_publisher, publish_date, event_status, event_content from event_list where is_delete=0"
    data = MysqlHelper().dict_fetchall(sql)
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = len(data)
    result["data"] = data

    # print(result)
    # {'title_id': 1, 'event_name': '事件一', 'fund_name': 'zhanglei', 'event_type': '事件', 'event_publisher': 'zyngoo', 'publish_date': '2019 - 02 - 27', 'event_status': '代办', 'event_content': '测试事件一'}
    return JsonResponse(result)


def event_add(request):
    if request.method == "POST":
        print(request.POST)
        sql = "insert into event_fund_event ("
        for key in request.POST:
            sql = sql + key + ", "

        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            sql = sql + "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"

        MysqlHelper().insert_sql(sql)
        # print(sql)
        return redirect("/jijin/event")

    content = getData.getFund()
    return render(request, "event/event_add.html", content)


def event_delete(request):
    id = request.POST.get("title_id")
    sqlDelete = "update event_fund_event set is_delete=1 where title_id=%s"
    param = [id]
    MysqlHelper().update(sqlDelete, param)

    return HttpResponse(json.dumps("2"))


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

    MysqlHelper().update(sql, params)

    return HttpResponse(json.dumps("2"))


"""
    基金模块
"""


def jijin(request):
    return render(request, "jijin/jijin_list.html")

def jijin_list(request):
    sql = "select * from jijin_jijin where is_delete=0"
    data = MysqlHelper().dict_fetchall(sql)
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = len(data)
    result["data"] = data
    return JsonResponse(result)

def jijin_add(request):
    if request.method == "POST":
        # data1 = {k: request.POST[k] for k in list(request.POST.keys())[:16]}
        # # print(data1)
        # data2 = {k: request.POST[k] for k in list(request.POST.keys())[16:-6]}
        # # print(data2)
        # data3 = {k: request.POST[k] for k in list(request.POST.keys())[-6:]}
        # print(data3)
        sql = "insert into jijin_jijin ("
        for key in request.POST:
            sql += key + ", "

        sql = sql.rstrip(", ") + ") values ("
        for key in request.POST:
            sql += "\'" + request.POST.get(key) + "\'" + ", "
        sql = sql.rstrip(", ") + ")"

        # print(sql)
        MysqlHelper().insert_sql(sql)

    return render(request, "jijin/jijin_add.html")

def jijin_delete(request):
    id = request.POST.get("fund_id")
    print(request.POST)
    sqlData = "update jijin_jijin set is_delete=1 where fund_id=%s"
    param = [id]
    MysqlHelper().update(sqlData, param)
    return HttpResponse(json.dumps("2"))

def jijin_edit(request):
    # pprint(request.POST)
    sql = "update jijin_jijin set "
    for key in request.POST:
        sql = sql + key + "=%s, "
    sql = sql.rstrip(", ") + " where fund_id=" + request.POST.get("fund_id")
    # print(sql)

    params = []
    for key in request.POST:
        params.append(request.POST.get(key))
    # print(params)

    MysqlHelper().update(sql, params)

    return HttpResponse(json.dumps("2"))

def test(request):
    return render(request, "jijin/select_test.html")


# 股权直投管理模块
def guquan(request):
    return render(request, "guquan/guquan_list.html")

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
    print(jijin)
    person = getData.getFundPerson()
    content = dict(jijin, **person)
    return render(request, "guquan/guquan_add.html", content)


def guquan_list(request):
    sql = "select * from guquan_list where is_delete=0"
    data = MysqlHelper().dict_fetchall(sql)
    result = {}
    result["code"] = 0
    result["msg"] = ""
    result["count"] = len(data)
    result["data"] = data
    # print(result)
    return JsonResponse(result)


def guquan_delete(request):
    id = request.POST.get("id")
    sql = "update guquan_management_technology set is_delete=1 where id=%s"
    param = [id]
    MysqlHelper().update(sql, param)
    return HttpResponse(json.dumps("ok"))


def guquan_person(request):
    # content = {}
    sqlPerson = "select * from fund_person"
    person = MysqlHelper().dict_fetchall(sqlPerson)
    # content["person"] = person
    #

    # content["jijin"] = jijin
    print(person)

    return HttpResponse(json.dumps(person))


def guquan_jijin(request):
    sqlJijin = "select fund_id, fundname from jijin_jijin"
    jijin = MysqlHelper().dict_fetchall(sqlJijin)

    print(jijin)
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