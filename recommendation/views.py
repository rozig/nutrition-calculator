from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponse
from .forms import RegistrationForm
from .models import User, Foods, Machine_Data

def index(request):
	return render(request, 'recommendation/index.html')

def register_view(request):
	if request.method == 'POST':
		form = RegistrationForm(request.POST)
		if form.is_valid():
			user = form.save()
			print request.POST.get('age')
			height = float(request.POST.get("height"))/100
			weight = float(request.POST.get("weight"))
			age = int(request.POST.get("age"))
			gender = request.POST.get("gender")
			bmi = round(weight / (height * height), 2)
			is_fat = request.POST.get("is_fat");
			weight_diff = request.POST.get("weight_diff")
			bmr = 0
			if(int(gender) == 1):
				bmr = (weight*9.6) + (height*1.8*100) - (age * 4.7) + 655
			elif(int(gender) == 2):
				bmr = (weight*13.7) + (height*5*100) - (age * 6.8) + 66
			return render(request, 'registration/registration_successful.html', {'user':user,'bmi': bmi, 'bmr': bmr, 'is_fat': is_fat, 'weight_diff': weight_diff})
	else:
		form = RegistrationForm()
	return render(request, 'registration/register.html', {'form': form})

def dashboard_view(request):
	if request.method == 'POST':
		food_id = request.POST.get('food_id')
		status = request.POST.get('status')
		respons_data = {}
		data = Machine_Data(user=request.user, food=food_id, status=status)
		data.save()
		response_data['result'] = 'Create data successful!'
		response_data['datapk'] = data.pk
		response_data['user'] = data.user.username
		return HttpResponse(json.dumps(response_data), content_type="application/json")
	else:
		foods = Foods.objects.all()[:10]
	return render(request, 'recommendation/dashboard.html', {'foods' : foods})