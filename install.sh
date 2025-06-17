#/bin/sh

# Install config
#
# FIXME: This is WIP, and is NOT guaranteed to work.

SCRIPTDIR=$(realpath $(dirname "$0"))

if [ ! $SCRIPTDIR == "$HOME/.config" ]; then
  mkdir -p "$HOME/.config" > /dev/null;
  ls -d "$SCRIPTDIR" | xargs -I {} ln -sf {} "$HOME/.config/$(basename {})"
fi

# Install home-level config files

ln -sf "$SCRIPTDIR/tmux/tmux.conf" "$HOME/.tmux.conf"


