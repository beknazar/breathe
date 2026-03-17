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
    cl; printf "  ${C}%s${R}  %s" "$label" "$b"
    sleep 0.5
  done
  cl
}

printf "\n\n"

case "$MODE" in
  sigh)
    printf "  ${B}Physiological Sigh${R}  ${D}30 seconds${R}\n\n"
    for round in 1 2 3; do
      printf "  ${D}Round %d${R}\n" "$round"
      bar "In · · ·" 3 "●"
      bar "In ·" 1 "●"
      printf "\n"
      bar "Out · · · · ·" 5 "○"
      printf "\n\n"
      sleep 0.5
    done
    printf "  ${G}Shoulders down. Jaw soft. Back to it.${R}\n"
    ;;

  box)
    printf "  ${B}Box Breathing${R}  ${D}2 minutes${R}\n\n"
    for round in 1 2 3 4; do
      printf "  ${D}Round %d/4${R}\n" "$round"
      bar "Inhale" 4 "●"; printf "\n"
      bar "Hold  " 4 "·"; printf "\n"
      bar "Exhale" 4 "○"; printf "\n"
      bar "Hold  " 4 "·"; printf "\n\n"
    done
    printf "  ${G}Three natural breaths. Done.${R}\n"
    ;;

  body)
    printf "  ${B}Body Check${R}  ${D}1 minute${R}\n\n"
    spots=("Jaw — unclench it" "Shoulders — drop them" "Hands — unfist them" "Stomach — let it be soft" "Feet — feel the floor")
    for spot in "${spots[@]}"; do
      printf "  ${C}%s${R}\n" "$spot"
      for ((i=10; i>0; i--)); do
        cl; printf "  ${D}%d${R}" "$i"; sleep 1
      done
      cl; printf "\n"
    done
    printf "\n  ${G}That's it. Carry on.${R}\n"
    ;;

  grass)
    printf "  ${B}Touch Grass${R}  ${D}5 minutes${R}\n\n"
    printf "  Stand up. Walk away from the screen.\n\n"
    printf "  ${D}Go outside if you can. No phone.${R}\n"
    printf "  ${D}Just notice what's around you.${R}\n\n"
    for ((i=300; i>0; i--)); do
      cl; printf "  ${B}%d:%02d${R}" "$((i/60))" "$((i%60))"; sleep 1
    done
    cl; printf "\n  ${G}Welcome back.${R}\n"
    ;;

  *)
    printf "  Usage: breathe.sh [sigh|box|body|grass]\n"
    ;;
esac

printf "\n"
