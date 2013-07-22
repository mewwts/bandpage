from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes import generic

# Create your models here.

class Song(models.Model):

    title = models.CharField(max_length=200)
    lyrics = models.TextField(blank=True)
    composer = models.CharField(max_length=100)

    is_single = models.BooleanField()
    artwork_img = models.ImageField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls, only-if is_single

    album = models.ManyToManyField(Album)

    pub_date = models.DateTimeField('date published')
    release_date = models.DateField('date released')

    sales_link = generic.GenericRelation(SalesLink)


class Album(models.Model):

    title = models.CharField(max_length=200)

    artwork_img = models.ImageField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls
    booklet_file = models.FileField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls

    pub_date = models.DateTimeField('date published')
    release_date = models.DateField('date released')

    is_vinyl = models.BooleanField()
    vinyl_artwork_cover = models.ImageField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls, only if is_vinyl
    vinyl_release_date = models.DateField('date released')
    
    sales_link = generic.GenericRelation(SalesLink)


class SalesLink(models.Model):

    LINK_TYPE_CHOICES = (
        ('cd', 'Compact Disc'),
        ('di', 'Digital'),
        ('sy', 'Spotify'),
        ('vi', 'Vinyl'),
        ('wi', 'WiMP'),
        ('ot', 'Other')
    )

    type = models.CharField(choices=LINK_TYPE_CHOICES, max_length=2)
    text = models.CharField(max_length=100, blank=True)
    url = models.URLField()

    content_type = models.ForignKey(ContentType)
    object_id = models.PositiveIntegerField()
    content_object = generic.GenericForeignKey('content_type', 'object_id')



##  TODO 
##  Media root in settings file 
##  upload_to-folders
##  Filetype checker
