#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Run this script as root." >&2
  exit 1
fi

if command -v apt-get >/dev/null 2>&1; then
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y iperf3 net-tools traceroute mtr-tiny curl
elif command -v yum >/dev/null 2>&1; then
  yum install -y iperf3 net-tools traceroute mtr curl
else
  echo "Unsupported package manager. Install iperf3 manually." >&2
  exit 1
fi

mkdir -p /etc/agogar
cat > /etc/agogar/network.env <<'EOF'
NETWORK_NAME=Agogar-50G
NETWORK_PASSWORD=Agogar@50G!2026
SERVER_IP=192.168.50.10
CLIENT_IP=192.168.50.20
SUBNET=192.168.50.0/24
GATEWAY=192.168.50.1
EOF

cat > /etc/systemd/system/iperf3.service <<'EOF'
[Unit]
Description=Agogar iperf3 server
After=network.target

[Service]
ExecStart=/usr/bin/iperf3 -s -p 5201
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now iperf3.service

cat > /usr/local/bin/agogar-speed-test-server <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
/usr/bin/iperf3 -s -p 5201
EOF
chmod +x /usr/local/bin/agogar-speed-test-server

cat > /usr/local/bin/agogar-show-config <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
source /etc/agogar/network.env
printf 'Network Name: %s\n' "$NETWORK_NAME"
printf 'Password: %s\n' "$NETWORK_PASSWORD"
printf 'Server IP: %s\n' "$SERVER_IP"
printf 'Gateway: %s\n' "$GATEWAY"
EOF
chmod +x /usr/local/bin/agogar-show-config

echo "Server setup completed."
echo "Use: agogar-show-config"
echo "Use: iperf3 -s -p 5201"
