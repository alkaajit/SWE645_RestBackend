#using tomcat latest
FROM tomcat
COPY target/SWE645_RestBackend-*.war /usr/local/tomcat/webapps/SWE645_RestBackend.war