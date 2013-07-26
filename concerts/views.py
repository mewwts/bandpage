from django.shortcuts import render
from concerts.models import Concert

def index(request):
    concert_list = Concert.objects.all().order_by('date')
    context = {'concert_list': concert_list}
    return render(request, 'concerts/index.html', context)
