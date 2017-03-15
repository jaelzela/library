# -*- coding: utf-8 -*-
__author__ = "Jael Zela"

from django.conf import settings
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.files.storage import FileSystemStorage
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.db import IntegrityError
from django.db.models import Q
from django.http import HttpResponseRedirect, JsonResponse, Http404
from django.shortcuts import render
from django.utils import timezone
from django.views.decorators.csrf import csrf_protect

from lib.models import *
import operator
import os


@login_required(login_url='/lib/login')
def index(request):
    books = Book.objects.all()

    authors = []
    years = []
    for b in books:
        authors += [a.name for a in b.authors.all()]
        years.append(b.publication_year)
    authors = list(set(authors))
    authors.sort()
    years = list(set(years))
    years.sort()

    paginator = Paginator(books, 10)

    try:
        page_number = int(request.GET.get('page', '1'))
    except ValueError:
        page_number = 1

    try:
        books = paginator.page(page_number)
    except (InvalidPage, EmptyPage):
        books = paginator.page(paginator.num_pages)

    return render(request, 'lib/index.html', dict(books=books, authors=authors, years=years))


@csrf_protect
def login_user(request):
    if request.method == 'GET':
        return render(request, 'lib/login.html', dict())

    elif request.method == 'POST':
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

    else:
        raise Http404


def logout_user(request):
    logout(request)
    return HttpResponseRedirect('/')


def signup_user(request):
    if request.method == 'GET':
        return render(request, "lib/signup.html", dict())
    elif request.method == 'POST':
        first_name = request.POST.get('first_name', '')
        email = request.POST.get('email', '').lower()
        password = request.POST.get('password', '')

        try:
            user = User.objects.create_user(username=email, email=email, password=password, first_name=first_name, last_login=timezone.now())
            user.is_active = True
            user.save()
        except IntegrityError:
            error = "Email address already registered."
            return render(request, "lib/signup.html", dict(signup_error=error))

        return render(request, "lib/confirmation.html", dict())
    else:
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


@login_required(login_url='/lib/login')
def book_delete(request, book_id):
    if request.method == 'GET':
        try:
            book = Book.objects.get(id=int(book_id))
            url_image = book.cover_image
            book.delete()

            os.remove(os.path.join(settings.LIB_MEDIA_DIR, url_image.split('/')[-1]))

            return HttpResponseRedirect('/lib')
        except ValueError:
            raise Http404
    else:
        raise Http404


@csrf_protect
def authors(request):
    authors = [a.as_json() for a in Author.objects.all()]
    return JsonResponse({'authors': authors})


@login_required(login_url='/lib/login')
def search(request):
    if request.method == 'GET':
        query = request.GET.get('q', '')
        f_author = request.GET.get('f_author', '')
        f_year = request.GET.get('f_year', '')

        filters = []
        filter_labels = []
        if f_year:
            filters.append(Q(publication_year=f_year))
            filter_labels.append("Publication Year: "+f_year)
        if f_author:
            filters.append(Q(authors__name=f_author))
            filter_labels.append('Author: "'+f_author+'"')

        if len(filters) > 0:
            books = Book.objects.filter(Q(title__icontains=query) | Q(authors__name__icontains=query), reduce(operator.and_, filters))
        else:
            books = Book.objects.filter(Q(title__icontains=query) | Q(authors__name__icontains=query))

        authors = []
        years = []
        for b in books:
            authors += [a.name for a in b.authors.all()]
            years.append(b.publication_year)
        authors = list(set(authors))
        authors.sort()
        years = list(set(years))
        years.sort()

        paginator = Paginator(books, 10)

        try:
            page_number = int(request.GET.get('page', '1'))
        except ValueError:
            page_number = 1

        try:
            books = paginator.page(page_number)
        except (InvalidPage, EmptyPage):
            books = paginator.page(paginator.num_pages)

        q_label = 'title: "'+query+'" OR author: "'+query+'"' if query else ''
        f_label = ' AND '.join(filter_labels)
        print q_label, f_label
        return render(request, 'lib/index.html', dict(books=books, authors=authors, years=years, q_label=q_label, f_label=f_label))
    else:
        raise Http404