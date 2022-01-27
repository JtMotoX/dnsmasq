# dnsmasq in Docker

### Setup:
1. Copy '[dnsmasq-sample.conf](./dnsmasq-sample.conf)' to '[dnsmasq.conf](./dnsmasq.conf)' and make necessary changes
1. Copy '[hosts-sample](./hosts-sample)' to '[hosts](./hosts)' and make necessary changes
1. Run ```docker-compose up -d --build```
1. Watch logs with ```docker-compose logs -f```

### Notes:
- Changes to the 'dnsmasq.conf' and 'hosts' files are automatically applied without restarting container
- You might need to stop the resolver running on port 53 on the host ```systemctl stop systemd-resolved```
