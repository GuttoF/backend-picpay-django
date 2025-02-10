FROM python:3.12.8-alpine3.21

EXPOSE 8080

WORKDIR /app

COPY pyproject.toml .
COPY users/ ./users/
COPY core/ ./core/
COPY manage.py .

RUN pip install uv && uv sync

CMD [ "uv", "run", "manage.py", "runserver" ]