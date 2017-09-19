FROM alpine:3.6

MAINTAINER nemd <michal@reaper.pl>

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
	echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update-cache runit deluge@testing boost-python@edge boost-system@edge libressl2.5-libcrypto@edge libressl2.5-libssl@edge py-pip

RUN pip install packaging incremental constantly automat service_identity

VOLUME /config /downloads

RUN mkdir -p /etc/sv/deluge_web &&\
	mkdir -p /etc/sv/deluge_web

ADD runit_deluge_daemon /etc/sv/deluge_daemon/run
ADD runit_deluge_web /etc/sv/deluge_web/run
RUN chmod +x /etc/sv/*/run

RUN ln -s /etc/sv/deluge_daemon /etc/service/deluge_daemon &&\
	ln -s /etc/sv/deluge_web /etc/service/deluge_web

EXPOSE 80

ENTRYPOINT ["/sbin/runsvdir", "/etc/service"]