FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/MahaboobBasha0028/springpetclinic.git
FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone  /app/springproject /app
RUN mvn package
FROM tomcat:7-jre7

MAINTAINER "srinivas<hellosrinivas8@gmail.com>"

ADD tomcat-users.xml /usr/local/tomcat/conf/
#ADD petclinic.war  /usr/local/tomcat/webapps
COPY --from=build /app/target/spring-petclinic-4.2.war /usr/local/tomcat/webapps
