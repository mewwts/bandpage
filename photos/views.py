from django.shortcuts import render
from photos.models import Photo 


def index(request):
    photo_list = Photo.objects.all().order_by('id')
    context = {'photo_list': photo_list}
    return render(request, 'photos/index.html', context)
