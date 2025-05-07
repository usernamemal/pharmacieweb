# frontend/Dockerfile
FROM tomcat:9.0-jdk11
COPY target/your-frontend.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
