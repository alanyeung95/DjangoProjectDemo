FROM python:3

# Setting PYTHONUNBUFFERED=TRUE or PYTHONUNBUFFERED=1 (they are equivalent) 
# allows for log messages to be immediately dumped to the stream instead of being buffered. 
# This is useful for receiving timely log messages and avoiding situations where 
# the application crashes without emitting a relevant message due to the message being "stuck" in a buffer.
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/