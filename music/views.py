from django.shortcuts import render
from music.models import Album
from music.models import Song


def index(request):
    album_list = Album.objects.all()
    song_list = Song.objects.all()
    single_list = [song for song in song_list if song.is_single]
    vinyl_list = [album for album in album_list if album.is_vinyl]

    context = {'album_list': album_list,
               'single_list': single_list,
               'vinyl_list': vinyl_list}

    return render(request, 'music/index.html', context)
