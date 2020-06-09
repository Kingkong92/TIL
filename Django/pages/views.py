from django.shortcuts import render

# Create your views here.
def index(request):
    hello = "hello :)"
    lunch = '라멘'
    context = {
        'hello': hello, 
    'l': lunch}

    return render(request, 'pages/index.html', context)
    # lunch에 해당 하는 변수를 마음대로 설정 가능하다. 
    # context를 사용하면 변수를 각각 넣을 필요 없고 index.html에서 불러오기만 하면된다.
def hello(request, name):
    apple = input( ) 
    context = {
        'name': name,

    }
    return render(request, 'pages/hello.html', context)

def times(request, num1, num2):
    result = int(num1) + int(num2)
    context = {
        'num1':num1,
        'num2':num2,
        'result': result,
    }
    return render(request, 'pages/times.html', context)

from datetime import datetime
def dtl(request):
    foods = ['짜장면', '탕수육', '짬뽕', '양장피']
    sentence = 'Life is short, you need python'
    fruits = ['apple','banana', 'cucumber', 'mango']
    datetimenow = datetime.now()
    empty_list = []

    context = {
        'foods': foods,
        'sentence': sentence,
        'fruits': fruits,
        'datetimenow': datetimenow,
        'empty_list': empty_list,
    }
    return render(request, 'pages/dtl.html', context)

def brithday(request):
    # 1. 오늘 날짜 가져오기
    today = datetime.now()

    # 2. month, day 가져와서 오늘 날짜와 비교하기
    result = (today.month == 12 and today.day == 15) # Vs => 6 & 8

    context = {
        'result': result
    }
    return render(request, 'pages/brithday.html',context)

def throw(request):
    context = {

    }
    return render(request, 'pages/throw.html', context)


def catch(request):
    username = request.GET.get('username')
    message = request.GET.get('message') 
    # GET 딕셔너리 형태 =>    // .get() 메서드 
    context = {
        'message':message,
        'username':username,
    }
    return render(request, 'pages/catch.html', context)

def lotto(request):
    context ={

    }
    return render(request, 'pages/lotto.html', context)

import random

def generate(request):

    number = int(request.GET.get('number'))
    lotto_number = range(1,46)
    lotto = []
    for i in range(number):
        lotto.append(sorted(random.sample(lotto_number, 6)))

    context = {
        'lotto':lotto,
    }
    return render(request, 'pages/generate.html', context)

def user_new(request):
    context ={
        
    }
    return render(request, 'pages/user_new.html', context)

def user_create(request):
    username = request.POST.get('username')
    pw = request.POST.get('pw')
    context = {
        'username':username,
        'pw': pw,
    }
    return render(request, 'pages/user_create.html', context)