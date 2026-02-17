FROM alpine:3.22.2

# Basic ENVs :
ENV LC_ALL="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"
ENV TZ="America/Chicago"

# Build args (for config.dct) :
ARG PRIMARY_SERVER
ARG DUAL_STACK_SERVER
ARG IP_ADDRESS
ARG BIND_IP
ARG TCP_UDP_PORT
ARG HTTP_PORT
ARG LOG_ACCESS
ARG LOG_ROTATION_FREQUENCY_SHORT
ARG SITE_VERSION_SERIAL_NUMBER
ARG SERVER_DESCRIPTION
ARG ORG_NAME
ARG ORG_CONTACT_PERSON
ARG ORG_CONTACT_PHONE
ARG ORG_CONTACT_EMAIL
ARG DISABLE_UDP
ARG ENCRYPT_SERVER_KEY
ARG ENCRYPT_ADMIN_KEY

ARG PREFIXES_ADMINS
ARG HANDLE_PREFIXES
ARG LOG_ROTATION_FREQUENCY_LONG
ARG DSPACE_SERVER_URLS
ARG JAVA_OPTS

# Configurable settings in config.dct :
ENV BIND_IP=${BIND_IP}
ENV HTTP_PORT=${HTTP_PORT}
ENV LOG_ACCESS=${LOG_ACCESS}
ENV TCP_UDP_PORT=${TCP_UDP_PORT}
ENV PREFIXES_ADMINS=${PREFIXES_ADMINS}
ENV HANDLE_PREFIXES=${HANDLE_PREFIXES}
ENV LOG_ROTATION_FREQUENCY_LONG=${LOG_ROTATION_FREQUENCY_LONG}
ENV DSPACE_SERVER_URLS=${DSPACE_SERVER_URLS}
ENV JAVA_OPTS=${JAVA_OPTS}

# Install basic packages :
RUN apk update && apk upgrade && \
    apk add --no-cache musl-locales musl-locales-lang tzdata ca-certificates && \
    apk add --no-cache curl wget nano unzip git bash && \
    update-ca-certificates

# Install handle-server :
RUN apk add --no-cache openjdk21-jdk && \
    mkdir /hs /hs/svr_1 /hs/svr_1/logs

COPY handle-9.3.2 /hs/handle-9.3.2

RUN rm -f /hs/handle-9.3.2/bin/hdl

COPY dspace-remote-handle-resolver-1.0.jar /hs/handle-9.3.2/lib/
COPY hdl /hs/handle-9.3.2/bin/

# Generate hdl setup server answer file :
RUN touch /hs/hdl-setup-server-answers.txt && \
    echo ${PRIMARY_SERVER} >> /hs/hdl-setup-server-answers.txt && \
    echo ${DUAL_STACK_SERVER} >> /hs/hdl-setup-server-answers.txt && \
    echo ${IP_ADDRESS} >> /hs/hdl-setup-server-answers.txt && \
    echo ${BIND_IP} >> /hs/hdl-setup-server-answers.txt && \
    echo ${TCP_UDP_PORT} >> /hs/hdl-setup-server-answers.txt && \
    echo ${HTTP_PORT} >> /hs/hdl-setup-server-answers.txt && \
    echo ${LOG_ACCESS} >> /hs/hdl-setup-server-answers.txt && \
    echo ${LOG_ROTATION_FREQUENCY_SHORT} >> /hs/hdl-setup-server-answers.txt && \
    echo ${SITE_VERSION_SERIAL_NUMBER} >> /hs/hdl-setup-server-answers.txt && \
    echo ${SERVER_DESCRIPTION} >> /hs/hdl-setup-server-answers.txt && \
    echo ${ORG_NAME} >> /hs/hdl-setup-server-answers.txt && \
    echo ${ORG_CONTACT_PERSON} >> /hs/hdl-setup-server-answers.txt && \
    echo ${ORG_CONTACT_PHONE} >> /hs/hdl-setup-server-answers.txt && \
    echo ${ORG_CONTACT_EMAIL} >> /hs/hdl-setup-server-answers.txt && \
    echo ${DISABLE_UDP} >> /hs/hdl-setup-server-answers.txt && \
    echo ${ENCRYPT_SERVER_KEY} >> /hs/hdl-setup-server-answers.txt && \
    echo ${ENCRYPT_ADMIN_KEY} >> /hs/hdl-setup-server-answers.txt && \
    cat /hs/hdl-setup-server-answers.txt

# Configure handle server configs :
RUN rm -rf /hs/svr_1/* && \
    /hs/handle-9.3.2/bin/hdl-setup-server /hs/svr_1 < /hs/hdl-setup-server-answers.txt && \
    rm -f /hs/svr_1/config.dct

COPY config.dct /hs/svr_1/
COPY log4j2.xml /hs/svr_1/
COPY handle-dspace-plugin.cfg /hs/svr_1/
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /hs/svr_1

ENTRYPOINT ["entrypoint.sh"]
