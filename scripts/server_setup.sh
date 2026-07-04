#!/usr/bin/env bash
set -euo pipefail

apt update
apt install -y iperf3 net-tools traceroute mtr-tiny

echo "Server tools installed."
echo "Start iperf3 server with: iperf3 -s"
echo "Test from client with: iperf3 -c 192.168.50.10 -P 8 -t 30"
