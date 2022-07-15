#!/bin/bash
wget https://github.com/prometheus/alertmanager/releases/download/v0.21.0/alertmanager-0.21.0.linux-amd64.tar.gz
tar -xzf alertmanager-0.21.0.linux-amd64.tar.gz
cp ./alertmanager-0.21.0.linux-amd64/alertmanager /usr/local/bin/
rm -Rf alertmanager-0.21.0.linux-amd64
rm -Rf alertmanager-0.21.0.linux-amd64.tar.gz

mkdir -p /etc/prometheus
cat <<EOF >/etc/prometheus/alertmanager.yml
global:
  resolve_timeout: 5m

route:
  group_by: ['alertname']
  group_wait: 10s
  group_interval: 10s
  repeat_interval: 10s
  receiver: 'email'
receivers:
- name: 'email'
  email_configs:
  - to: 'receiver_mail_id@gmail.com'
    from: 'mail_id@gmail.com'
    smarthost: 'smtp.gmail.com:587'
    auth_username: 'mail_id@gmail.com'
    auth_identity: 'mail_id@gmail.com'
    auth_password: 'password'
inhibit_rules:
  - source_match:
      severity: 'critical'
    target_match:
      severity: 'warning'
    equal: ['alertname', 'dev', 'instance']
EOF

cat <<EOF >/etc/systemd/system/alertmanager.service
[Unit]
Description=Prometheus Alert Manager Service
After=network.target
[Service]
Type=simple
ExecStart=/usr/local/bin/alertmanager \
        --config.file=/etc/prometheus/alertmanager.yml 
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start alertmanager.service
sudo systemctl enable alertmanager.service
