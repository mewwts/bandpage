from django.contrib import admin
from music.models import *
from django.contrib.contenttypes import generic

#admin.site.register(SalesLink)
# Den sorgen tok yours truly og fikset ;-)


class SalesLinkInline(generic.GenericTabularInline):
    model = SalesLink

class AlbumAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['title', 'release_date', 'artwork_img']}),
        ('Vinyl', {'fields': ['is_vinyl', 'vinyl_release_date', 'vinyl_artwork_img']}),
    ]
    inlines = [SalesLinkInline, ]
admin.site.register(Album, AlbumAdmin)


class SongAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['title', 'release_date', 'composer', 'album']}),
        ('Lyrics', {'fields': ['lyrics']}),
        ('Single', {'fields': ['is_single', 'single_artwork_img']}),
    ]
    inlines = [SalesLinkInline, ]

admin.site.register(Song, SongAdmin)
