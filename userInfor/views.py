from django.shortcuts import *
from .models import userInfor
from django.template import RequestContext, loader


def  userinfo(requset):
    pass



def login(request):
    if request.method == "GET":
        username = request.COOKIES.get("uname", "")
        # print("username: ",username)

        context = {"username": username}

        return render(request, "user/login.html", context)
    else:
        pass


def login_handle(request):
    post = request.POST

    username = post.get("username")
    # print("login_handle/username = ",username)
    upwd = post.get("pwd")

    users = userInfor.objects.filter(userName=username)
    # print(users)
    # print(users[0].userName)

    if len(users) == 1:
        if upwd == users[0].upwd:
            # return HttpResponse("登入成功！")
            url = request.COOKIES.get("url", "/index/")
            # print(url)
            red = HttpResponseRedirect(url)
            red.set_cookie("uname",username)
            request.session["user_id"] = users[0].id
            request.session["user_name"] = username
            # print(users[0].head_photo)
            # print(type(users[0].head_photo))
            # print(type(str(users[0].head_photo)))
            request.session["head_photo"] = str(users[0].head_photo)
            return red
            # return render("/test/index.html", context)
        else:
            # return HttpResponse("密码错误")
            return HttpResponse.set_cookie()
    else:
        return render(request, "user/login.html")

def logout(request):
    request.session.flush()
    return redirect("/index/")


def register(request):
    return render(request, "user/register.html")

def register_handle(request):
    post = request.POST

    uname = post.get("user_name")
    upwd = post.get("pwd")
    cpwd = post.get("cpwd")
    email = post.get("email")

    if upwd != cpwd:
        return redirect("/user/register/")

    user = userInfor()
    user.userName = uname
    user.upwd = upwd
    user.userEmail = email

    user.save()
    return redirect("/user/login/")

from django.conf import settings

def upload(request):
    if request.method == "GET":
        return render(request, "user/upload.html")

def upload_handle(request):
    if request.method == "POST":
        file = request.FILES["pic"]
        fname = "%s/images/%s" % (settings.MEDIA_ROOT, file.name)
        print(fname)

        with open(fname, "wb") as pic:
            for c in file.chunks():
                pic.write(c)
        return HttpResponse("ok")
    else:
        return HttpResponse("error")


def test(request):
    uid = request.session["user_id"]
    print(uid)
    user = userInfor.objects.filter(id=uid)
    print(user)
    print(user[0].head_photo)
    # return HttpResponse(user[0].head_photo)

    t1 = loader.get_template("test/photo_test.html")
    context = {"f":user[0].head_photo}
    return HttpResponse(t1.render(context))


def count(request):
    uid = request.session["user_id"]
    user = userInfor.objects.filter(id=uid)
    username = user[0].userName
    telephone = user[0].phone
    email = user[0].userEmail
    head_photo = user[0].head_photo

    context = {
        "username":username, "telephone":telephone, "email":email, "head_photo":head_photo
    }
    return render(request, "user/userinfo.html", context)

def countEdit(request):
    return render(request, "user/countEdit.html")

def countEdit_handle(request):
    user = userInfor.objects.get(id=request.session["user_id"])
    print(user)
    post = request.POST
    print(post.get("username"))

    user.userName = post.get("username")
    user.userEmail = post.get("email")
    user.phone = post.get("phone")


    file = request.FILES["file"]
    print(file)
    fname = "%s/images/%s" % (settings.MEDIA_ROOT, file.name)
    print(fname)
    user.head_photo = fname

    with open(fname, "wb") as pic:
        for c in file.chunks():
            pic.write(c)

    user.save()

    print(user.userName)
    request.session["user_name"] = user.userName
    request.session["head_photo"] = str(user.head_photo)

    return redirect("/index")
    # return HttpResponse(user.userEmail)



