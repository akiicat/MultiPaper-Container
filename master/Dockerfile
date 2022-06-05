FROM openjdk:17-alpine

EXPOSE 25565
WORKDIR /app

ADD https://multipaper.io/api/v2/projects/multipaper/versions/1.18.1/builds/66/downloads/MultiPaper-Master-2.5.1.jar /

ENTRYPOINT exec java -jar /MultiPaper-Master-2.5.1.jar

CMD []
