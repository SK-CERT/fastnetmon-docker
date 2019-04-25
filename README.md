# FastNetMon unofficial docker image
Inspired by [unofficial docker image](https://github.com/DE-IBH/fastnetmon-docker.git).

## Run
Run image using:

    docker run -a stdin -a stdout -i \
    -v /var/log/fastnetmon_attacks:/var/log/fastnetmon_attacks \
    -v /var/log/fastnetmon.log:/var/log/fastnetmon.log \
    -v /etc/networks_list:/etc/networks_list \
    -v /etc/fastnetmon.conf:/etc/fastnetmon.conf \
    -v /etc/networks_whitelist:/etc/networks_whitelist \
    -v /usr/local/fastnetmon:/usr/local/fastnetmon \
    -v /etc/exabgp_blackhole.conf:/etc/exabgp_blackhole.conf \
    -v /var/log/fastnetmon-notify.log:/var/log/fastnetmon-notify.log \
    -p 10.100.20.2:2055:2055/udp \
    -p 10.100.20.6:2055:2055/udp \
    -p 10.100.20.2:179:179/tcp \
    --name fastnetmon \
    -t teebor/fastnetmon /bin/bash
