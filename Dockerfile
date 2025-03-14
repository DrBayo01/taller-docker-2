FROM python:3.8.2

WORKDIR /app

COPY backend/djangorest_crud /app

RUN python -m venv venv

RUN /app/venv/bin/pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["/bin/sh", "-c", "/app/venv/bin/python manage.py migrate && /app/venv/bin/gunicorn --bind 0.0.0.0:8000 drfsimplecrud.wsgi:application"]
