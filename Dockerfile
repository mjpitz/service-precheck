FROM debian:stretch-slim

RUN apt-get update -y && apt-get install -y dnsutils

COPY precheck.sh /usr/bin/precheck

RUN useradd -ms /bin/sh precheck
WORKDIR /home/precheck
USER precheck

ENTRYPOINT [ "/usr/bin/precheck" ]
