FROM ubuntu:latest

RUN apt update -y && apt install openjdk-17-jdk -y


RUN apt install maven -y 

WORKDIR /SimpleJava

COPY ./SimpleJava ./

#RUN /bin/bash -c "cd ./SimpleJava"

RUN mvn clean package || mvn clean package


CMD ["mvn" ,"spring-boot:run"]



#CMD ["mvn" ,"spring-boot:run"]
