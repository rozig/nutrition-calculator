# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect, render_to_response
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.http import HttpResponse
from django.http import JsonResponse

from datetime import date

from .models import User, Food, Machine_Data, Food_Nutrition

@api_view(["POST"])
def login_api(request):
    error = ""
    username = password = ""
    if request.POST:
        body_unicode = request.body.decode("UTF-8")
        body = json.loads(body_unicode)
        username = body["username"]
        password = body["password"]
        print username
        # if !username || !password:
        #     response = JsonResponse({
        #         "code": 400,
        #         "message": u"Хандалтын параметр дутуу байна!"
        #     })
        #     return response

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                response = JsonResponse({
                    "code": 200,
                    "message": u"Амжилттай нэвтэрлээ",
                    "token": "dqqwdqdsad"
                })
                return response
            else:
                response = JsonResponse({
                    "code": 403,
                    "message": u"Хэрэглэгч идэвхигүй байна!"
                })
                return response
        else:
            response = JsonResponse({
                "code": 403,
                "message": u"Хэрэглэгчийн нэр эсвэл нууц үг буруу байна!"
            })
            return response