#/bin/sh

# Install config
#
# FIXME: This is WIP, and is NOT guaranteed to work.

SCRIPTDIR=$(realpath $(dirname "$0"))

cat > /tmp/folder-blacklist << EOF
tmux
.git
EOF

link() {
  SOURCE="$1"
  TARGET="$2"

  if [ -e "$TARGET" ] && ! [ -L "$TARGET" ]; then
    echo "Backing up existing $TARGET to $TARGET.bak.$(date +%s)"
    mv "$TARGET" "$TARGET.bak.$(date +%s)"
  fi

  # this prevents recursive link being added.. weird
  if [ -L "$TARGET" ]; then
    rm $TARGET
  fi

  echo "Linking $SOURCE to $TARGET"
  ln -sf "$SOURCE" "$TARGET"
}


if [ ! $SCRIPTDIR == "$HOME/.config" ]; then
  mkdir -p "$HOME/.config" > /dev/null;
  FOLDERS=$(find "$SCRIPTDIR" -maxdepth 1 -mindepth 1 -type d -printf "%f\n" | grep -vF -f /tmp/folder-blacklist)
  # backup existing folder
  for folder in $FOLDERS; do
    CONFIG_DIR="$HOME/.config/$folder"
    SOURCE_DIR="$SCRIPTDIR/$folder"

    link "$SCRIPTDIR/$folder" "$HOME/.config/$folder"
  done
fi

# Install home-level config files
link "$SCRIPTDIR/tmux/tmux.conf" "$HOME/.tmux.conf"
