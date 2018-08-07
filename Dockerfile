FROM       apache/nifi:1.7.1
MAINTAINER Tyler Gregory <tdgregory@protonmail.com>

USER       root

ENV        BANNER_TEXT="" \
           S2S_PORT=""

RUN        mkdir -p ${NIFI_HOME}/ca_trust_anchors 

COPY       start_nifi.sh ${NIFI_HOME}/ 
COPY       nars/* ${NIFI_HOME}/lib/ 
COPY       ca_trust_anchors/* ${NIFI_HOME}/ca_trust_anchors/ 

RUN        cd /docker-java-home/jre/lib/security
RUN        /bin/bash -c "keytool -import -trustcacerts -keystore cacerts -storepass changeit -noprompt -alias devoncert -file ${NIFI_HOME}/ca_trust_anchors/*"

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

ENTRYPOINT ["./start_nifi.sh"]
