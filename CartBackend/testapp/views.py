from django.shortcuts import render
import json
from django.http import HttpResponse, JsonResponse
from django.views import View

class TestView(View):
	def get(self, request):
		data = {
			'name': 'Harsha',
        	'location': 'USA',
        	'is_active': True,
        	'count': 32
    	}
		dump = json.dumps(data)
		return HttpResponse(dump, content_type='application/json')
		
