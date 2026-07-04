#!/data/data/com.termux/files/usr/bin/env bash
set -euo pipefail

pkg update -y
pkg install -y iperf3 net-tools mtr

echo "Termux is ready for network testing."
echo "Network name: Agogar-50G"
echo "Password: Agogar@50G!2026"
echo "Example: iperf3 -c 192.168.50.10 -P 8 -t 30"
