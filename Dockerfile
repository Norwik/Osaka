FROM gradle:8.10-jdk22 as builder

COPY --chown=gradle:gradle . /home/gradle/src

WORKDIR /home/gradle/src

RUN ./gradlew build --info

FROM openjdk:22-jdk-slim

RUN mkdir -p /app/releases
RUN mkdir -p /app/configs
RUN mkdir -p /app/storage

VOLUME /app/storage

COPY --from=builder /home/gradle/src/build/libs/osaka-0.0.1.jar /app/releases/osaka-0.0.1.jar
COPY --from=builder /home/gradle/src/main/resources/application.properties /app/configs/application.properties

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/releases/osaka-0.0.1.jar", "--spring.config.name=application"]
