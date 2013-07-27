from django.db import models
from music.models import Song


class Video(models.Model):
    PROVIDER_CHOICES = (
        ('vim', 'Vimeo'),
        ('you', 'Youtube'),
    )

    title = models.CharField(max_length=400)
    type = models.CharField(choices=PROVIDER_CHOICES, max_length=3)
    text = models.TextField(blank=True, null=True)
    date_published = models.DateField('Date published')
    song = models.ForeignKey(Song, blank=True, null=True)
    video_id = models.CharField(max_length=60)

    def __unicode__(self):
        return self.title
