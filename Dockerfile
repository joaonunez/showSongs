# Dockerfile
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR al contenedor
COPY target/songs-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto definido en la variable de entorno
EXPOSE ${SERVER_PORT}

# Ejecuta la aplicación
ENTRYPOINT ["sh", "-c", "java -jar -Dspring.profiles.active=${SPRING_PROFILES_ACTIVE} /app/app.jar"]
