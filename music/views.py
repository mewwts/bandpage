from django.shortcuts import render, render_to_response
from music.models import Album
from music.models import Song
from django.template import RequestContext



def index(request):
    album_list = Album.objects.all()
    single_list = [song for song in Song.objects.all() if song.is_single]
    vinyl_list = [album for album in album_list if album.is_vinyl]

    context = {'album_list': album_list,
               'single_list': single_list,
               'vinyl_list': vinyl_list}
#    return render_to_response('music/index.html', context, context_instance=RequestContext(request))
    return render(request, 'music/index.html', context)


def lyrics(request):
    lyrics = dict((album, [song for song in Song.objects.all() if album in song.album.all()]) for album in Album.objects.all())
    context = {'lyrics': lyrics}

    return render(request, 'music/lyrics.html', context)
