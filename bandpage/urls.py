from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.conf.urls.i18n import i18n_patterns
from django.utils.translation import ugettext_lazy as _
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
    url(_(r'^concerts/'), include('concerts.urls', namespace='concerts')),
    url(_(r'^music/'), include('music.urls', namespace='music')),
    url(_(r'^photos/'), include('photos.urls', namespace='photos')),
    url(_(r'^videos/'), include('videos.urls', namespace='videos')),
) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
