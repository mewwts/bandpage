from django.db import models


class Landingpage(models.Model):

    THEME_CHOICES = (
        ('dark', 'Dark Theme'),
        ('lite', 'Lite Theme')
    )

    title = models.CharField()
    text = models.TextField()
    link_url = models.URLField(max_length=200)
    cover_image = models.ImageField(upload_to='temp/folder',
                                    help_text='dimensions')
    theme = models.CharField(choices=THEME_CHOICES, max_length=4)
