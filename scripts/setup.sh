#!/usr/bin/env bash
set -euo pipefail

echo "=== OmniRoute + OpenClaw + Telegram Setup Helper ==="

# Check Node
if ! command -v node &>/dev/null; then
  echo "Node.js is required (>= 22.22.2). Install it first."
  exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2)
echo "Node version: $NODE_VERSION"

echo ""
echo "1. Installing OmniRoute globally..."
npm install -g omniroute@latest || true

echo ""
echo "2. Creating OpenClaw config directory..."
mkdir -p ~/.openclaw

if [ ! -f ~/.openclaw/openclaw.json ]; then
  cp configs/openclaw.json ~/.openclaw/openclaw.json
  echo "Copied configs/openclaw.json → ~/.openclaw/openclaw.json"
  echo "IMPORTANT: Edit ~/.openclaw/openclaw.json and replace YOUR_OMNIROUTE_API_KEY and YOUR_TELEGRAM_BOT_TOKEN"
else
  echo "~/.openclaw/openclaw.json already exists – skipping copy"
fi

echo ""
echo "Next steps:"
echo "  1. Run: omniroute"
echo "  2. Open http://localhost:20128 and connect free providers + copy API key"
echo "  3. Create a Telegram bot via @BotFather and get the token"
echo "  4. Edit ~/.openclaw/openclaw.json with both keys"
echo "  5. Install OpenClaw (see README) and run: openclaw gateway"
echo ""
echo "Done."
