# syntax=docker/dockerfile:1
#
ARG IMAGEBASE=frommakefile
#
FROM ${IMAGEBASE}
#
ENV \
  TFTP_ROOT=/data
#
RUN set -xe \
    && apk add --no-cache --purge -uU \
        # --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        tftp-hpa \
    && rm -rf /var/cache/apk/* /tmp/*
#
COPY root/ /
#
VOLUME /data/
#
EXPOSE 69/udp 63050-63100/udp
#
ENTRYPOINT ["/init"]
