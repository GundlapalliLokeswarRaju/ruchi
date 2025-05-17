from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

@csrf_exempt
def add_numbers(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        a = int(data.get('a', 0))
        b = int(data.get('b', 0))
        result = a * b
        return JsonResponse({'result': result})
    return JsonResponse({'error': 'Invalid request'}, status=400)
