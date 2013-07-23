from django.contrib import admin
from concerts.models import Concert


class ConcertAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['date', 'city', 'venue']}),
        ('URLS', {'fields': ['ticket_url', 'facebook_url']}),
        ('Ticket Status', {'fields': ['is_sold_out']}),
    ]

admin.site.register(Concert, ConcertAdmin)
