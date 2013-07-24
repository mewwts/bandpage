from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, fesker. You're at the concert list.")
