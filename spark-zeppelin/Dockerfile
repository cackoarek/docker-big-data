FROM apache/zeppelin:0.8.1

RUN wget http://ftp.man.poznan.pl/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz \
&&  tar -xzf spark-2.4.5-bin-hadoop2.7.tgz \
&&  mv spark-2.4.5-bin-hadoop2.7 /opt/spark

ENV SPARK_HOME=/opt/spark

EXPOSE 8080
