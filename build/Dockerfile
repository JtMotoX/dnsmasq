FROM alpine:latest

RUN apk --no-cache add \
	dnsmasq-dnssec \
	inotify-tools
RUN mkdir -p /etc/default/
RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq

RUN apk add --no-cache libcap
RUN setcap CAP_NET_BIND_SERVICE=+eip /usr/sbin/dnsmasq

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

USER 9001:9001

EXPOSE 53 53/udp

CMD [ "run" ]
ENTRYPOINT ["/entrypoint.sh"]
