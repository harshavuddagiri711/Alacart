from .views import TestView
from django.urls import path

urlpatterns = [

	path('tester', TestView.as_view(), name="test")
]
