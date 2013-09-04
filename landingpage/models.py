from django.db import models
from bandpage.fields import UniqueBooleanField

class Landingpage(models.Model):
    THEME_CHOICES = (
        ('dark', 'Dark Theme'),
        ('lite', 'Lite Theme')
    )
    slug = models.CharField(max_length=30)
    title = models.CharField(max_length=100)
    text = models.TextField(blank=True, null=True)
    link_url = models.URLField(max_length=200, blank=True, null=True)
    link_text = models.CharField(max_length=200, blank=True, null=True)
    cover_image = models.ImageField(upload_to='landingpages',
                                    help_text='dimensions', blank=True, null=True)
    theme = models.CharField(choices=THEME_CHOICES, max_length=4)
    homepage = UniqueBooleanField()

    def __unicode__(self):
        return self.title + self.theme
