# -*- coding: utf-8 -*-

from django.shortcuts import render, redirect, render_to_response
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.template import RequestContext
from django.http import HttpResponse

from datetime import date

from .models import User, Foods, Machine_Data

def index(request):
	if request.user.is_authenticated():
		return redirect(dashboard_view)
	else:
		return redirect(login_view)

@login_required(login_url='/login/')
def dashboard_view(request):
	return render_to_response(request, "recommendation/dashboard.html", {"user": request.user}, context_instance=RequestContext(request))

def login_view(request):
	error = ""
	username = password = ""
	if request.POST:
		username = request.POST["username"]
		password = request.POST["password"]

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

def register_view(request):
	error = username = firstname = lastname = password = password_repeat = mail_address = birth_date = ""
	height = weight = weight_diff = activity_level = 0.0
	gender = is_fat = age = bmr = bmi = 0
	if request.POST:
		username = request.POST["username"]
		firstname = request.POST["firstname"]
		lastname = request.POST["lastname"]
		password = request.POST["password"]
		password_repeat = request.POST["password_repeat"]
		mail_address = request.POST["mail_address"]
		height = request.POST["height"]/100
		weight = request.POST["weight"]
		activity_level = request.POST["activity_level"]
		gender = request.POST["gender"]
		birth_date = request.POST["birth_date"]

		if not username or not firstname or not lastname or not password or not password_repeat or not mail_address or not height or not weight or not activity_level or not gender:
			error = u"Та шаардлагатай бүх талбарыг бөглөнө үү!"
			return render(request, "authentication/register.html", {"error": error})
		elif len(username) < 6:
			error = u"Хэрэглэгчийн нэр хамгийн багадаа 5 тэмдэгттэй байх ёстой!"
			return render(request, "authentication/register.html", {"error": error})
		elif password != password_repeat:
			error = u"Оруулсан нууц үг таарахгүй байна!"
			return render(request, "authentication/register.html", {"error": error})
		elif not check_mail(mail_address):
			error = u"Оруулсан мэйл хаяг буруу байна. Дахин шалгана уу!"
			return render(request, "authentication/register.html", {"error": error})
		else:
			if(int(gender) == 1):
				bmr = (weight*9.6) + (height*1.8*100) - (age * 4.7) + 655
			elif(int(gender) == 2):
				bmr = (weight*13.7) + (height*5*100) - (age * 6.8) + 66
			bmi = round(weight / (height * height), 2)
			today = date.today()
			age = today.year - birth_date.year
			if(bmr < 18):
				is_fat = -1
				weight_diff = round(18.0 - bmr, 2)
			elif(bmr > 25):
				is_fat = 1
				weight_diff = round(bmr - 25.0, 2)
			else:
				is_fat = 0
				weight_diff = round(bmr, 2)

			user = User.objects.create_user(username = username, first_name = firstname, last_name = lastname, email = mail_address, gender = gender, is_superuser = False, is_staff = False, is_active = True, date_joined = date.today(), birth_date = birth_date, height = height, weight = weight, is_fat = is_fat, weight_diff = weight_diff, activity_level = activity_level, age = age, password = password)

			return render(request, 'authentication/registration_successful.html')
	else:
		if request.user.is_authenticated():
			return redirect(dashboard_view)
		else:
			return render(request, "authentication/register.html")

def food_view(request):
	if request.POST:
		form = FoodInsertionForm(request.POST)
		if form.is_valid():
			food = form.save()

# def add_food(request):
# 	if request.method == "POST":
		
# 	else:
# 		return render(request, "recommendation/add_food.html");
# 		
def check_mail(mail):
	try:
		validate_email(mail_address)
		return True
	except:
		return False