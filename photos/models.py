from django.db import models


class Photo(models.Model):
    title = models.CharField(max_length=400)
    photographer = models.CharField(max_length=200, blank=True, null=True)
    # Fix upload urls here
    thumbnail = models.ImageField(upload_to='temp/folder',
                                  help_text='dimensions')
    image = models.ImageField(upload_to='temp/folder',
                              help_text='dimensions')

    def __unicode__(self):
        return self.title
