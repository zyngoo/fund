from .models import userInfor

def getUserInfo(request):
    try:
        uid = request.session["user_id"]
    except:
        context = {"user": False}
        return context
    user = userInfor.objects.filter(id=uid)
    username = user[0].userName
    telephone = user[0].phone
    email = user[0].userEmail
    head_photo = user[0].head_photo
    # print("head_photo: ",head_photo)
    context = {
        "username":username, "telephone":telephone, "email":email, "head_photo":head_photo, "user": True
    }

    return context