FROM python:2.7-alpine

RUN apk add --update alpine-sdk gcc libffi-dev openssl-dev

WORKDIR /home

ADD install-package ./
RUN tar -xzf elastalert.tar.gz
RUN rm elastalert.tar.gz

WORKDIR /home/elastalert

RUN pip install "setuptools>=11.3"
RUN pip install "elasticsearch>=5.0.0"
RUN pip install jira==1.0.14
RUN python setup.py install

ADD config/config.yaml ./
ADD config/runAll.sh ./
RUN chmod +x runAll.sh
RUN mkdir rules_folder

ENTRYPOINT ["/home/elastalert/runAll.sh"]


