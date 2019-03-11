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

def getFund():
    fund_sql = "select * from fund_fund"
    fund = MysqlHelper().dict_fetchall(fund_sql)
    content = {"fund":fund}
    return content

def getJijin():
    jijin_sql = "select fund_id, fund_abbreviation from jijin_jijin"
    jijin = MysqlHelper().dict_fetchall(jijin_sql)
    content = {"jijin": jijin}
    return content

def getFundPerson():
    person_sql = "select person_id, name from fund_person"
    person = MysqlHelper().dict_fetchall(person_sql)
    content = {"person": person}
    return content




if __name__ == "__main__":
    getFund()
