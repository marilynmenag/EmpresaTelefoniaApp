FROM maven:3.9.9-eclipse-temurin-17 AS build

WORKDIR /app
COPY . .

RUN mvn -Dmaven.test.skip=true clean package

FROM eclipse-temurin:17-jdk

WORKDIR /app
COPY --from=build /app/target/FinanzasPersonalesSpringboot-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
