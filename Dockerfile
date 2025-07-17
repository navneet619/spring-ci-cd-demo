# Use a base image with Java 17
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file into the container
# Ensure 'target/*.jar' matches the actual name of your JAR file
# (e.g., spring-ci-cd-demo-0.0.1-SNAPSHOT.jar)
COPY target/*.jar app.jar

# Expose the port your Spring Boot application runs on (default is 8080)
EXPOSE 8080

# Command to run the Spring Boot application
ENTRYPOINT ["java","-jar","/app/app.jar"]