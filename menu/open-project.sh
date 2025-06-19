#!/bin/sh

PROJECT_DIR=~/Projects

# check if a name was passed as an argument

MAX_LENGTH=8

if [ -n "$1" ]; then
  PROJECT_NAME="$1"
else
  OPTIONS=$(ls $PROJECT_DIR)
  LENGTH=$(wc -l <<< $OPTIONS)
  LENGTH=$(($LENGTH > $MAX_LENGTH ? $MAX_LENGTH : $LENGTH))
  PROJECT_NAME=$(
    ~/.config/menu/lib/menu.sh -c -l $LENGTH -p "OPEN PROJECT" <<< $OPTIONS
  ) || exit 1
fi

PROJECT_NAME_CLEAN="${PROJECT_NAME//[. ]/-}"

if tmux has-session -t $PROJECT_NAME_CLEAN 2>/dev/null; then
  kitty tmux attach-session -t $PROJECT_NAME
else
  kitty tmux new-session -s $PROJECT_NAME_CLEAN -c $PROJECT_DIR/$PROJECT_NAME
fi

