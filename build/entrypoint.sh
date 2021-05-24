#!/bin/sh
set -e

dnsmasq --test

HOSTS_FILE=$(grep '^addn-hosts=' /etc/dnsmasq.conf | head -n1 | sed -e 's/^.*\?=\s*\(.*\?\)\s*$/\1/')
if test -f ${HOSTS_FILE}; then
	echo "Watching ${HOSTS_FILE} for changes"
	while inotifywait -e close_write ${HOSTS_FILE} >/dev/null; do
		if ! dnsmasq --test >/dev/null; then
			echo "Not reloading hosts records since dnsmasq config is invalid"
		else
			(ps -ef | grep [d]nsmasq | awk '{print $1}' | xargs kill -1) && echo "Reloaded hosts records"
		fi
	done &
fi

dnsmasq --no-daemon --log-queries --log-facility=/var/log/dnsmasq.log
