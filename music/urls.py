from django.conf.urls import patterns, url
from music import views
from django.utils.translation import ugettext_lazy as _

urlpatterns = patterns('',
                       url(r'^$', views.index, name='index'),
                       url(_(r'lyrics/'), views.lyrics, name='lyrics'),
                       )
