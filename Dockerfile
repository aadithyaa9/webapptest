# Use a lightweight Java 17 runtime
FROM eclipse-temurin:17-jre-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file built by Maven from the target folder into the container
COPY target/*.jar app.jar

# Expose port 8080 so the host can access it
EXPOSE 8080

# Command to execute the Java application
ENTRYPOINT ["java", "-jar", "app.jar"]