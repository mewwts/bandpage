from django.template import Context, loader
from concerts.models import Concert
from django.http import HttpResponse

def index(request):
    concert_list = Concert.objects.all().order_by('date')
    template = loader.get_template('concerts/index.html')
    context = Context ({
        'concert_list': concert_list,
    })
    return HttpResponse(template.render(context))
