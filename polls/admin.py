from django.contrib import admin

from .models import Choice, Question

# we need to tell the admin that Question objects have an admin interface
admin.site.register(Choice)
admin.site.register(Question)
