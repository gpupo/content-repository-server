FROM tomcat:8.5

RUN apt-get update \
    && apt-get -y --no-install-recommends install vim apt-utils iputils-ping telnet libmysql-java;\
    apt-get clean  && rm -rf /var/lib/apt/lists/*;

COPY tomcat/lib/*.jar /usr/local/tomcat/lib/
COPY tomcat/conf/* /usr/local/tomcat/conf/

WORKDIR /usr/local/tomcat/webapps/
RUN rm -rf examples ROOT docs host-manager; mkdir -pv ROOT;

WORKDIR /usr/local/tomcat/webapps/ROOT/
COPY jackrabbit-webapp-2.12.9.war ./
RUN unzip -q jackrabbit-webapp-2.12.9.war; mkdir -pv WEB-INF/repository /opt/jackrabbit;\
 rm -f WEB-INF/lib/oak-upgrade* jackrabbit-webapp-2.12.9.war;
COPY web.xml WEB-INF/
COPY protectedHandlersConfig.xml WEB-INF/
COPY bootstrap.properties WEB-INF/templates/bootstrap.properties
COPY bootstrap.properties /opt/jackrabbit/bootstrap.properties
COPY repository.xml /opt/jackrabbit/repository.xml
#COPY tomcat/lib/*.jar WEB-INF/lib/
