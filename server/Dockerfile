FROM eclipse-temurin:17.0.3_7-jre-alpine

EXPOSE 25565/tcp 35353/tcp
WORKDIR /app
CMD []

RUN addgroup -g 1000 multipaper && \
    adduser -h /app -u 1000 -G multipaper -D multipaper
USER multipaper

ENTRYPOINT ["/run.sh", "/multipaper-1.20.1-60.jar"]

ADD --chown=multipaper:multipaper run.sh https://api.multipaper.io/v2/projects/multipaper/versions/1.20.1/builds/60/downloads/multipaper-1.20.1-60.jar /

