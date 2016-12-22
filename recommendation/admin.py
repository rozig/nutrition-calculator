from django.contrib import admin
from .models import User, Food, Food_Group, Food_Nutrition

admin.site.register(User)
admin.site.register(Food_Group)
admin.site.register(Food)
admin.site.register(Food_Nutrition)