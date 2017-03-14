from django.core.files.storage import FileSystemStorage
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, JsonResponse, Http404
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import render
from django.conf import settings

from lib.models import *


@login_required(login_url='/lib/login')
def index(request):
    books = Book.objects.all()
    paginator = Paginator(books, 10)

    try:
        page_number = int(request.GET.get('page', '1'))
    except ValueError:
        page_number = 1

    try:
        books = paginator.page(page_number)
    except (InvalidPage, EmptyPage):
        books = paginator.page(paginator.num_pages)

    return render(request, 'lib/index.html', dict(books=books))


@csrf_protect
def login_user(request):
    if request.method == 'GET':
        return render(request, 'lib/login.html', dict())

    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = authenticate(username=email, password=password)

        if user is not None:
            if user.is_active:
                login(request, user)
                #request.session.set_expiry(30)
                return HttpResponseRedirect('/')
            else:
                login_error = "Account is not active!"
        else:
            login_error = "Incorrect email or password!"

        return render(request, 'lib/login.html', dict(error=login_error))


def logout_user(request):
    if request.method == 'GET':
        next = request.GET.get('next', '')
    logout(request)
    if next:
        return HttpResponseRedirect(next)
    return HttpResponseRedirect('/')


@login_required(login_url='/lib/login')
def book(request, book_id):
    if request.method == 'GET':
        try:
            book = Book.objects.get(id=int(book_id))
            authors = [int(a.id) for a in book.authors.all()]
            return render(request, 'lib/book.html', dict(book=book, authors=authors))
        except ValueError:
            raise Http404
    else:
        raise Http404


@login_required(login_url='/lib/login')
def book_edit(request, book_id):
    if request.method == 'GET':
        if book_id == 'new':
            return render(request, 'lib/book_form.html', dict(book=Book(), authors=[]))
        else:
            try:
                book = Book.objects.get(id=int(book_id))
                authors = [int(a.id) for a in book.authors.all()]
                return render(request, 'lib/book_form.html', dict(book=book, authors=authors))
            except ValueError:
                raise Http404
    elif request.method == 'POST':
        title = request.POST.get('title', '')
        description = request.POST.get('description', '')
        pubyear = request.POST.get('pubyear', '')
        edition = request.POST.get('edition', '')
        copies = request.POST.get('copies', '')

        if book_id == 'new':
            book = Book()
        else:
            try:
                book = Book.objects.get(id=int(book_id))
            except (ValueError, Book.DoesNotExist):
                raise Http404

        book.title = title
        book.description = description
        book.publication_year =pubyear
        book.edition = edition
        book.copies = copies
        book.save()

        if request.FILES and request.FILES['img_cover']:
            cover_file = request.FILES['img_cover']
            fs = FileSystemStorage(location=settings.LIB_MEDIA_DIR)
            filename = fs.save(cover_file.name, cover_file)
            uploaded_file_url = fs.url(filename)
            book.cover_image = '/static/lib/img/'+uploaded_file_url
            book.save()

        book.authors.clear()
        authors = request.POST.getlist('authors[]', '')
        for a in authors:
            try:
                author = Author.objects.get(id=int(a))
                book.authors.add(author)
            except ValueError:
                author = Author.objects.create(name=a)
                book.authors.add(author)

        return HttpResponseRedirect('/lib/book/'+str(book.id))
    else:
        raise Http404


@csrf_protect
def authors(request):
    authors = [a.as_json() for a in Author.objects.all()]
    return JsonResponse({'authors': authors})

#INSERT INTO `auth_user` VALUES
#(1,'pbkdf2_sha256$24000$EYtAEeWO79qO$sEAFlWwFaZgxxkjNHZxhB8BwKHGZx22xySbWUxWvQRk=','2017-02-27 02:27:43',0,'jzelar@gmail.com','Jael','','jzelar@gmail.com',0,1,'2017-01-28 23:45:19');