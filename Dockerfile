FROM python:3

# Setting PYTHONUNBUFFERED=TRUE or PYTHONUNBUFFERED=1 (they are equivalent) 
# allows for log messages to be immediately dumped to the stream instead of being buffered. 
# This is useful for receiving timely log messages and avoiding situations where 
# the application crashes without emitting a relevant message due to the message being "stuck" in a buffer.
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=mysite.settings
WORKDIR /app
COPY mysite mysite
COPY manage.py /app/
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/