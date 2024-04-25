# Use Maven image as the base image for the build stage
FROM maven:3.8.7-eclipse-temurin-19 AS build

# Define an argument to pass the IP address during build
ARG IP

# Set the working directory inside the container
WORKDIR /backend

# Copy the project's Maven configuration file (pom.xml) into the container
COPY pom.xml .

# Copy the entire source code directory into the container
COPY src ./src

# Replace occurrences of "localhost" with the provided IP address in a specific Java configuration file
RUN sed -i "s/localhost/$IP/g" ./src/main/java/com/doko/config/WebsocketConfiguration.java

# Run Maven to clean the project and package it into a JAR, skipping tests
RUN mvn clean package -DskipTests

# Use Eclipse Temurin (formerly AdoptOpenJDK) image as the base image for the runtime stage
FROM eclipse-temurin:19

# Set the working directory inside the container
WORKDIR /backend

# Copy the compiled JAR file from the build stage into the container
COPY --from=build /backend/target/backend-0.0.1-SNAPSHOT.jar .

# Expose port 8080 to allow external access to the application
EXPOSE 8080

# Define the command to run the application when the container starts
CMD ["java", "-jar", "backend-0.0.1-SNAPSHOT.jar"]