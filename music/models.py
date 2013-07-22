from django.db import models

# Create your models here.

class Song(models.Model):

    title = models.CharField(max_length=200)
    lyrics = models.TextField(blank=True)
    composer = models.CharField(max_length=100)

    is_single = models.BooleanField()
    artwork_img = models.ImageField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls, only-if is_single

    album = models.ManyToManyField(Album)

    pub_date = models.DateTimeField('date published')
    release_date = models.DateTimeField('date released')

class Album(models.Model):

    title = models.CharField(max_length=200)

    artwork_img = models.ImageField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls, only-if is_single
