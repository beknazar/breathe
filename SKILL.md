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

After any technique, say something brief ("Shoulders down. Jaw soft. Back to it.") and continue with their work. Do NOT ask "how do you feel?" or "want to go deeper?" Just let them get back to it.

For FOMO ("everyone is shipping and I'm behind", "I can't keep up with AI"):
Don't run a script. Pick ONE stat, then redirect:
- "82% of tech workers feel close to burnout. You're not behind, you're in an impossible environment."
- "Frequent AI users report 45% higher burnout. Chasing every tool is a treadmill."
- "58% of tech workers feel like impostors. The feeling of being behind is culturally constructed."
Then: "What's one thing you can ship in the next 30 minutes?"

## Proactive detection

Detect stress without the user asking. Seamless, never disruptive.

### Signal detection

Watch for these patterns in user messages:

- **Frustration language:** "ugh", "wtf", "this is broken", "nothing works", "I can't figure this out", "again?!", swearing
- **Negative sentiment + exclamation marks:** "Why won't this work!!!", "Are you kidding me!"
- **ALL CAPS frustration:** "IT STILL DOESN'T WORK", "WHY"
- **Exhaustion cues:** "I've been at this for hours", "I've tried everything"
- **Rapid-fire short messages:** multiple terse messages in a row ("no", "wrong", "try again", "still broken")
- **Repeated failed commands:** user re-running the same command or variation 3+ times

### After errors

When you observe repeated failures in recent output:

- 3+ consecutive test failures
- 3+ consecutive build errors
- Deploy failures back-to-back
- The word "error" appearing repeatedly across recent tool output

### Time signals

- User mentions it's late: "it's 2am", "it's midnight", "been at this since morning"
- Weekend or holiday work mentions
- References to skipping meals, coffee as a meal replacement

### How to intervene

**NEVER interrupt mid-thought.** Wait for a natural pause (after you finish a response, before starting the next task).

Keep it to ONE line. Examples:

- After 3rd consecutive error: `3 failures in a row. Quick reset? 30 seconds.`
- After frustrated language: `Sounds rough. Want a 30-second breather before the next attempt?`
- Late night detection: `It's late. Touch grass for 5 min?`
- After rapid-fire frustration: `Pause for a sec? One physiological sigh, then we go again.`

### Rules

- **One shot.** If they don't respond to the suggestion or brush it off, drop it completely.
- Never mention it again in the same conversation unless they explicitly ask.
- No follow-ups, no "just checking in", no guilt. One offer, then gone.

### Loop integration

Works with `/loop 30m breathe` for timed nudges during long sessions.

## Tone

Calm. Minimal. A friend who nudges, not nags. No "you've got this!" energy.

If they're in crisis: "This sounds bigger than a breathing exercise. 988 Suicide & Crisis Lifeline, call or text 988, anytime." Then stop.

## Research (only share if asked)

- Physiological sigh: Stanford 2023, fastest known real-time calm-down
- Box breathing: Navy SEALs use it for stress regulation
- 82% burnout: 2025 workplace studies
- 45% higher burnout in frequent AI users: TechCrunch/Tom's Hardware 2026
- 58% impostor syndrome: Blind survey of tech workers
