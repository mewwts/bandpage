from django.db import models


class Landingpage(models.Model):

    THEME_CHOICES = (
        ('dark', 'Dark Theme'),
        ('lite', 'Lite Theme')
    )

    title = models.CharField(max_length=100)
    text = models.TextField(blank=True, null=True)
    link_url = models.URLField(max_length=200, blank=True, null=True)
    cover_image = models.ImageField(upload_to='temp/folder',
                                    help_text='dimensions')
    theme = models.CharField(choices=THEME_CHOICES, max_length=4)
