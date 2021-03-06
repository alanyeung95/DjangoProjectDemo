# Introduction

This project is following the official django with a demo project, and I am trying to dockerize it.
The purpose is just for learn. You can see the tutorial link here:

https://docs.djangoproject.com/en/2.2/intro/tutorial01/

# Set up & running

Run the project

```
docker-compose up
```

After initial the project

```
docker exec -it container_id python /app/manage.py migrate
docker exec -it container_id python /app/manage.py createsuperuser

# Use shell to test the project or access to the model
# ref: https://docs.djangoproject.com/en/2.2/intro/tutorial02/
docker exec -it container_id  python /app/manage.py shell
```

Run test

```
docker exec -it container_id  python /app/manage.py   test polls
```

# Aritecture

## Apps (polls)

The following folder is created by the command

```
python manage.py startapp polls
```

```
polls/
__init__.py
admin.py
apps.py
    migrations/
    __init__.py
models.py
tests.py
views.py
```

## Migrations

The command `python manage.py makemigrations polls` will generate `0001_initial.py` and the following output

```
Migrations for 'polls':
  polls/migrations/0001_initial.py:
    - Create model Choice
    - Create model Question
    - Add field question to choice
```

And the `python manage.py migrate` command synchronizing the changes you made to your models with the schema in the database.

```
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, polls, sessions
Running migrations:
  Rendering model states... DONE
  Applying polls.0001_initial... OK
```

Migrations are very powerful and let you change your models over time, as you develop your project, without the need to delete your database or tables and make new ones - it specializes in upgrading your database live, without losing data. We’ll cover them in more depth in a later part of the tutorial, but for now, remember the three-step guide to making model changes:

    Change your models (in models.py).
    Run python manage.py makemigrations to create migrations for those changes
    Run python manage.py migrate to apply those changes to the database.

## Templates

1. Storing page’s design view
2. Django will look for templates in there.
3. get data (context) from views.py

# Concepts

Some concepts or terms that I learned from this project and I think any python developer should learn it.

## WSGI

Intro:

1.  WSGI Servers: A Web Server Gateway Interface (WSGI) server implements the web server side of the WSGI interface for running Python web applications.
2.  A traditional web server does not understand or have any way to run Python applications
3.  mod_python was a solution but not prefect
4.  Therefore the Python community came up with WSGI as a standard interface that modules and containers could implement.

Pros:

1. Flexibility.For example, a developer can switch from Green Unicorn to uWSGI without modifying the application or framework that implements WSGI.

Production setting reference:
https://stackoverflow.com/questions/10664244/django-how-to-manage-development-and-production-settings/54292952#54292952

## \_\_init\_\_.py:

An empty file that tells Python that this directory should be considered a Python package. If you’re a Python beginner, read more about packages in the official Python docs.

## Django admin interface

1.  Provide interface to model so that we can do CRUD to the data, in this project it is `Question` model

## Generic View

1.  The DetailView generic view expects the primary key value captured from the URL to be called "pk", so we’ve changed question_id to pk for the generic views.

2.  By default, the DetailView generic view uses a template called `<app name>/<model name>_detail.html`. In our case, it would use the template "polls/question_detail.html". The template_name attribute is used to tell Django to use a specific template name instead of the autogenerated default template name.

# References:

## Docker and Django sample project

1.  https://github.com/devartis/djangodocker
2.  https://github.com/philgyford/django-docker-example

# TODO:

[ ] makefile with `make test`
