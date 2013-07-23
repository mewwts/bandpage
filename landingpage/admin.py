from django.contrib import admin
from landingpage.models import Landingpage

class LanndingAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,               {'fields': ['cover_image']}),
        ('Content', {'fields': ['title', 'link_url', 'text']}),
        ('Theme', {'fields': ['theme']}),
    ]
admin.site.register(Landingpage, LanndingAdmin)
