FROM alpine:latest
RUN apk --no-cache add openjdk17
RUN mkdir /app
WORKDIR /app
COPY ./gradle gradle
COPY ./src src
COPY ./build.gradle build.gradle
COPY ./gradlew gradlew
COPY ./settings.gradle settings.gradle
RUN ./gradlew build
WORKDIR /app/build/libs
CMD ["java", "-jar", "periapical-service-1.0.0.jar"]