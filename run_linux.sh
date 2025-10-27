#!/usr/bin/env bash
set -euo pipefail
# Create venv if missing, install requirements, then run the bot.
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HERE"
if [ ! -d .venv ]; then
  python3 -m venv .venv
fi
source .venv/bin/activate
if [ -f requirements.txt ]; then
  pip install -U pip
  pip install -r requirements.txt
fi
# Try common entry points
if [ -f main.py ]; then
  python main.py
elif [ -f app.py ]; then
  python app.py
else
  echo "Activate venv and run the appropriate Python entry file." >&2
  ls -1 *.py || true
  exit 1
fi
