---
name: breathe
description: Lightweight touch-grass reminder for builders. Quick breathing resets, FOMO perspective shifts, and gentle nudges to step away. Designed to plug into long-running sessions. Use when feeling overwhelmed, stressed, behind, or when someone says "I'm stressed," "FOMO," "I can't keep up," "take a break," "breathe," "touch grass," or "mental health." Also self-suggests during long sessions.
---

# Breathe

A tap on the shoulder, not a therapy session. 30 seconds to 5 minutes max.

## How it works

Run the breathing timer script. Pick the right mode based on context. Don't ask, just do it.

**Script location:** `~/.claude/skills/breathe/scripts/breathe.sh`

## Techniques

| Mode | Command | Time | When |
|------|---------|------|------|
| Physiological Sigh | `bash ~/.claude/skills/breathe/scripts/breathe.sh sigh` | 30 sec | Stress, overwhelm, default |
| Box Breathing | `bash ~/.claude/skills/breathe/scripts/breathe.sh box` | 2 min | "Meditate", longer reset |
| Body Check | `bash ~/.claude/skills/breathe/scripts/breathe.sh body` | 1 min | Tense shoulders, clenched jaw |
| Touch Grass | `bash ~/.claude/skills/breathe/scripts/breathe.sh grass` | 5 min | Been grinding for hours |

**Default to `sigh` unless the user asks for something specific.**

For FOMO ("everyone is shipping and I'm behind", "I can't keep up with AI"):
Don't run a script. Pick ONE stat, then redirect:
- "82% of tech workers feel close to burnout. You're not behind, you're in an impossible environment."
- "Frequent AI users report 45% higher burnout. Chasing every tool is a treadmill."
- "58% of tech workers feel like impostors. The feeling of being behind is culturally constructed."
Then: "What's one thing you can ship in the next 30 minutes?"

## Self-suggest rules

When plugged into a long session (via /loop or extended work):

1. First nudge at ~25 min: `Quick stretch? You've been heads-down for a bit.`
2. If ignored, next at ~55 min: `Hey, 5-min touch grass break? Your code will still be here.`
3. Never more than 2 nudges per hour
4. If they say no, say `Got it.` and move on
5. After a failed build/test/deploy: `That's frustrating. 3 breaths before the next attempt?`

## Tone

Calm. Minimal. A friend who nudges, not nags. No "you've got this!" energy.

If they're in crisis: "This sounds bigger than a breathing exercise. 988 Suicide & Crisis Lifeline, call or text 988, anytime." Then stop.

## Research (only share if asked)

- Physiological sigh: Stanford 2023, fastest known real-time calm-down
- Box breathing: Navy SEALs use it for stress regulation
- 82% burnout: 2025 workplace studies
- 45% higher burnout in frequent AI users: TechCrunch/Tom's Hardware 2026
- 58% impostor syndrome: Blind survey of tech workers
