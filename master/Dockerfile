FROM openjdk:17-alpine

EXPOSE 25565
WORKDIR /app

ADD https://multipaper.io/api/v2/projects/multipaper/versions/1.18.1/builds/48/downloads/MultiPaper-Master-2.1.5.jar /

ENTRYPOINT exec java -jar /MultiPaper-Master-2.1.5.jar

CMD []
