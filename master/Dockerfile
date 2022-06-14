FROM openjdk:17-alpine

EXPOSE 25565/tcp
WORKDIR /app

ADD https://multipaper.io/api/v2/projects/multipaper/versions/1.18.2/builds/72/downloads/MultiPaper-Master-2.8.4-all.jar /

ENTRYPOINT exec java -jar /MultiPaper-Master-2.8.4-all.jar

CMD []
