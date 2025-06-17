#/bin/sh

# Install config
#
# FIXME: This is WIP, and is NOT guaranteed to work.

SCRIPTDIR=$(realpath $(dirname "$0"))

cat > /tmp/folder-blacklist << EOF
tmux
.git
EOF


if [ ! $SCRIPTDIR == "$HOME/.config" ]; then
  mkdir -p "$HOME/.config" > /dev/null;
  FOLDERS=$(find "$SCRIPTDIR" -maxdepth 1 -mindepth 1 -type d -printf "%f\n" | grep -vF -f /tmp/folder-blacklist)
  # backup existing folder
  for folder in $FOLDERS; do
    CONFIG_DIR="$HOME/.config/$folder"
    SOURCE_DIR="$SCRIPTDIR/$folder"

    if [ -d $CONFIG_DIR ] && ! [ -L $CONFIG_DIR ]; then
      BACKUP_DIR="$HOME/.config/$folder.bak.$(date +%s)"

      # this will probably never happen
      while [ -d "$BACKUP_DIR" ]; do
        BACKUP_DIR="$HOME/.config/$folder.bak.$(date +%s)"
      done

      echo "Backing up existing $folder to $BACKUP_DIR"
  
      mv "$CONFIG_DIR" "$BACKUP_DIR"
    fi

    echo "Linking $SCRIPTDIR/$folder to $HOME/.config/$folder"
    ln -sf "$SCRIPTDIR/$folder" "$HOME/.config/$folder"
  done
fi

# Install home-level config files
ln -sf "$SCRIPTDIR/tmux/tmux.conf" "$HOME/.tmux.conf"
