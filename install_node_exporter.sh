#!/bin/bash

wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
tar xzf node_exporter-1.3.1.linux-amd64.tar.gz
sudo mv -v node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin/

cat <<EOF >/etc/systemd/system/node-exporter.service
[Unit]
Description=Prometheus exporter for machine metrics

[Service]
Restart=always
User=ubuntu
ExecStart=/usr/local/bin/node_exporter
ExecReload=/bin/kill -HUP $MAINPID
TimeoutStopSec=20s
SendSIGKILL=no

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start node-exporter.service
sudo systemctl enable node-exporter.service

