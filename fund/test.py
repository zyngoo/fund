from django.shortcuts import *
import pymysql
import json
from userInfor.models import userInfor

def index(request):
    return redirect("/jijin/")


