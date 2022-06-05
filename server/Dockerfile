FROM openjdk:17-alpine

EXPOSE 25565
WORKDIR /app

ADD https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/43/downloads/multipaper-1.18.2-43.jar /

ENTRYPOINT if [[ -n "$EULA" ]]; then \
                echo "eula=$EULA" > eula.txt; \
           fi && \
           exec java -jar /multipaper-1.18.2-43.jar

CMD ["-nogui", "--host=0.0.0.0", "--port=25565"]
