#!/bin/zsh
# Serveur local artn0art — lancé par LaunchAgent (stable hors Cursor).
set -euo pipefail
ROOT="/Users/artnoart/Code/_projets/artn0art"
LOG="$ROOT/_logs/hugo-dev-server.log"
HUGO="/opt/homebrew/bin/hugo"
if [[ ! -x "$HUGO" ]]; then
  HUGO="$(command -v hugo)"
fi
cd "$ROOT"
exec "$HUGO" server -D \
  --bind 0.0.0.0 \
  --baseURL "http://127.0.0.1:1313/" \
  --port 1313 \
  >> "$LOG" 2>&1
