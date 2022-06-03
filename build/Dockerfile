FROM alpine:latest

RUN apk --no-cache add \
	dnsmasq-dnssec \
	inotify-tools
RUN mkdir -p /etc/default/
RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 53 53/udp

CMD [ "run" ]
ENTRYPOINT ["/entrypoint.sh"]
