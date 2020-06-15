from django.shortcuts import render, redirect
from .models import Article


# Create your views here.

def index(request):
    # Database 조회
    articles = Article.objects.all()

    context = {
        'articles' : articles,            
    }
    return render(request, 'articles/index.html', context)

def new(request): # GET + POST # GET -> render 필요
# GET 사용하면 보안에 취약, 형식들이 다 보인다. 
    if request.method == 'POST':
        title = request.POST.get('title')
        content = request.POST.get('content')

        #Data base에 저장
        # 1. Article 인스턴스 생성

        article = Article(title= title, content= content)

        # 2. 저장!
        article.save()
        return redirect('articles:detail', article.pk)

    else:
        context = {

        }
        return render(request, 'articles/new.html', context)

def create(request): # POST -> render 불필요 # 다른곳으로 돌려보내야한다.
    title = request.POST.get('title')
    content = request.POST.get('content')

    #Data base에 저장
    # 1. Article 인스턴스 생성

    article = Article(title= title, content= content)

    # 2. 저장!
    article.save()


    # context ={
    #     'title' : title,
    #     'content': content,

    # }
    return redirect('articles:detail', article.pk)
    #return render(request, 'articles/create.html', context)

def detail(request, pk):
    # Database 조회 : 단 하나의 Data
    article = Article.objects.get(pk=pk)
    
    context = {
        'article' : article,
    }
    return render(request, 'articles/detail.html', context)

def delete(request, pk): # POST 요청
    # Database 삭제 (조회 + 삭제)
    # 1. 조회
    article = Article.objects.get(pk=pk)
    
    # 2. 삭제
    article.delete()

    return redirect('articles:index')
    # POST 같은 경우 context도 안 필요하고, templates도 만들 필요가 없다.

def edit(request, pk): # GET
    # 1. 조회
    article = Article.objects.get(pk=pk)

    if request.method == 'POST':
        # 게시글 수정 수행!
        
        title = request.POST.get('title')
        content = request.POST.get('content')

        # Database 조회 + 수정
        # 1. 조회
        #article = Article.objects.get(pk=pk)
        # 2. 수정
        article.title = title
        article.content = content
        # 3. 저장
        article.save()

        return redirect('articles:detail', article.pk)

    else:
        # Database 조회 (+ 저장)
        # 1. 조회
        #article = Article.objects.get(pk=pk)

        context = {
            'article': article, 

    }
        return render(request, 'articles/edit.html', context)

def update(request, pk): #POST
    title = request.POST.get('title')
    content = request.POST.get('content')

    # Database 조회 + 수정
    # 1. 조회
    article = Article.objects.get(pk=pk)
    # 2. 수정
    article.title = title
    article.content = content
    # 3. 저장
    article.save()

    return redirect('articles:detail', article.pk)