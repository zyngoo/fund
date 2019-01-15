import pymysql
from django import *
import configparser


class Common():
    @staticmethod
    def mysqlCon():
        return pymysql.connect(
            host="localhost",
            port = 3306,
            user = "root",
            passwd = "123",
            db = "fund",
            charset = "utf8"
        )

    @staticmethod
    def mysqlClose():
        pass