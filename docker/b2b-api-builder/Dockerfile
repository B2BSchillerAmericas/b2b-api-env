FROM maven:3.8.4-openjdk-11

RUN mvn -v

WORKDIR /src
COPY build.sh .
RUN chmod +x ./build.sh
ENTRYPOINT ["/bin/bash", "-c", "/src/build.sh"]
