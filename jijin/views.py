from django.shortcuts import *
from django.http import HttpResponse, JsonResponse
from .common import Common
from .MysqlHepler import MysqlHelper
import json

def index(request):
    return render(request, "base.html")

def calender(request):

    return render(request, "jijin/calender.html")

def calender_add(request):

    selectData = "select * from "
    conn = Common.mysqlCon()
    conn = conn.cursor()
    # conn.execute()
    return render(request, "jijin/calender_add.html")

def calender_handle(request):
    post = request.POST
    name = post.get("title")
    person = int(post.get("participants"))
    # print("person: ", person)
    guanlian = int(post.get("interest1"))
    participant = post.get("participation")
    is_public = post.get("open")
    # print("is_public：", is_public)
    address = post.get("address")
    is_all_day = post.get("open2")
    # print("is_all_day_event: ", is_all_day)
    starttime = str(post.get("date1"))
    # endtime = str(post.get("date2"))
    endtime = post.get("date2")
    time = int(post.get("interest2"))
    utiltime = str(post.get("date3"))
    remind = int(post.get("interest3"))
    abstract = post.get("abstract")
    # print(type(person))
    # print(type(endtime))
    # print(name, person, guanlian, participant, is_public, address, is_all_day, starttime, endtime, time,utiltime, remind, abstract)

    sql = "insert into schedule__schedule ("

    for key in request.POST:
        sql = sql + key + ", "
    # print(sql)
    sql = sql.rstrip(",") + ") values ("
    for key in request.POST:
        sql = sql + "\'" + request.POST.get(key) + "\'" + ","
    sqlEnd = sql.rstrip(",") + ")"
    # print(sqlEnd)


    insertData = "insert into schedule__schedule (schedule_name, person_id, association_id, participation," \
                "is_public, address, is_all_day_event,start_time, end_time, time_id, util_time," \
                "remind_id, meeting_summary) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    params = [name,person,guanlian,participant,is_public,address, is_all_day,starttime, endtime,time,utiltime,remind, abstract]

    helper = MysqlHelper()
    result = helper.insert(insertData, params)

    return redirect("/jijin/calender/list")

def calender_list(request):

    return render(request, "jijin/calender_list.html")

from pprint import pprint

def  calender_list_handle(request):
    # sql = "SELECT schedule_id, schedule_name, person_name, association_name, start_time, end_time  from calender_list"
    sql = "SELECT schedule_id, schedule_name, person_name, association_name, date_format(start_time, '%%Y-%%m-%%d %%H:%%i:%%s'), date_format(end_time, '%%Y-%%m-%%d %%H:%%i:%%s'),is_delete," \
          "participation, is_public, address, is_all_day_event, remind_name, time_select, meeting_summary, date_format(util_time, '%%Y-%%m-%%d %%H:%%i:%%s'), person_id, association_id, remind_id,time_id" \
          "   from calender_list where is_delete=0"


    helper = MysqlHelper()
    results = helper.fetchall(sql)

    field = ["schedule_id","schedule_name","person_name","association_name","start_time","end_time", "is_delete", "participation","is_public","address","is_all_day_event",
             "remind_name","time_select","meeting_summary","util_time", "person_id", "association_id", "remind_id", "time_id"]
    jsonData = []
    # zip(len(field), results)
    for row in results:
        # print(row)
        data = {}
        for key in range(len(field)):
            data[field[key]] = row[key]
        jsonData.append(data)
        #
        # data["id"] = row[0]
        # data["name"] = row[1]
        # # print(type(row[0]))
        # data["person"] = row[2]
        # data["fund"] = row[3]
        # data["start_time"] = row[4]
        # data["end_time"] = row[5]
        # data["is_dete"] = str(row[6])
        # print(type(row[6]))



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

def calender_delete(requset):
    id = requset.POST.get('schedule_id')
    # print(id)
    # print(type(id))
    sqlDelete='update schedule__schedule set is_delete=1 where schedule_id=%s'
    param = [id]
    helper = MysqlHelper().update(sqlDelete,param)
    # print(sqlDelete)

    return HttpResponse(json.dumps('2'))
    # conn.execute()

def calender_edit(request):
    print(request.POST)
    post = request.POST
    keyword = ["schedule_id", "schedule_name", "person_name", "association_name", "start_time", "end_time", "participation",
               "is_public", "address", "is_all_day_event", "remind_name", "time_select", "meeting_summary",
               "util_time"]
    # sql = "update calender_list set "
    # for key, value in post.items():
    #     if key != "schedule_id":
    #         sql += key + "=" + value + ", "
    #
    # # sql = sql.rsplit(",")
    # sql = sql[:-2] + " where schedule_id = " + post["schedule_id"]
    # print(sql)

    # sql = "update schedule_schedule "
    #
    # conn = Common.mysqlCon()
    # cursor = conn.cursor()
    # try:
    #     cursor.execute(sql)
    # except Exception as e:
    #     print("error: ", e)
    # cursor.close()
    # conn.close()




def dict_fetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    # print(columns)
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def calender_user(request):
    sql='select * from schedule__person'
    conn=Common.mysqlCon()
    cursor = conn.cursor()
    cursor.execute(sql)
    allname=dict_fetchall(cursor)
    print(allname)
    cursor.close()
    conn.close()

    return HttpResponse(json.dumps(allname))

def calender_test(request):
    sql = "select * from ce where is_delete=1"
    conn = Common.mysqlCon()
    cursor = conn.cursor()
    cursor.execute(sql)
    data = dict_fetchall(cursor)
    # print(data)
    cursor.close()
    conn.close()
    return HttpResponse("ok")