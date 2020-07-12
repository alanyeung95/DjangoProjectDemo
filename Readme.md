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

# References:

## Docker and Django sample project

1.  https://github.com/devartis/djangodocker
2.  https://github.com/philgyford/django-docker-example
