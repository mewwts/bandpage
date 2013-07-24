from django.http import HttpResponse

def landingpage(request):
    return HttpResponse("Hello, world. You're at the landingpage")
