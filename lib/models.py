from __future__ import unicode_literals

from django.db import models


class Author(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200)

    def as_json(self):
        return dict(id=self.id, name=self.name)

class Book(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=150, null=False)
    description = models.TextField(default='')
    authors = models.ManyToManyField(Author)
    publication_year = models.IntegerField(default=0)
    edition = models.IntegerField(default=1)
    copies = models.IntegerField(default=0)
    cover_image = models.CharField(max_length=100, default='')