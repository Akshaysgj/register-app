#FROM tomcat:latest
#RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
#COPY /webapp/target/*.war /usr/local/tomcat/webapps


FROM tomcat:10-jdk21

# Patch OS CVEs (covers CVE-2026-45447 HIGH + dozens of MEDIUMs)
RUN apt-get update && \
    apt-get install -y --only-upgrade \
        openssl libssl3t64 \
        libgnutls30t64 \
        libsystemd0 libudev1 \
        libgcrypt20 \
        liblzma5 \
    && apt-get upgrade -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY /webapp/target/*.war /usr/local/tomcat/webapps
#COPY target/*.war /usr/local/tomcat/webapps/
