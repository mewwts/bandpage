from django.db import models
from django.utils import timezone


class Concert(models.Model):
    date = models.DateTimeField('event date')
    city = models.CharField(max_length=30)
    venue = models.CharField(max_length=100)
    ticket_url = models.URLField(max_length=200, blank=True, null=True)
    facebook_url = models.URLField(max_length=200, blank=True, null=True)
    is_sold_out = models.BooleanField()

    def __unicode__(self):
        return self.venue + '-' + str(self.date)

    def is_upcoming(self):
            return self.date > timezone.now()
