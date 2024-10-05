# Stage 1: Build the application with Maven
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app

# Copy the pom.xml to the container
COPY pom.xml .

# Download dependencies (caching step)
RUN mvn dependency:go-offline -B

# Copy the entire project source
COPY src /app/src

# Build the application, skipping tests for faster builds
RUN mvn clean package -DskipTests

# Stage 2: Use a smaller base image to run the application
FROM openjdk:17-jdk-alpine
WORKDIR /app

# Copy the built JAR from the build stage to this runtime stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar ./demo-aws.jar

# Expose the port that the application runs on
EXPOSE 8081

# Run the Spring Boot application
CMD ["java", "-jar", "demo-aws.jar"]
