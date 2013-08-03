from django.contrib import admin
from landingpage.models import Landingpage


class LandingAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['cover_image']}),
        ('Content', {'fields': ['title', 'link_url', 'text']}),
        ('Theme', {'fields': ['theme']}),
    ]
    list_display = ('title', 'homepage')
    list_editable = ('homepage',)

admin.site.register(Landingpage, LandingAdmin)
