# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect, render_to_response
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.http import HttpResponse
from django.http import JsonResponse

from datetime import date

from .models import User, Food, Machine_Data, Food_Nutrition

def login_api(request):
    error = ""
    username = password = ""
    if request.POST:
        username = request.POST["username"]
        password = request.POST["password"]

        if(!username or !password):
            response = JsonResponse({})

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect(dashboard_view)
            else:
                error = u"Хэрэглэгч идэвхигүй байна!"
                return render(request, "authentication/login.html", {"error": error})
        else:
            error = u"Хэрэглэгчийн нэр эсвэл нууц үг буруу байна!"
            return render(request, "authentication/login.html", {"error": error})
    else:
        if request.user.is_authenticated():
            return redirect(dashboard_view)
        else:
            return render(request, "authentication/login.html", {"error": error})