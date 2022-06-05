FROM openjdk:17-alpine

EXPOSE 25565
WORKDIR /app

ADD https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/52/downloads/MultiPaper-Master-2.8.4-all.jar /

ENTRYPOINT exec java -jar /MultiPaper-Master-2.8.4-all.jar

CMD []
