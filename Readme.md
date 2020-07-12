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
```

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

## Django admin interface

1.  Provide interface to model so that we can do CRUD to the data, in this project it is `Question` model

# References:

## Docker and Django sample project

1.  https://github.com/devartis/djangodocker
2.  https://github.com/philgyford/django-docker-example
