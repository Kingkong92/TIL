"""intro URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path 
from pages import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('hello/<name>/', views.hello),
    path('times/<int:num1>/<num2>', views.times),
    #path('times/<str:num1>/<num2>', views.times),
    # 두 수를 입력 받아 곱한 결과를 보여주는 페이지
    # <num1>: 기본이 str로 들어온다. <str:num1>으로 하면 숫자가 문자로 들어간다.
    path('dtl/',views.dtl),
    #IS it your birthday? 오늘이 생일이면 "예", "아니면" 아니오
    path('brithday/', views.brithday),
]   
