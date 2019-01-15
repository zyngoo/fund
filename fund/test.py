from django.shortcuts import *
import pymysql
import json
from userInfor.models import userInfor

def index(request):
    # db = pymysql.connect("localhost", "root", "123", "fund", charset='utf8')
    # sql='select * from fund_fund'
    # cursor = db.cursor()
    # cursor.execute(sql)
    #
    # data = cursor.fetchone()
    # db.close()

    # print(data)\
    # if request.session["user_id"]:
    #     uid = request.session["user_id"]
    #     print(uid)
    #
    #     user = userInfor.objects.filter(id=uid)
    #     print(user)
    #
    #     context = {"username":user[0].userName, "head_photo":user[0].head_photo}
    #
    #     return render(request, "test/index.html",context )
    # else:
    return render(request, "test/index.html")

def selectTest(request):
    fund_name=request.POST.get('fund_name')
    sql='select fund_id from fund_fund where fund_name=%s'%('\''+fund_name+'\'')

    db = pymysql.connect("localhost", "root", "123", "fund", charset='utf8')
    cursor = db.cursor()
    cursor.execute(sql)

    data = cursor.fetchone()
    # print(data)

    # 关闭数据库连接
    db.close()

    return HttpResponse(json.dumps(data))