FROM python:3.10.15-slim-bullseye

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install gunicorn pymysql cryptography

COPY app app
COPY migrations migrations
COPY microblog.py config.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP=microblog.py

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]