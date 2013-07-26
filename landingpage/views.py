from django.shortcuts import render
from landingpage.models import Landingpage
from django.shortcuts import render, get_object_or_404
from django.http import Http404

def index(request):
    landingpages = Landingpage.objects.all()
    for page in landingpages:
        if page.homepage:
            return render(request, 'landingpage/index.html', {'landingpage': page})
    raise Http404
