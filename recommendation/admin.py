from django.contrib import admin
from .models import User, Foods, Food_Groups

admin.site.register(User)
admin.site.register(Food_Groups)
admin.site.register(Foods)