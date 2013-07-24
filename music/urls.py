from django.conf.urls import patterns, url
from music import views

urlpatterns = patterns('', url(r'^$', views.music, name='music'))