from django.db import models
from django.contrib.auth.models import AbstractUser

class Food_Nutrition(models.Model):
	name = models.CharField(max_length = 200)
	unit = models.CharField(max_length = 20)
	value = models.FloatField()

	def __unicode__(self):
		return u'%s' % self.name

class Food_Group(models.Model):
	name = models.CharField(max_length = 200)

	def __unicode__(self):
		return u'%s' % self.name

class User(AbstractUser):
	birth_date = models.DateField(auto_now = False, default = '1970-01-01')
	height = models.FloatField(null = True)
	weight = models.FloatField(null = True)
	gender = models.IntegerField(default = '1')
	is_fat = models.IntegerField(default = '0')
	weight_diff = models.FloatField(default = '0')
	activity_level = models.FloatField(default = '0')
	avatar = models.FileField(upload_to="avatars/")
	age = models.IntegerField(default = '0')
	favourite_food_group = models.ManyToManyField(Food_Group)

	def set_age(self, value):
		self.age = value
	
class Food(models.Model):
	name = models.CharField(max_length = 200)
	total_calories = models.FloatField(null = True)
	nutrients = models.ManyToManyField(Food_Nutrition)
	image = models.FileField(upload_to = "foods/")
	description = models.TextField()
	group = models.ForeignKey(Food_Group, related_name = "foods")
	chief = models.ForeignKey(User, related_name = "foods")
	lovers = models.ManyToManyField(User, through='Food_and_User')
	loves = models.IntegerField(default = "0")
	added_date = models.DateField(auto_now = True)

	def __unicode__(self):
		return u'%s' % self.name

class Food_and_User(models.Model):
	user = models.ForeignKey(User)
	food = models.ForeignKey(Food)
	is_favourite = models.BooleanField()
	
class Machine_Data(models.Model):
	user = models.ForeignKey(User)
	food = models.CharField(max_length = 20)
	status = models.IntegerField(default = 0)

	def __str__(self):
		return self.status