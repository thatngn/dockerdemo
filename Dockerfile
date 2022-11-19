#syntax
#chỉ ra image để kế thừa
FROM openjdk:jdk
#thư mục làm việc
WORKDIR /app
#copy từ host vào container
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
#run this inside image
RUN ./mvnw dependency:go-offline
COPY src ./src
#run inside container
CMD ["./mvnw", "spring-boot:run"]