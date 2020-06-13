from django.urls import path
from . import views
urlpatterns = [
    path('index/', views.index),
    path('new/', views.new), # 게시글 작성 양식
    path('create/', views.create), #게시글 생성
    path('detail/<int:pk>/', views.detail),
    path('delete/<int:pk>/', views.delete),
    path('edit/<int:pk>/', views.edit), # 게시글 수정 양식(GET)
    path('update/<int:pk>/', views.update), # 게시글 수정!(POST)

]
