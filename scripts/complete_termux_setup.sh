#!/data/data/com.termux/files/usr/bin/env bash
set -euo pipefail

pkg update -y
pkg install -y iperf3 net-tools mtr curl openssh

mkdir -p "$HOME/.local/bin"
cat > "$HOME/.local/bin/agogar-speed-test" <<'EOF'
#!/data/data/com.termux/files/usr/bin/env bash
set -euo pipefail
if [[ $# -lt 1 ]]; then
  echo "Usage: agogar-speed-test <server-ip>" >&2
  exit 1
fi
SERVER_IP="$1"
iperf3 -c "$SERVER_IP" -P 8 -t 30
EOF
chmod +x "$HOME/.local/bin/agogar-speed-test"

cat > "$HOME/.local/bin/agogar-info" <<'EOF'
#!/data/data/com.termux/files/usr/bin/env bash
set -euo pipefail
echo "Agogar-50G"
echo "Password: Agogar@50G!2026"
echo "Example: agogar-speed-test 192.168.50.10"
EOF
chmod +x "$HOME/.local/bin/agogar-info"

echo "Termux setup completed."
echo "Run: agogar-info"
echo "Run: agogar-speed-test 192.168.50.10"
