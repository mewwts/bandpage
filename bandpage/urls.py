from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'bandpage.views.home', name='home'),
    # url(r'^bandpage/', include('bandpage.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
    url(r'^', include('landingpage.urls', namespace='frontpage')),
    url(r'^concerts/', include('concerts.urls', namespace='concerts')),
    url(r'^music/', include('music.urls', namespace='music')),
    url(r'^photos/', include('photos.urls', namespace='photos')),
    url(r'^videos/', include('videos.urls', namespace='videos'))
)
