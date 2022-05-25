FROM openjdk:17-alpine

EXPOSE 25565
WORKDIR /app
# RUN echo "eula=true" > eula.txt
# COPY server.properties server.properties

# CMD java -Xmx1G -DmultipaperMasterAddress=${MASTER_IP}:${MASTER_PORT} -jar multipaper.jar --host=0.0.0.0 --port=25565 -nogui

RUN wget -O /multipaper.jar  https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/44/downloads/multipaper-1.18.2-44.jar

# ENTRYPOINT ["java", "-jar", "/jar/multipaper.jar"]
# ENTRYPOINT java -jar multipaper.jar --host=0.0.0.0 --port=25565 -nogui
ENTRYPOINT if [[ -n "$EULA" ]]; then \
                echo "eula=$EULA" > eula.txt; \
           fi && \
           exec java -jar /multipaper.jar

CMD ["-nogui", "--host=0.0.0.0", "--port=25565"]
