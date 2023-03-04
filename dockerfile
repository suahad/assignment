FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY target/myapp.jar .

EXPOSE 8080

CMD ["java", "-jar", "suspicious-events-detector-0.0.1-SNAPSHOT.jar"]
