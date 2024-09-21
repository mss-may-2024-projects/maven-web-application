FROM tomcat:9.0-alpine
LABEL maintainer="Asim Momin"
COPY target/maven-web-application.war $CATALINA_HOME/webapps/maven-web-application.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
