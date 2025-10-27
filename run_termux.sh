#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$HERE"
# Use a local venv where possible
if [ ! -d .venv ]; then
  python -m venv .venv || true
fi
if [ -d .venv ]; then
  source .venv/bin/activate || true
fi
if [ -f requirements.txt ]; then
  pip install -U pip
  pip install -r requirements.txt
fi
# Try common entry points
if [ -f main.py ]; then
  python main.py
elif [ -f app.py ]; then
  python app.py
elif [ -f bot.py ]; then
  python bot.py
else
  echo "No obvious entrypoint found. Available .py:"
  ls -1 *.py || true
  exit 1
fi
