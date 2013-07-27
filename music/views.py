from django.shortcuts import render
from music.models import Album
from music.models import Song
from datetime import date


def index(request):
    album_list = Album.objects.all()
    song_list = Song.objects.all()
    single_list = [song for song in song_list if song.is_single]
    vinyl_list = [album for album in album_list if album.is_vinyl]

    context = {'album_list': album_list,
               'single_list': single_list,
               'vinyl_list': vinyl_list}

    return render(request, 'music/index.html', context)

def lyrics(request):
    song_list = Song.objects.all()
    #album_list = [album for sublist in [song.album.all() for song in song_list] for album in sublist if album.release_date <= date.today()]
    lyrics = dict((album, []) for album in Album.objects.all())
    for album in lyrics.keys():
        for song in song_list:
            if album in song.album.all():
                lyrics[album].append(song)

    context = {'lyrics': lyrics,
               }

    return render(request, 'music/lyrics.html', context)
