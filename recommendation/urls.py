from django.conf.urls import url
from . import views
import django.contrib.auth.views as auth_views

urlpatterns = [
    url(r'^$', views.index, name='home'),
    url(r'^login/$', auth_views.login, name='login'),
    url(r'^logout/$', auth_views.logout, {'next_page': 'home'}, name='logout'),
    url(r'^register/$', views.register_view, name='register'),
    # url(r'^register-successful/$', views.register_successful, name='register_successful'),
    url(r'^dashboard/$', views.dashboard_view, name='dashboard'),
]