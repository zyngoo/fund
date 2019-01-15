from django.db import models

class userInfor(models.Model):
    """
    用户信息表
    """
    id = models.AutoField(primary_key=True)
    upwd = models.CharField(max_length=30, null=True)
    phone = models.CharField(max_length=11, null=True, unique=True)
    userName = models.CharField(max_length=100, null=True)
    userEmail = models.CharField(max_length=30, null=True, unique=True)
    userAddress = models.CharField(max_length=100, null=True)
    photo = models.CharField(max_length=100, null=True)
    head_photo = models.ImageField(upload_to="images/", null=True)
    file = models.FileField(upload_to="files/", null=True)

    def __str__(self):
        return self.userName

