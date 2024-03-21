FROM python:3.11-alpine

WORKDIR /app

RUN apk update && \
    apk add --virtual build-deps gcc musl-dev && \
    apk add libpq-dev

COPY ./requirements.txt /app/requirements.txt

RUN pip3 install --no-cache-dir --upgrade -r /app/requirements.txt

COPY app.py /app

CMD ["flask", "run"]

EXPOSE 5000