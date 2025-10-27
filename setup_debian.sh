#!/usr/bin/env bash
set -euo pipefail
sudo apt-get update
# Common deps (adjust as your bot needs)
sudo apt-get install -y python3 python3-venv python3-pip git curl ffmpeg aria2
if ! id -u bot >/dev/null 2>&1; then
  echo "You can create a non-root user (optional): sudo adduser bot"
fi
echo "Done. Now run: ./run_linux.sh"
