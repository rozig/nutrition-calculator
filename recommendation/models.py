from django.db import models
from django.contrib.auth.models import AbstractUser

class Food_Groups(models.Model):
	id = models.CharField(primary_key=True, max_length=20)
	name = models.CharField(max_length=200)

	def __str__(self):
		return self.name

class User(AbstractUser):
	birth_date = models.DateField(auto_now=False, default='1970-01-01')
	height = models.FloatField(null=True)
	weight = models.FloatField(null=True)
	gender = models.IntegerField(default='1')
	is_fat = models.IntegerField(default='0')
	weight_diff = models.FloatField(default='0')
	activity_level = models.FloatField(default='0')
	age = models.IntegerField(default='0')
	favourite_food_group = models.ManyToManyField(Food_Groups)

	def set_age(self, value):
		self.age = value
		
class Foods(models.Model):
	id = models.CharField(primary_key=True, max_length=20)
	name = models.CharField(max_length=200)

	def __str__(self):
		return self.name

class Machine_Data(models.Model):
	user = models.ForeignKey(User)
	food = models.CharField(max_length=20)
	status = models.IntegerField(default=0)

	def __str__(self):
		return self.status