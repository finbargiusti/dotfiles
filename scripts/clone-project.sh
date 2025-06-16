#!/bin/sh

PROJECT_DIR=~/Projects

REPO_URL=$(
  ~/.config/scripts/lib/menu.sh -c -w 700 -p "REPO URL" \
) || exit 1


REPO_NAME=$(basename "$REPO_URL" .git)

if [ -d "$PROJECT_DIR/$REPO_NAME" ]; then
  notify-send "Project already exists: $REPO_NAME"
  exit 1
fi

kitty sh -c "cd $PROJECT_DIR && git clone $REPO_URL || cat"

if [ -d "$PROJECT_DIR/$REPO_NAME" ]; then
  ~/.config/scripts/open-project.sh "$REPO_NAME"
fi
