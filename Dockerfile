FROM alpine:3.6

MAINTAINER nemd <michal@reaper.pl>

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
	echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update-cache deluge@testing boost-python@edge boost-system@edge libressl2.5-libcrypto@edge libressl2.5-libssl@edge py-pip

RUN pip install packaging incremental constantly automat service_identity

VOLUME /config /downloads

EXPOSE 58846 6881 6891
