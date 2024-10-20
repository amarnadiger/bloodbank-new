FROM python:3.9-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN python -m venv venv
RUN /bin/ash -c "source venv/bin/activate"
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt
# copy project
COPY . /usr/src/app
RUN python manage.py collectstatic --noinput 
RUN python manage.py migrate
CMD ["gunicorn", "-b", "0.0.0.0:8003", "bloodbankmanagement.wsgi:application"]
