# Use OpenJDK base image
FROM: openjdk:8-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the built jar file
COPY target/cicd-java-sample-1.0-SNAPSHOT.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app-jar"]
