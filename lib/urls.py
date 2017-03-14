from django.conf.urls import url

from lib import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'login', views.login_user, name='login'),
    url(r'logout', views.logout_user, name='logout'),
    url(r'book/([a-z0-9]+)/$', views.book, name='book'),
    url(r'book/([a-z0-9]+)/edit$', views.book_edit, name='book_edit'),
    url(r'authors', views.authors, name='authors'),
]