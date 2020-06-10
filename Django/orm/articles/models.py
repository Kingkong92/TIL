from django.db import models

class Article(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f'{self.id}번 글 - {self.title}: {self.content}'

# 1. models.py 작성 및 변경(생성 및 수정)
# 2. python manage.py makemigrations 
# -> migration(설계도) 파일 생성
# 3. python manage.py migrate
# -> 실제 Database에 적용(테이블 생성)

# Django shell
# python manage.py shell

# 0. Model import
# from articles.models import Article

# 1. Create -> CREATE
# 1-1.Instance 첫번째
# article = Article()
# article.title = 'First'
# article.content = 'Wow!'
# article.save()

# 1-2. 두번째
# article = Article(title= 'Second', content='two!')
# article.save()

# 1-3. 세번째
# article = Article.objects.create(title='Third', content='three!')


# 2. Read
# 2-1. all() (-> SELECT *)
# articles = Article.objects.all()

# 2-2. filter() ( -> WHERE)
# articles = Article.objects.filter(title = 'First')

# 2-3. get() # 단수(1개) (인스턴스) 무조건 1개만 리턴 필수, Uniqe해야한다.
# article = Article.objects.get(id=1) # 검색시 base 
# article = Article.objects.get(pk=1) # id __ exact 
# 대부분 id or pk를 이용해서 get()을 사용한다. 
# article = Article.objects.get(title='First') # Error 발생
# article = Article.objects.get(pk=10) # Error
# article = Article.objects.filter(pk=10) # []


# 2-4. QuerySet (유사 리스트)
# articles = Article.objects.all()
# articles[0] # 첫번째 데이터
# articles.first() # 첫번째 데이터
# articles[-1] #마지막 데이터 
# articles.last() # 마지막 데이터
# articles[1:3] # 2번째 ~ 3번째 # 슬라이싱
# (OFFSET 1, LIMIT 2) # Database에서 이렇게 
# articles[OFFSET, OFFSET+LIMIT]

# 2-5. order_by()
# Article.objects.order_by('created_at') # 오름차순
# Article.objects.order_by('-created_at') # 내림차순

# 3. Update
# (1) 데이터 가져오기 (from)
# article = Article.objects.get(pk=1)
# (2) 인스턴스 수정 (only Python)
# article.content ="Bye-bye!"
# (3) 인스턴스 저장 (-> DB)
# article.save()

# 4. Delete
# (1) 데이터 가져오기(<- DB)
# article = Article.objects.get(pk=1)
# (2) 인스턴스 삭제 (-> DB)
# article.delete()


