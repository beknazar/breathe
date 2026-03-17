# Breathe

A breathing timer for your terminal. A Claude Code skill that detects when you're stressed and runs a 30-second reset, right in the CLI.

![breathe demo](docs/breathe-demo.gif)

## Install

```bash
git clone git@github.com:beknazar/breathe.git ~/.claude/skills/breathe
```

## How it works

You don't have to ask. The skill watches for stress signals and offers a reset at the right moment.

**After 3 failed builds in a row:**
```
3 failures in a row. Quick reset? 30 seconds.
```

**After frustrated messages:**
```
Sounds rough. Want a 30-second breather before the next attempt?
```

**Late night coding:**
```
It's late. Touch grass for 5 min?
```

One offer. If you ignore it, it's gone. No follow-ups, no guilt.

You can also trigger it directly. Say "I'm stressed" or "breathe" and it runs a breathing timer with progress bars:

```
  Physiological Sigh  30 seconds

  Round 1
  In · · ·  ●●●●●●●●●●●●●●●●●●●●
  In ·      ●●●●●●●●●●●●●●●●●●●●
  Out · · · · ·  ○○○○○○○○○○○○○○○○○○○○

  Shoulders down. Jaw soft. Back to it.
```

## What it detects

The skill picks up on frustration language ("ugh", "wtf", "nothing works"), ALL CAPS, repeated failures, exhaustion cues ("I've been at this for hours"), and late-night mentions. It waits for a natural pause, never interrupts mid-thought.

## 6 techniques

| Technique | Time | Trigger |
|-----------|------|---------|
| Physiological Sigh | 30 sec | Stress, overwhelm (default) |
| Three Breaths | 20 sec | Between tasks, before a decision |
| Body Check | 1 min | Tense shoulders, clenched jaw |
| FOMO Check | 1 min | "Everyone is shipping and I'm behind" |
| Box Breathing | 2 min | "Meditate", longer reset |
| Touch Grass | 5 min | Been grinding for hours |

You don't pick. It reads the situation and picks for you.

## Timed nudges

Plug it into a long session:

```
/loop 30m breathe
```

Two nudges per hour, max. Say no and it says "Got it."

## Why

82% of tech workers feel close to burnout. Frequent AI users report 45% higher burnout than moderate users. 58% feel like impostors.

There are skills for shipping code, reviewing PRs, optimizing queries. There wasn't one for the person writing it.

## Research

Physiological sigh from Stanford (2023). Box breathing from Navy SEALs. Burnout data from 2025 workplace studies. The skill keeps the citations quiet unless you ask.

## Author

Bek, [@beknabdik](https://x.com/beknabdik)

## License

MIT
