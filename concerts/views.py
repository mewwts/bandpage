from django.shortcuts import render
from concerts.models import Concert

def index(request):
    concert_list = Concert.objects.all().order_by('date')
    upcoming_concerts = [concert for concert in concert_list if concert.is_upcoming()]
    past_concerts = [concert for concert in concert_list if concert not in upcoming_concerts]
    list = [upcoming_concerts, past_concerts]
    context = {'concert_lists': list,
               }
    return render(request, 'concerts/index.html', context)
