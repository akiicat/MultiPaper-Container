FROM openjdk:17-alpine

EXPOSE 25565
WORKDIR /app

ADD https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/31/downloads/MultiPaper-Master-2.8.1-all.jar /

ENTRYPOINT exec java -jar /MultiPaper-Master-2.8.1-all.jar

CMD []
