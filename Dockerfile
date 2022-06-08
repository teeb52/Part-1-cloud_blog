FROM python:3.9

WORKDIR /myproject

COPY . .

RUN pip install -r requirements.txt

RUN apt-get update \
    && apt-get install -qqy screen \
    && rm -rf /var/lib/apt/lists

CMD ["python", "app.py"]