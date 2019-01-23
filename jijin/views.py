from django.shortcuts import *
from django.http import HttpResponse, JsonResponse
import json
from .common import Common
from .MysqlHepler import MysqlHelper
from . import getData


def index(request):
    content = getData.getCalender()
    return render(request, "jijin/calender.html", content)


def calender(request):
    content = getData.getCalender()
    return render(request, "jijin/calender.html", content)


def calender_add(request):
    content = getData.getCalender()
    return render(request, "jijin/calender_add.html", content)


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
    return render(request, "jijin/calender_list.html")


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
