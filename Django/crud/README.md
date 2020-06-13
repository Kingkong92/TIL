# CRUD

1. Python 가상 환경
``` 
python -m venv venv

```

2. Python 가상 환경 활성화(VS Code 기능)
    - Ctrl + Shift + P
    - 'Python: Select Interpreter'
    - 가상 환경 'venv' 선택
    - Terminal 삭제했다가 다시 켜야한다.(휴지통 버튼)
    - 확인 방법은 왼쪽 하단 나타남: Python 3.7.4 64-bit('venv':venv)
    
3. Django 설치
``` 
pip install django==2.2.13
```

4. Django Project 생성
```
django-admin startproject crud . (fold name)
```

5. Django App 생성
```
python manage.py startapp articles 
```

6. Django App 등록
    - settings.py > INSTALLED_APPS 추가 

7. 언어 및 시간 설정
    - settings.py > LANGUAGE_CODE - 'Ko-kr'
    - settings.py > TIME-ZONE - 'Asia/Seoul'

8. base.html 설정
    - settings.py
    - TEMPLATES - DIRS
    - 'os.path.join(BASE_DIR, 'templates')' 추가; html 파일 추가로 지정한 경로에도 사용할 수 있다. 
    - 최상위 폴도에서 templates 폴더 생성
    - templates > base.html 생성

9. urls.py 분리
    - articles > urls.py 생성
    - crud > urls.py에서 include로 path 추가

10. Data Base 생성
    - models.py
    class Articles(models.Model):
    title = models.CharField(max_length=10)
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add = True)
    updated_at = models.DateTimeField(auto_now=True)

11. Data Base 설계도 / 적용
    - 서버 종료 Ctrl + C 이후  python manage.py makemigrations 
    - python manage.py migrate
