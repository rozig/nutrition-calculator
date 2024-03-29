from django.conf.urls import url
from . import views, api
import django.contrib.auth.views as auth_views

urlpatterns = [
    url(r'^$', views.index, name="home"),
    url(r'^login/$', views.login_view, name="login"),
    url(r'^logout/$', auth_views.logout, {"next_page": "home"}, name="logout"),
    url(r'^register/$', views.register_view, name="register"),
    # url(r'^register-successful/$', views.register_successful, name='register_successful'),
    url(r'^dashboard/$', views.dashboard_view, name='dashboard'),
    url(r'^feed/$', views.feed_view, name='feed'),
    url(r'^food/(?P<food_id>[0-9]+)/$', views.food_detail_view, name="food_detail"),
    url(r'^delete-food/(?P<food_id>[0-9]+)/$', views.food_delete_view, name="food_delete"),
    url(r'^(?P<username>[a-zA-Z]+)/$', views.profile_detail_view, name="profile_detail"),
    url(r'^category/(?P<group_id>[0-9]+)/$', views.food_group_view, name="food_group_detail"),
    url(r'^favourites/$', views.favourite_foods_view, name="favourite_food_list"),
    url(r'^add-activity/$', views.add_activity_view, name="add_activity"),
    url(r'^statistic/$', views.get_statistic_view, name="get_statistic"),
    url(r'^add-food/$', views.add_food_view, name="add_food"),
    url(r'^api/login/$', api.login_api, name="login_api"),
]