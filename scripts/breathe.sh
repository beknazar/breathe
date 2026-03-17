#!/bin/bash
# Breathe — terminal breathing timer
# Usage: bash breathe.sh [mode]
# Modes: sigh (default, 30s), box (2min), body (1min), grass (5min)

MODE="${1:-sigh}"
C='\033[0;36m'
D='\033[2m'
B='\033[1m'
R='\033[0m'
G='\033[0;32m'

cl() { printf '\r\033[K'; }

bar() {
  local label="$1" secs="$2" ch="${3:-.}" w=20
  for ((i=1; i<=secs*2; i++)); do
    local f=$((i * w / (secs * 2))) b=""
    for ((j=0; j<f; j++)); do b+="$ch"; done
    cl; printf "  ${C}%-10s${R} %s" "$label" "$b"
    sleep 0.5
  done
  cl
}

printf "\n"

case "$MODE" in
  sigh)
    printf "  ${B}Physiological Sigh${R}  ${D}30 seconds${R}\n\n"
    for round in 1 2 3; do
      printf "  ${D}Round %d${R}\n" "$round"
      bar "Inhale" 4 "●"
      printf "\n"
      bar "Exhale" 6 "○"
      printf "\n\n"
    done
    printf "  ${G}Done.${R}\n"
    ;;

  box)
    printf "  ${B}Box Breathing${R}  ${D}2 minutes${R}\n\n"
    for round in 1 2 3 4; do
      printf "  ${D}Round %d/4${R}\n" "$round"
      bar "Inhale" 4 "●"; printf "\n"
      bar "Hold" 4 "·"; printf "\n"
      bar "Exhale" 4 "○"; printf "\n"
      bar "Hold" 4 "·"; printf "\n\n"
    done
    printf "  ${G}Done.${R}\n"
    ;;

  body)
    printf "  ${B}Body Check${R}  ${D}1 minute${R}\n\n"
    spots=("Jaw" "Shoulders" "Hands" "Stomach" "Feet")
    cues=("unclench" "drop" "unfist" "soften" "ground")
    for i in "${!spots[@]}"; do
      printf "  ${C}%-12s${R} ${D}%s${R}\n" "${spots[$i]}" "${cues[$i]}"
      for ((j=10; j>0; j--)); do
        cl; printf "  ${D}%d${R}" "$j"; sleep 1
      done
      cl; printf "\n"
    done
    printf "\n  ${G}Done.${R}\n"
    ;;

  grass)
    printf "  ${B}Touch Grass${R}  ${D}5 minutes${R}\n\n"
    printf "  Stand up. Walk away from the screen.\n"
    printf "  ${D}No phone. Just notice what's around you.${R}\n\n"
    for ((i=300; i>0; i--)); do
      cl; printf "  ${B}%d:%02d${R}" "$((i/60))" "$((i%60))"; sleep 1
    done
    cl; printf "\n  ${G}Done.${R}\n"
    ;;

  *)
    printf "  Usage: breathe.sh [sigh|box|body|grass]\n"
    ;;
esac

printf "\n"
