FROM       apache/nifi:1.4.0
MAINTAINER Tyler Gregory <tdgregory@protonmail.com>

ENV        BANNER_TEXT="" \
           S2S_PORT=""

RUN        mkdir ${NIFI_HOME}/ca_trust_anchors

COPY       start_nifi.sh ${NIFI_HOME}/ \
           nars/* ${NIFI_HOME}/lib/ \
           ca_trust_anchors/* ${NIFI_HOME}/ca_trust_anchors

RUN        bash -c '/docker-java-home/jre/lib/security/keytool -import -trustcacerts -keystore cacerts -storepass changeit -noprompt -alias devoncert -file ${NIFI_HOME}/ca_trust_anchors/*'

VOLUME     /opt/datafiles \
           /opt/scriptfiles \
           /opt/certfiles \
           ${NIFI_HOME}/logs \
           ${NIFI_HOME}/flowfile_repository \
           ${NIFI_HOME}/database_repository \
           ${NIFI_HOME}/content_repository \
           ${NIFI_HOME}/provenance_repository

WORKDIR    ${NIFI_HOME}

expose     8080 8443 8081

RUN        chmod +x ./start_nifi.sh
CMD        ./start_nifi.sh
