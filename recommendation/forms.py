# -*- coding: utf-8 -*-
from django import forms
from django.contrib.auth.forms import AuthenticationForm
from .models import User, Food_Groups
from datetime import date

class RegistrationForm(forms.ModelForm):
	email = forms.EmailField()
	password = forms.CharField(widget=forms.widgets.PasswordInput, label="Password")
	password_repeat = forms.CharField(widget=forms.widgets.PasswordInput, label="Password (Again)")
	gender = forms.ChoiceField(choices=((1, (u"Эрэгтэй")), (2, (u"Эмэгтэй"))), required=True)
	favourite_food_group = forms.ModelMultipleChoiceField(widget = forms.CheckboxSelectMultiple(), queryset=Food_Groups.objects.all(), required=True)

	class Meta:
		model = User
		fields = ['email', 'first_name', 'last_name', 'username', 'height', 'weight', 'gender', 'birth_date', 'favourite_food_group', 'password', 'password_repeat', 'activity_level']

	def save(self, commit=True):
   		user = super(RegistrationForm, self)
   		user_modified = user.save(commit=False)

   		birth_date = self.cleaned_data['birth_date']
		height = float(self.cleaned_data['height'])/100
		weight = float(self.cleaned_data['weight'])
		bmr = round(weight / (height * height), 2)
		today = date.today()
		age = today.year - birth_date.year

		if(bmr < 18):
			user_modified.is_fat = -1
			user_modified.weight_diff = round(18.0 - bmr, 2)
		elif(bmr > 25):
			user_modified.is_fat = 1
			user_modified.weight_diff = round(bmr - 25.0, 2)
		else:
			user_modified.is_fat = 0
			user_modified.weight_diff = round(bmr, 2)
		user_modified.set_password(self.cleaned_data['password'])
		if commit:
			user_modified.save()
		return user
