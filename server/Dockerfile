FROM openjdk:17-alpine

EXPOSE 35353/tcp
EXPOSE 25565/tcp
WORKDIR /app

ADD https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/69/downloads/multipaper-1.18.2-69.jar /

ENTRYPOINT if [[ -n "$EULA" ]]; then \
                echo "eula=$EULA" > eula.txt; \
           fi && \
           exec java -jar /multipaper-1.18.2-69.jar

CMD ["-nogui", "--host=0.0.0.0"]

