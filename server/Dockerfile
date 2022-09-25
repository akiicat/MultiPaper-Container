FROM eclipse-temurin:17.0.3_7-jre-alpine

EXPOSE 25565/tcp 35353/tcp
WORKDIR /app
CMD []

RUN addgroup -g 1000 multipaper && \
    adduser -h /app -u 1000 -G multipaper -D multipaper
USER multipaper

ENTRYPOINT ["/run.sh", "/multipaper-1.19.2-34.jar"]

ADD --chown=multipaper:multipaper run.sh https://multipaper.io/api/v2/projects/multipaper/versions/1.19.2/builds/34/downloads/multipaper-1.19.2-34.jar /

