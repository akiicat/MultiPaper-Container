FROM eclipse-temurin:17.0.3_7-jre-alpine

EXPOSE 25565/tcp
WORKDIR /app
CMD []

RUN addgroup -g 1000 multipaper && \
    adduser -h /app -u 1000 -G multipaper -D multipaper
USER multipaper

ENTRYPOINT ["java", "-jar", "/MultiPaper-Master-2.10.1-all.jar"]

ADD --chown=multipaper:multipaper https://multipaper.io/api/v2/projects/multipaper/versions/1.19/builds/16/downloads/MultiPaper-Master-2.10.1-all.jar /

