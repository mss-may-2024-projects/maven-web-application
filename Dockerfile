#!/bin/bash/
FROM amazoncorretto:8-alpine-jdk
ENV CATALINA_HOME /usr/local/tomcat
RUN mkdir -p $CATALINA_HOME \
    && adduser tomcat9 -D -h $CATALINA_HOME -s /bin/sh \
    && apk add --no-cache curl wget
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz /tmp/tomcat.tar.gz
RUN cd /tmp \
    && tar xvfz /tmp/tomcat.tar.gz \
    && mv /tmp/apache-tomcat-9.0.95/* $CATALINA_HOME \
    && rm -rf /tmp/apache-tomcat-9.0.95 /tmp/tomcat.tar.gz \
    && chown -R tomcat9:tomcat9 $CATALINA_HOME  
EXPOSE 8080
USER tomcat9
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
