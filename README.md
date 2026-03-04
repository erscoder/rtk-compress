# rtk-compress — OpenClaw Skill

> Save 60-90% of LLM tokens on shell commands with a one-line change.

An [OpenClaw](https://openclaw.ai) skill that integrates [rtk (Rust Token Killer)](https://github.com/rtk-ai/rtk) into your AI agents — compressing `exec` outputs before they reach the LLM context.

## Why

Every time your agent runs `git log`, `npm test`, or `cat file.ts`, it burns thousands of tokens on output the LLM doesn't need in full. rtk filters that noise at the source.

**Typical session without rtk:** ~150,000 tokens  
**With rtk:** ~45,000 tokens → **70% reduction**

## Install

```bash
# 1. Install rtk
brew install rtk

# 2. Copy SKILL.md to your agent's skills directory
cp SKILL.md ~/.openclaw/agents/<your-agent>/skills/rtk-compress.md

# 3. Restart your agent — it will now use rtk automatically
```

## How it works

The skill instructs your agent to prefix commands with `rtk`:

```bash
# Before
git log --oneline -20   → 2,000 tokens

# After  
rtk git log --oneline -20  → 400 tokens  (-80%)
```

rtk filters progress bars, decorators, ansi colors, and verbose boilerplate — keeping only what the LLM needs to understand the output.

## Token Savings

| Command | Standard | rtk | Savings |
|---------|----------|-----|---------|
| `ls / tree` | 2,000 | 400 | -80% |
| `cat / read` | 40,000 | 12,000 | -70% |
| `grep / rg` | 16,000 | 3,200 | -80% |
| `git status` | 3,000 | 600 | -80% |
| `git diff` | 10,000 | 2,500 | -75% |
| `npm test` | 25,000 | 2,500 | -90% |
| `pytest` | 8,000 | 800 | -90% |

## Track your savings

```bash
rtk gain           # current session
rtk gain --global  # all-time
```

## Compatibility

- ✅ OpenClaw (all agents)
- ✅ Claude Code
- ✅ Any LLM agent that runs shell commands

## Related

- [rtk](https://github.com/rtk-ai/rtk) — the underlying compression tool
- [OpenClaw tool middleware feature request](https://github.com/openclaw/openclaw/issues/35053) — native integration proposal
- [OpenClaw](https://openclaw.ai) — the AI agent platform this skill is built for

## License

MIT
