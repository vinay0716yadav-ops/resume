FROM eclipse-temurin:25-jre

# Metadata labels
LABEL maintainer="vinay0716yadav@gmail.com"
LABEL description="Spring Boot Personal Resume & Portfolio Web Application"
LABEL version="1.0.0"

# Set working directory
WORKDIR /app

# Copy application JAR packaged by Maven
COPY target/*.jar app.jar

# Expose web application port
EXPOSE 8080

# Environment variables with container-friendly JVM options
ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

# Launch Spring Boot application
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]