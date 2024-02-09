FROM maven:3.9.4-eclipse-temurin-8 AS build-deps
WORKDIR /app
COPY pom.xml .
COPY src/ /app/src/
RUN mvn package -DskipTests -B



# Utiliser une image de base avec Java et un système d'exploitation
FROM openjdk:8u151-jdk-slim-stretch
# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier JAR de l'application dans l'image Docker
COPY --from=build-deps /app/target/devopstest2-1.0-SNAPSHOT.jar /app/devopstest2.jar

# Commande pour exécuter l'application Spring Boot avec Tomcat embarqué
CMD ["java", "-jar", "devopstest2.jar"]

#