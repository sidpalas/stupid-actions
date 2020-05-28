FROM python:3.8.3-alpine

COPY . /

RUN pip install -r requirements.txt

ENTRYPOINT [ "python" ]

CMD [ "/main.py" ]