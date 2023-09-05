FROM python:latest

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=shops.settings

RUN mkdir -p /home/app
RUN cd /home/app
WORKDIR /home/app

COPY . /home/app

RUN pip install -r requirements.txt

EXPOSE 8000

CMD [ "python3", "-m", "django", "runserver", "0.0.0.0:8000" ]
