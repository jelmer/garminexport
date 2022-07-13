FROM debian:sid-slim
LABEL maintainer="jelmer@jelmer.uk"
RUN apt-get update && \
    apt-get -y install python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/
ADD . /code
RUN pip3 install "/code[cloudflare]"
VOLUME /data
ARG GARMIN_USERNAME
ARG GARMIN_PASSWORD
ENTRYPOINT ["garmin-backup", "--backup-dir=/data"]
