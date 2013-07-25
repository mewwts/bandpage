from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes import generic


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
    text = models.CharField(max_length=100, blank=True, help_text='Frontend alternate link text')
    description = models.CharField(max_length=100, help_text='Description for administrative purposes')
    url = models.URLField()

    content_type = models.ForeignKey(ContentType)
    object_id = models.PositiveIntegerField()
    content_object = generic.GenericForeignKey('content_type', 'object_id')

    def __unicode__(self):
        return u'%s %s' % (self.type, self.description)


class Album(models.Model):
    title = models.CharField(max_length=200)
    release_date = models.DateField('date released')
    artwork_img = models.ImageField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls

    is_vinyl = models.BooleanField()
    vinyl_release_date = models.DateField('date released', blank=True)
    vinyl_artwork_img = models.ImageField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls, only if is_vinyl

    sales_link = generic.GenericRelation(SalesLink)

    def __unicode__(self):
        return u'%s' % (self.title)


class Song(models.Model):
    title = models.CharField(max_length=200)
    release_date = models.DateField('date released')
    composer = models.CharField(max_length=100)
    lyrics = models.TextField(blank=True)

    is_single = models.BooleanField()
    single_artwork_img = models.ImageField(upload_to='temp/folder', help_text='dimensions', blank=True) ## Fix later: Urls, only-if is_single

    album = models.ManyToManyField(Album)
    sales_link = generic.GenericRelation(SalesLink)

    def __unicode__(self):
        return u'%s' % (self.title)


##  TODO
##  Media root in settings file
##  upload_to-folders
##  Filetype checker
