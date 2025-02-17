# Stage 1: Build with Maven
FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /app

# Copy source files and pom.xml
COPY pom.xml .
COPY src ./src

# Build the project (WAR file)
RUN mvn clean package -DskipTests

# Stage 2: Lightweight Image for Production
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy WAR from build stage
COPY --from=build /app/target/*.war app.war

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["sh", "-c", "java -jar -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} /app/app.war"]
