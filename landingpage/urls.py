from django.confs.ursl import patterns, url
from landingpage import views

urlpatterns = patterns('', url(r'^$', views.landingpage, name='landingpage'))


