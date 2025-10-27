#!/usr/bin/env bash
set -euo pipefail
pkg update -y
pkg install -y python ffmpeg aria2 git curl
python -m pip install --upgrade pip
echo "Done. Now run: bash run_termux.sh"
