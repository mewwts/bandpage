from django.shortcuts import render
from videos.models import Video


def index(request):
    video_list = Video.objects.all().order_by('id')
    context = {'video_list': video_list}
    return render(request, 'videos/index.html', context)
