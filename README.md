# OmniRoute + OpenClaw + Telegram Setup

One-stop repo to run **OmniRoute** (free AI gateway with 290+ providers) + **OpenClaw** (personal AI agent) and talk to it from **Telegram**.

## What you get
- OmniRoute as the local OpenAI-compatible endpoint (free tiers + auto-fallback)
- OpenClaw as the agent that lives in Telegram
- Ready configs, Docker option, and GitHub Actions CI/CD

## Prerequisites
- Node.js >= 22.22.2
- Git
- A Telegram account

## Quick Start (Local)

### 1. Install OmniRoute
```bash
npm install -g omniroute
omniroute
```
Dashboard: http://localhost:20128  
Connect free providers (Kiro, Qwen, DeepSeek free, etc.) and copy your API key from **Endpoints**.

### 2. Install OpenClaw
```bash
curl -fsSL https://openclaw.ai/install.sh | bash
# or follow https://github.com/openclaw/openclaw
```

### 3. Configure OpenClaw to use OmniRoute
Copy the template:
```bash
mkdir -p ~/.openclaw
cp configs/openclaw.json ~/.openclaw/openclaw.json
```
Edit `~/.openclaw/openclaw.json` and replace `YOUR_OMNIROUTE_API_KEY` with the key from the OmniRoute dashboard.

### 4. Create Telegram Bot
1. Open Telegram → talk to [@BotFather](https://t.me/BotFather)
2. Send `/newbot` and follow the prompts
3. Copy the bot token

### 5. Add Telegram to OpenClaw config
In `~/.openclaw/openclaw.json` set:
```json
"channels": {
  "telegram": {
    "enabled": true,
    "botToken": "YOUR_BOT_TOKEN_HERE",
    "dmPolicy": "pairing"
  }
}
```

### 6. Start everything
```bash
# Terminal 1
omniroute

# Terminal 2
openclaw gateway
```

Message your bot on Telegram. Complete the pairing code if asked.

## Docker option
See `docker-compose.yml`.

## GitHub Actions
This repo includes a CI workflow that validates configs and can be extended for deployment.

## Files
- `configs/openclaw.json` – OpenClaw template pointed at OmniRoute
- `configs/omniroute.env.example` – optional OmniRoute env
- `scripts/setup.sh` – helper script
- `.github/workflows/ci.yml` – GitHub Actions CI/CD
- `docker-compose.yml` – optional containerized run

## Support
- OmniRoute: https://github.com/diegosouzapw/OmniRoute
- OpenClaw: https://github.com/openclaw/openclaw
- OmniRoute Telegram community: https://t.me/omnirouteOficial

Made for easy free AI via Telegram.
