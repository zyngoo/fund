import pymysql


class MysqlHelper:
    def __init__(self, host="localhost", port=3306, db="fund", user="root", passwd="123456", charset="utf8"):
        self.conn = pymysql.connect(host=host, port=port, db=db, user=user, passwd=passwd, charset=charset)

    def insert(self, sql, params):
        return self.__cud(sql, params)

    def update(self, sql, params):
        return self.__cud(sql, params)

    def delete(self, sql, params):
        return self.__cud(sql, params)

    def __cud(self, sql, params=[]):
        try:
            cs1 = self.conn.cursor()
            rows = cs1.execute(sql, params)
            self.conn.commit()
            cs1.close()
            self.conn.close()
            print("MysqlHelper to get Data Number: ",rows)
            return rows
        except Exception as e:
            print("mysqlhelper_exception: ", e)
            self.conn.rollback()


    def fetchone(self, sql, params=[]):
        try:
            cs1 = self.conn.cursor()
            cs1.execute(sql, params)
            row = cs1.fetchone()
            cs1.close()
            self.conn.close()
            return row
        except Exception as e:
            print("mysqlhelper_exception: ", e)

    def fetchall(self, sql, params=[]):
        try:
            cs1 = self.conn.cursor()
            cs1.execute(sql, params)
            rows = cs1.fetchall()
            cs1.close()
            self.conn.close()
            return rows
        except Exception as e:
            print("mysqlhelper_exception: ", e)

    def dict_fetchall(self,sql, params=[]):
        try:
            cursor = self.conn.cursor()
            cursor.execute(sql, params)
            columns = [col[0] for col in cursor.description]
            results = [dict(zip(columns, row)) for row in cursor.fetchall()]
            print("dict_fetchall: ok!")
            cursor.close()
            self.conn.close()
            return results
        except Exception as e:
            print("mysqlhelper_exception: ", e)


    def insert_sql(self,sql):
        try:
            cur = self.conn.cursor()
            rows = cur.execute(sql)
            self.conn.commit()
            cur.close()
            self.conn.close()
            print("MysqlHelper to get Data Number: ", rows)
            return "ok"
        except Exception as e:
            print("mysqlhelper_exception: ", e)
            self.conn.rollback()
            return "error"

    # 分页数据取值
    @staticmethod
    def pagePagAll(requset, tableName, tableAtrr):
        # print(requset)
        # print(requset.GET)
        pageIdx = requset.GET.get('page', 1)  # 默认第一页
        pageSize = requset.GET.get('limit', 10)  # 默认每页十条
        pageIdx = int(pageIdx)
        pageSize = int(pageSize)

        if tableAtrr == '':
            sql = "select * from %s where is_delete=0 limit %d,%d " % (tableName, (pageIdx - 1) * pageSize, pageSize)
            sqlCount = "select * from %s where is_delete=0" % (tableName)
        else:
            sql = "select %s from %s where is_delete=0 limit %d,%d " % (tableAtrr, tableName, (pageIdx - 1) * pageSize, pageSize)
            sqlCount = "select %s from %s where is_delete=0" % (tableAtrr, tableName)

        # count = Common.countLength(sqlCount)
        # print(sql)
        count = MysqlHelper().__cud(sqlCount)

        # select_paging = Common.mysqlExcute(sql)
        select_paging = MysqlHelper().dict_fetchall(sql)

        return count, select_paging