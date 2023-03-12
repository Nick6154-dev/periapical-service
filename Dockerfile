FROM eclipse-temurin:17.0.5_8-jre-alpine
RUN mkdir /app
WORKDIR /app
COPY ./gradle gradle
COPY ./src src
COPY ./build.gradle build.gradle
COPY ./gradlew.bat gradlew.bat
COPY ./settings.gradle settings.gradle
RUN ./gradlew dependencies
RUN ./gradlew build
COPY ./build/libs/periodontal-service-1.0.0.jar app.jar
CMD ["java", "-jar", "app.jar"]