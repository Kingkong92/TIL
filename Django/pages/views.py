from django.shortcuts import render

# Create your views here.
def index(request):
    hello = "hello :)"
    lunch = '라멘'
    context = {
        'hello': hello, 
    'l': lunch}

    return render(request, 'index.html', context)
    # lunch에 해당 하는 변수를 마음대로 설정 가능하다. 
    # context를 사용하면 변수를 각각 넣을 필요 없고 index.html에서 불러오기만 하면된다.
def hello(request, name):
    apple = input( ) 
    context = {
        'name': name,

    }
    return render(request, 'hello.html', context)

def times(request, num1, num2):
    result = int(num1) + int(num2)
    context = {
        'num1':num1,
        'num2':num2,
        'result': result,
    }
    return render(request, 'times.html', context)

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
    return render(request, 'dtl.html', context)

def brithday(request):
    # 1. 오늘 날짜 가져오기
    today = datetime.now()

    # 2. month, day 가져와서 오늘 날짜와 비교하기
    result = (today.month == 12 and today.day == 15) # Vs => 6 & 8

    context = {
        'result': result
    }
    return render(request, 'brithday.html',context)