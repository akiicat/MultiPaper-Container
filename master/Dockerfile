FROM eclipse-temurin:17.0.3_7-jre-alpine

EXPOSE 25565/tcp
WORKDIR /app
CMD []

RUN addgroup -g 1000 multipaper && \
    adduser -h /app -u 1000 -G multipaper -D multipaper
USER multipaper

ENTRYPOINT ["java", "-jar", "/MultiPaper-Master-2.8.8-all.jar"]

ADD --chown=multipaper:multipaper https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/95/downloads/MultiPaper-Master-2.8.8-all.jar /

