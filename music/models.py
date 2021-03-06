from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes import generic
from django.core.exceptions import ValidationError
from django.conf import settings
from bandpage.functions import validate_sizes


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
    artwork_img = models.ImageField(upload_to='art/album', help_text='dimensions', blank=True)

    is_vinyl = models.BooleanField()
    vinyl_release_date = models.DateField('date released', blank=True, null=True)
    vinyl_artwork_img = models.ImageField(upload_to='art/vinyl',help_text='dimensions', blank=True)

    sales_link = generic.GenericRelation(SalesLink)

    def __unicode__(self):
        return u'%s' % (self.title)

    def clean(self):
        if self.is_vinyl and not (self.vinyl_artwork_img and self.vinyl_release_date):
            raise ValidationError('Vinyls must have artwork and a release date')
        if validate_sizes(self.vinyl_artwork_img, settings.ARTWORK_SIZES):
            raise ValidationError('Please upload a vinyl image with a valid size')


class Song(models.Model):
    title = models.CharField(max_length=200)
    release_date = models.DateField('date released')
    composer = models.CharField(max_length=100)
    lyrics = models.TextField(blank=True)

    is_single = models.BooleanField()
    single_artwork_img = models.ImageField(upload_to='art/single', help_text='dimensions', blank=True)

    album = models.ManyToManyField(Album)
    sales_link = generic.GenericRelation(SalesLink)

    def __unicode__(self):
        return u'%s' % (self.title)

    def clean(self):
        if self.is_single and not self.single_artwork_img:
            raise ValidationError('Singles need artwork')
        if self.is_single and validate_sizes(self.single_artwork_img, settings.ARTWORK_SIZES):
            raise ValidationError('Please upload an image with a valid size')


