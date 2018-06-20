# https://github.com/sequenceiq/hadoop-docker
FROM sequenceiq/hadoop-docker:2.7.1

RUN (yum -y install java-1.8.0-openjdk-devel || yum -y install java-1.8.0-openjdk-devel)
RUN yum -y install wget

#RUN $HADOOP_PREFIX/bin/mapred historyserver start &
#RUN service sshd start && $HADOOP_PREFIX/bin/mapred historyserver start &

#RUN $HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh --config $HADOOP_PREFIX/etc/hadoop start historyserver

WORKDIR /usr/local
RUN wget http://ftp.man.poznan.pl/apache/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz
RUN tar -xvzf spark-2.3.0-bin-hadoop2.7.tgz
RUN mv spark-2.3.0-bin-hadoop2.7 spark
ENV SPARK_HOME=/usr/local/spark
ENV LD_LIBRARY_PATH=/usr/local/hadoop/lib/native
RUN mv $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf
RUN unlink /usr/java/default
RUN ln -s /usr/lib/jvm/jre-1.8.0-openjdk.x86_64 /usr/java/default

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh", "-d"]

WORKDIR /usr/local/hadoop/
