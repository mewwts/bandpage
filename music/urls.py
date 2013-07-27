from django.conf.urls import patterns, url
from music import views

urlpatterns = patterns('',
                       url(r'^$', views.index, name='index'),
                       url(r'lyrics', views.lyrics, name='lyrics'),
                       )
