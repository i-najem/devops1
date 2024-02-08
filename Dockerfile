# Utiliser une image de base avec Java et un système d'exploitation
FROM openjdk:8u151-jdk-slim-stretch

# Copier le fichier JAR de l'application dans l'image Docker
COPY target/devopstest2-1.0-SNAPSHOT.jar /app/devopstest2.jar

# Définir le répertoire de travail
WORKDIR /app

# Commande pour exécuter l'application Spring Boot avec Tomcat embarqué
CMD ["java", "-jar", "devopstest2.jar"]

#