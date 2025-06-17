#!/bin/bash

MAX_COUNT=8

SESSIONS=$(tmux list-sessions -F '#{session_name}')

if [ $? -eq 0 ]; then
  COUNT=$(echo "$SESSIONS" | wc -l)
  COUNT=$(( $COUNT < $MAX_COUNT ? $COUNT : $MAX_COUNT ))
  PROMPT="OPEN/CREATE SESSION"
  SELECTED_SESSION=$(
    printf "%s\n" $SESSIONS | ~/.config/menu/lib/menu.sh -c -w 600 -l $COUNT -p "$PROMPT" \
  ) || exit 1
else
  SELECTED_SESSION=$(
    ~/.config/menu/lib/menu.sh -c -w 600 -p "CREATE SESSION" \
  ) || exit 1
fi

if tmux has-session -t "$SELECTED_SESSION" 2>/dev/null; then
  kitty tmux attach-session -t "$SELECTED_SESSION";
else
  kitty tmux new-session -s "$SELECTED_SESSION" -c "$HOME"
fi
