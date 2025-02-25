FROM eclipse-temurin:17.0.3_7-jre-alpine

EXPOSE 25565/tcp
WORKDIR /app
CMD []

RUN addgroup -g 1000 multipaper && \
    adduser -h /app -u 1000 -G multipaper -D multipaper
USER multipaper

ENTRYPOINT ["java", "-jar", "/multipaper-master-2.11.1-all.jar"]

ADD --chown=multipaper:multipaper https://api.multipaper.io/v2/projects/multipaper/versions/1.20.1/builds/31/downloads/multipaper-master-2.11.1-all.jar /

