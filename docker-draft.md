Build project springboot với Maven Wrapper
./mvnw spring-boot:run
Nó sẽ tải các thư viện (dependencies), build project và chạy nó.
Hoặc có thể chạy luôn trong IDE Intelij

Cách chạy trong Docker:
- Build image với Dockerfile
    docker build --tag springboot-docker .
                        tên         link to docker file

Tạo tag mới cho image vừa tạo ở trên:
- docker tag springboot-docker:latest springboot-docIDEker:v1.1.0


Push image lên Docker Hub
docker push thatngn/springboot-docker-1:v1.1.0

Xóa image: docker rm image-id/image-name

Pull and start/run container:
docker run -dp 8085:8083 \
--name springboot-docker-container \
-v "${pwd}:/app" \
springboot-docker:v1.1.0

docker run -dp 8085:8083 \
-- name springboot-docker-container-1 \
-v "${pwd}:/app" \
thatngn/springboot-docker:v1.0.0


Test: http://localhost:8085/students/hellocontainer
hoặc trong terminal (có thể dùng postman...)
curl --request GET \
--url http://localhost:8085/students/hello \
--header 'content-type: application/json'

Update code và chạy lại:
docker restart springboot-docker-container-1 
=============
Tạo MySQL container đặt trong cùng network với springboot-docker-container:

docker run --rm -d \
-v mysql-springboot-data:/var/lib/mysql \
-v mysql-springboot-config-deamond:/etc/mysql/conf.d \
--name mysql-springboot-container \
-p 3310:3306 \
-e MYSQL_USER=thatngn -e MYSQL_PASSWORD=123456 \
-e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=123456 \
-e MYSQL_DATABASE=StudentManagement \
--network springboot-app-network \
mysql:8


docker network create springboot-app-network

[
docker run -dp 8085:8083 \
--name springboot-docker-container-1 \
-v "${pwd}:/app" \
--network springboot-app-network \
springboot-docker:v1.1.0

]


docker run -dp 8085:8083 \
--name springboot-docker-container \
-v "$(pwd):/app" \
--network springboot-app-network \
thatngn/springboot-docker:v1.0.0

docker exec -it mysql-springboot-container mysql -u root -p

curl --request POST \
--url http://localhost:8085/students/insertStudent \
--header 'content-type: application/json' \
--data '{"name":"TOTO", "birthYear":"2000"}'








 












