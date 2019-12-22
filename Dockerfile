FROM alpine/git as git
ARG token
WORKDIR /repo
ADD https://${token}:x-oauth-basic@api.github.com/repos/tronxi/framework-educativo-gateway/git/refs/heads/develop version.json
RUN git clone https://${token}:x-oauth-basic@github.com/tronxi/framework-educativo-gateway.git
RUN cd framework-educativo-gateway && git checkout develop

FROM maven as builder
ARG clave
ENV clave_env ${clave}
COPY --from="git" /repo/framework-educativo-gateway .
RUN mvn package spring-boot:repackage -Dspring.profiles.active=dev -Djasypt.encryptor.password=${clave_env}

FROM openjdk:8-alpine
ARG clave
ENV clave_env ${clave}
ENV eureka_host http://localhost
ENV host_env defaultHost
COPY --from="builder" /target/framework-educativo-gateway-0.0.1-SNAPSHOT.jar .
CMD java -jar -Dspring.profiles.active=dev -Djasypt.encryptor.password=${clave_env} framework-educativo-gateway-0.0.1-SNAPSHOT.jar --spring.cloud.client.hostname=${host_env} --eureka-host=${eureka_host}