from .MysqlHepler import MysqlHelper

def getCalender():
    name_sql = "select * from schedule_person "
    person = MysqlHelper().dict_fetchall(name_sql)

    remind_sql = "select * from schedule_remind "
    remind = MysqlHelper().dict_fetchall(remind_sql)

    association_sql = "select * from schedule_association "
    association = MysqlHelper().dict_fetchall(association_sql)

    time_repeat_sql = "select * from schedule_time_repeat "
    time_repeat = MysqlHelper().dict_fetchall(time_repeat_sql)
    content = {
        "allName": person,
        "remind": remind,
        "association": association,
        "time_repeat": time_repeat,
    }

    return content