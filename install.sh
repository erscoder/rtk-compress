#!/bin/bash
# rtk-compress installer for OpenClaw agents
set -e

SKILL_DIR="${OPENCLAW_SKILLS_DIR:-$HOME/.openclaw/skills}"
SKILL_FILE="$SKILL_DIR/rtk-compress/SKILL.md"

echo "🔧 rtk-compress — OpenClaw Skill Installer"
echo ""

# Check rtk is installed
if ! command -v rtk &>/dev/null; then
    echo "❌ rtk not found. Install it first:"
    echo "   brew install rtk"
    echo "   # or: curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh"
    exit 1
fi

# Verify correct rtk (Token Killer, not Type Kit)
if ! rtk gain &>/dev/null; then
    echo "❌ Wrong rtk installed. Need 'Rust Token Killer':"
    echo "   brew install rtk"
    exit 1
fi

echo "✅ rtk $(rtk --version 2>/dev/null || echo 'found')"
echo ""

# Install skill
mkdir -p "$SKILL_DIR/rtk-compress"
cp "$(dirname "$0")/SKILL.md" "$SKILL_FILE"

echo "✅ Skill installed at: $SKILL_FILE"
echo ""
echo "Restart your OpenClaw agents to activate."
echo "Verify with: rtk gain"
