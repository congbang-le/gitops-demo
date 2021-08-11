FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8-alpine3.10 as base

RUN pip install pytest requests
COPY ./app /app

FROM base as test 
RUN ["pytest"]

FROM base as prod
CMD ["uvicorn", "main:app", "--reload"]
