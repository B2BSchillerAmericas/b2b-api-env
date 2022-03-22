#/bin/bash

USERNAME=$GIT_USERNAME
PASSWORD=$GIT_PASSWORD

SOURCE_DIR='/src'
OUTPUT_DIR='/output'

mkdir $SOURCE_DIR
rm -f -r $OUTPUT_DIR
mkdir $OUTPUT_DIR

cd $SOURCE_DIR
rm -f -r b2b-common-java
git clone https://$USERNAME:$PASSWORD@gitea.corp.fc-rd.com/futurecare/b2b-common-java.git \
    && cd b2b-common-java \
    && mvn clean compile package install

cd $SOURCE_DIR
rm -f -r b2b-api-server
git clone https://$USERNAME:$PASSWORD@gitea.corp.fc-rd.com/futurecare/b2b-api-server.git \
    && cd b2b-api-server \
    && mvn clean compile package

cp -r target/b2b-api-server-0.1.0-SNAPSHOT.jar $OUTPUT_DIR/b2b-api-server.jar
cp -r src/main/resources/db $OUTPUT_DIR/db
