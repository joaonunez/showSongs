# Etapa 1: Construcción con Maven
FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /app

# Copiar archivos para el build
COPY pom.xml .
COPY src ./src

# Construir el proyecto y crear el JAR
RUN mvn clean package -DskipTests

# Etapa 2: Imagen ligera para producción
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copiar el JAR desde la etapa de construcción
COPY --from=build /app/target/*.jar app.jar

# Exponer puerto fijo 8082
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["sh", "-c", "java -jar -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} /app/app.jar"]
