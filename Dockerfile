FROM ubuntu:latest
LABEL authors="yash"
VOLUME /tmp
RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-jdk-slim
EXPOSE 8080
COPY target/*.jar app.jar


ENTRYPOINT ["java", "-jar","app.jar"]