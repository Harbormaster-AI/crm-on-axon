FROM eclipse-temurin:11-jre-alpine

LABEL org.opencontainers.image.vendor="Harbormaster"
LABEL org.opencontainers.image.title="crmOnAxon"
LABEL org.opencontainers.image.version="0.0.1"
LABEL com.harbormaster.blueprint="Axon4-Framework-Server"
LABEL com.harbormaster.model="CRM Industry Domain Model"
LABEL com.harbormaster.generated="2026-09-09"
#LABEL com.harbormaster.certification="79ae6b53-73ca-4ed0-8b9e-6b1cd6fe3100"

RUN addgroup -S spring && adduser -S -G spring spring
USER spring:spring

ARG JAR_FILE_RELATIVE_LOCATION=.
ARG JAR_FILE=${JAR_FILE_RELATIVE_LOCATION}/*.jar

COPY ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]