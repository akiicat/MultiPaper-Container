FROM eclipse-temurin:17.0.3_7-jre-alpine

EXPOSE 35353/tcp
EXPOSE 25565/tcp
WORKDIR /app

ENTRYPOINT ["/run.sh", "/multipaper-1.18.2-72.jar"]
CMD []

ADD run.sh https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/72/downloads/multipaper-1.18.2-72.jar /

