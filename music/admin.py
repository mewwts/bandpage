from django.contrib import admin
from music.models import *

admin.site.register(SalesLink)
# Den tid den sorg


class AlbumAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['title', 'release_date', 'artwork_img']}),
        ('Vinyl', {'fields': ['is_vinyl', 'vinyl_release_date', 'vinyl_artwork_img']}),
        # There be sales links
    ]

admin.site.register(Album, AlbumAdmin)


class SongAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['title', 'release_date', 'composer', 'album']}),
        ('Lyrics', {'fields': ['lyrics']}),
        ('Single', {'fields': ['is_single', 'single_artwork_img']}),
        # There be sales links
    ]

admin.site.register(Song, SongAdmin)
