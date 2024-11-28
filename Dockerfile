FROM python:3.12-slim-bullseye

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir poetry

COPY pyproject.toml poetry.lock* /app/

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-dev


WORKDIR /app

COPY . /app


EXPOSE 8000

HEALTHCHECK --interval=60s --timeout=5s --retries=3 --start-period=30s CMD curl --fail http://localhost:8000/health || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port" , "8000"]

LABEL version="0.1.0"
LABEL description="FastAPI application for Agent"

