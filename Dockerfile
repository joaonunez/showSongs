# Etapa 1: Construcción
FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /app

# Copiar archivos del proyecto
COPY pom.xml .
COPY src ./src

# Construir la aplicación
RUN mvn clean package -DskipTests

# Etapa 2: Imagen ligera para producción
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copiar el JAR generado desde la etapa anterior
COPY --from=build /app/target/songs-0.0.1-SNAPSHOT.jar app.jar

# Exponer el puerto fijo
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["sh", "-c", "java -jar -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} /app/app.jar"]
