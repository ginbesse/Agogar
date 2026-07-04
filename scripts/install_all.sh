#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 server|termux" >&2
  exit 1
fi

TARGET="$1"
case "$TARGET" in
  server)
    if [[ $EUID -ne 0 ]]; then
      echo "Run this as root on the server." >&2
      exit 1
    fi
    bash "$(dirname "$0")/complete_server_setup.sh"
    ;;
  termux)
    bash "$(dirname "$0")/complete_termux_setup.sh"
    ;;
  *)
    echo "Unknown target: $TARGET" >&2
    exit 1
    ;;
esac
