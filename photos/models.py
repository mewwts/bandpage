from django.db import models
from django.conf import settings
from bandpage.functions import validate_sizes
from django.core.exceptions import ValidationError

class Photo(models.Model):
    title = models.CharField(max_length=400)
    photographer = models.CharField(max_length=200, blank=True, null=True)
    thumbnail = models.ImageField(upload_to='thumbs',
                                  help_text='dimensions')
    image = models.ImageField(upload_to='images',
                              help_text='dimensions')

    def __unicode__(self):
        return self.title

    def clean(self):
        if validate_sizes(self.thumbnail, settings.ARTWORK_SIZES):
            raise ValidationError('Please upload a thumbnail image with a valid size')