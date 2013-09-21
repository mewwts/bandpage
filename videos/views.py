from django.shortcuts import render
from videos.models import Video


def index(request):
    video_list = Video.objects.all().order_by('id')
    mv_list = [video for video in video_list if video.category == 'mv']
    tv_list = [video for video in video_list if video.category == 'tv']
    cv_list = [video for video in video_list if video.category == 'cv']
    dv_list = [video for video in video_list if video.category == 'dv']
    video_lists = [mv_list, tv_list, cv_list, dv_list]
    context = {'video_lists': video_lists
               }
    return render(request, 'videos/index.html', context)
