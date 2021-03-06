FROM docker.elastic.co/beats/filebeat:7.5.0

USER root

RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar
# Prepare environment
ENV JAVA_HOME /opt/java
ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# Install Oracle Java8
ENV JAVA_VERSION 8u162
ENV JAVA_BUILD 8u162-b12
ENV JAVA_DL_HASH 0da788060d494f5095bf8624735fa2f1

RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
 http://download.oracle.com/otn-pub/java/jdk/${JAVA_BUILD}/${JAVA_DL_HASH}/jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
 tar -xvf jdk-${JAVA_VERSION}-linux-x64.tar.gz && \
 rm jdk*.tar.gz && \
 mv jdk* ${JAVA_HOME}


RUN mkdir /usr/log-generator
RUN mkdir /usr/log-generator/logs
WORKDIR /usr/log-generator

COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown root:root /usr/share/filebeat/filebeat.yml
RUN chmod go-w /usr/share/filebeat/filebeat.yml

COPY filebeats-entrypoint.sh /
RUN chown root:root /filebeats-entrypoint.sh
ENTRYPOINT ["/filebeats-entrypoint.sh"]