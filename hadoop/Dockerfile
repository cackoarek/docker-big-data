# https://github.com/sequenceiq/hadoop-docker
FROM sequenceiq/hadoop-docker:2.7.1

RUN (yum -y install java-1.8.0-openjdk-devel || yum -y install java-1.8.0-openjdk-devel)

#RUN $HADOOP_PREFIX/bin/mapred historyserver start &
#RUN service sshd start && $HADOOP_PREFIX/bin/mapred historyserver start &

#RUN $HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh --config $HADOOP_PREFIX/etc/hadoop start historyserver

ADD bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh", "-d"]

WORKDIR /usr/local/hadoop/
