from django.contrib import admin
from .models import Article, Comment

class ArticlesAdmin(admin.ModelAdmin):
    list_display=('pk','title','created_at','updated_at')
    
class CommentAdmin(admin.ModelAdmin):
    list_display=('pk','content',)


admin.site.register(Article, ArticlesAdmin)
admin.site.register(Comment, CommentAdmin)
