# Generated by Django 2.0.2 on 2019-01-07 07:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('userInfor', '0002_userinfor_photo'),
    ]

    operations = [
        migrations.AddField(
            model_name='userinfor',
            name='file',
            field=models.FileField(null=True, upload_to='files/'),
        ),
        migrations.AddField(
            model_name='userinfor',
            name='head_photo',
            field=models.ImageField(null=True, upload_to='images/'),
        ),
    ]
