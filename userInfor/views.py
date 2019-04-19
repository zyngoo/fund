from django.shortcuts import *
from django.template import RequestContext, loader
from django.conf import settings
from django.http import HttpResponse, JsonResponse
from .models import userInfor
from .getUserInfo import getUserInfo

def login(request):
    error_msg = ""
    if request.method == "POST":
        post = request.POST
        username = post.get("username")
        upwd = post.get("pwd")
        jizhu = post.get("jizhu", 0)
        print("jizhu: ", jizhu)
        users = userInfor.objects.filter(userName=username)

        if len(users) == 1:
            if upwd == users[0].upwd:
                url = request.COOKIES.get("url", "/index/")
                red = HttpResponseRedirect(url)

                request.session["user_id"] = users[0].id
                request.session["user_name"] = username
                request.session["head_photo"] = str(users[0].head_photo)
                if jizhu != 0:
                    red.set_cookie("uname", username)
                else:
                    red.set_cookie("uname", "", max_age=-1)
                return red
            else:
                error_msg = "密码错误"
        else:
            error_msg = "用户名错误"

    username = request.COOKIES.get("uname", "")
    print("username: ", username)

    context = {
        "username": username,
        "error": error_msg
    }
    print(context)
    return render(request, "user/login.html", context)


def register_handle(request):
    post = request.POST
    uname = post.get("user_name")
    upwd = post.get("pwd_1")
    cpwd = post.get("pwd_2")
    email = post.get("email")

    if upwd != cpwd:
        return redirect("/user/register/")

    user = userInfor()
    user.userName = uname
    user.upwd = upwd
    user.userEmail = email

    user.save()
    return redirect("/user/login/")


def logout(request):
    request.session.flush()
    return redirect("/index/")

#
# def register(request):
#     return render(request, "user/register.html")



def upload(request):
    print(request.FILES)
    file = request.FILES["file"]
    fname = "%s/images/%s" % (settings.MEDIA_ROOT, file.name)
    print("fname:",fname)

    with open(fname, "wb") as pic:
        for c in file.chunks():
            pic.write(c)
    res = {"url": fname}
    return JsonResponse(res)
    # return HttpResponse("ok")


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
    context = getUserInfo(request)
    # return render(request, "user/userinfo.html", context)
    return render(request, "user/account.html", context)

def countEdit(request):
    if request.method == "POST":
        user = userInfor.objects.get(id=request.session["user_id"])
        post = request.POST

        user.userName = post.get("username")
        user.userEmail = post.get("email")
        user.phone = post.get("phone")
        file = request.FILES["file"]
        print("file:", file)

        fname = "%s/images/%s" % (settings.MEDIA_ROOT, file.name)
        print(fname)
        user.head_photo = fname

        with open(fname, "wb") as pic:
            for c in file.chunks():
                pic.write(c)
        user.save()

        request.session["user_name"] = user.userName
        request.session["head_photo"] = str(user.head_photo)
        return redirect("/user/account/")

    context = getUserInfo(request)
    return render(request, "user/countEdit.html", context)

def account_edit(request):
    if request.method == "POST":
        user = userInfor.objects.get(id=request.session["user_id"])
        post = request.POST

        user.userName = post.get("username")
        user.userEmail = post.get("email")
        user.phone = post.get("phone")
        if post.get("head_photo"):
            user.head_photo = post.get("head_photo")
        user.save()

        request.session["user_name"] = user.userName
        request.session["head_photo"] = str(user.head_photo)
        # print(type(user.head_photo))
        # print("request.session['head_photo']:", request.session["head_photo"])
        return redirect("/user/account/")

    context = getUserInfo(request)
    return render(request, "user/account_edit.html", context)

def password_edit(request):
    if request.method == "POST":
        print(request.POST)
        user = userInfor.objects.get(id=request.session["user_id"])

        if request.POST.get("old_pwd") == user.upwd:
            user.userName = request.POST.get("new_pwd")
            user.save()


    return render(request, "user/password.html")
