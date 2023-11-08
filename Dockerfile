FROM python:3.8.3-alpine 

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install gunicorn
RUN pip install -r requirements.txt
# copy project
COPY . /usr/src/app
EXPOSE 8000
RUN python manage.py migrate
CMD ["gunicorn", "-b", "0.0.0.0:8000", "bloodbankmanagement.wsgi:application"]
