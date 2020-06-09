from django.urls import path 
from . import views

urlpatterns = [
    path('index/', views.index),
    path('hello/<name>/', views.hello),
    path('times/<int:num1>/<num2>', views.times),
    #path('times/<str:num1>/<num2>', views.times),
    # 두 수를 입력 받아 곱한 결과를 보여주는 페이지
    # <num1>: 기본이 str로 들어온다. <str:num1>으로 하면 숫자가 문자로 들어간다.
    path('dtl/',views.dtl),
    #IS it your birthday? 오늘이 생일이면 "예", "아니면" 아니오
    path('brithday/', views.brithday),
    path('throw/', views.throw),
    path('catch/',views.catch),

    # [로또 번호 생성기]
    # 로또 번호 몇개를 생성할 것인지 input으로 입력 받고
    # 그 갯수 만큼 번호를 random으로 생성하여 보여주기
    path('lotto/', views.lotto),
    path('generate/', views.generate),
    path('user_new/', views.user_new),
    path('user_create/', views.user_create),
]