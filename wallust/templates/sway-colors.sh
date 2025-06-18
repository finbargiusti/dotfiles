swaymsg "set \$accent {{ color1 }}"
swaymsg "set \$error #ee2222"
swaymsg "set \$inactive {{ color1 | darken(0.5) }}"
swaymsg "set \$bg {{ background }}"

# Window type                   bar border   bar bg       text       indicator    window border
swaymsg client.focused          \$accent     \$accent     \$bg       \$accent     \$accent
swaymsg client.focused_inactive \$inactive   \$inactive   \$accent   \$inactive   \$inactive
swaymsg client.unfocused        \$inactive   \$inactive   \$accent   \$inactive   \$inactive
swaymsg client.urgent           \$error      \$error      \$accent   \$error      \$error

swaymsg output '*' bg ~/.config/wallpapers/bing.jpg fill

