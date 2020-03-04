FROM alpine/git as git
WORKDIR /repo
ADD https://api.github.com/repos/tronxi/framework-educativo-gateway/git/refs/heads/develop version.json
RUN git clone https://github.com/tronxi/framework-educativo-gateway.git
RUN cd framework-educativo-gateway && git checkout develop

FROM maven as builder
COPY --from="git" /repo/framework-educativo-gateway .
RUN mvn package spring-boot:repackage

FROM openjdk:8-alpine
ENV clave clave
ENV eureka_host http://localhost
ENV gateway-service gateway-service
ENV profile dev
COPY --from="builder" /target/framework-educativo-gateway-0.0.1-SNAPSHOT.jar .
CMD java -jar -Dspring.profiles.active=${profile} -Djasypt.encryptor.password=${clave} framework-educativo-gateway-0.0.1-SNAPSHOT.jar --eureka-host=${eureka_host} --gateway-service=${gateway-service}