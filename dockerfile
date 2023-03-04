FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY target/suspicious-events-detector-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java", "-jar", "suspicious-events-detector-0.0.1-SNAPSHOT.jar"]
