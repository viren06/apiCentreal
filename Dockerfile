FROM ubuntu:latest
LABEL authors="yash"
RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-jdk-slim
EXPOSE 8080
COPY --from-build /build/libs/apiCentreal-0.0.1-SNAPSHOT.jar app.jar


ENTRYPOINT ["java", "-jar",""]