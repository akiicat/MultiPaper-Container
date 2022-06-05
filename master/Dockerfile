FROM openjdk:17-alpine

EXPOSE 25565
WORKDIR /app

ADD https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/11/downloads/MultiPaper-Master-2.8.0-all.jar /

ENTRYPOINT exec java -jar /MultiPaper-Master-2.8.0-all.jar

CMD []
