#!/usr/bin/env sh

# Toggle GTK dark/light mode
current="$(gsettings get org.gnome.desktop.interface color-scheme)"

if [ "$current" = "'prefer-dark'" ]; then
  gsettings set org.gnome.desktop.interface color-scheme prefer-light
  gsettings set org.gnome.desktop.interface gtk-theme Adwaita
  MODE="light"
else
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
  MODE="dark"
fi

# Read current theme
THEME="$(cat "$HOME/.config/my-environment/.active-theme" 2>/dev/null || echo "hyprashen")"

# ==============================================================================
# WAYBAR — mode.css
# ==============================================================================
MODE_CSS="$HOME/.config/waybar/mode.css"
mkdir -p "$(dirname "$MODE_CSS")"

if [ "$MODE" = "light" ] && [ "$THEME" = "hyprashen" ]; then
  cat > "$MODE_CSS" << 'CSSEOF'
/* mode.css — Light mode overrides for hyprashen */
@define-color th-foreground      #181818;
@define-color th-foreground2     #181818;
@define-color th-decorate        #999999;
@define-color th-decorate-rgba   rgba(153, 153, 153, 0.45);
@define-color th-hover           #181818;
@define-color th-background      #cccccc;
@define-color th-background-rgba rgba(204, 204, 204, 1);
@define-color th-right1-bg       #b0b0b0;
@define-color th-right02-bg      #bfbfbf;
@define-color th-border-rights   rgba(153, 153, 153, 0.5);
@define-color th-window-fg       #181818;
@define-color th-danger          #181818;
@define-color th-warn            #181818;
@define-color th-ok              #cccccc;
@define-color th-recording       #181818;
@define-color th-recording-pause #cccccc;
@define-color th-power           #181818;
@define-color th-mpris-bg        #bfbfbf;
@define-color th-mpris-border    rgba(153, 153, 153, 0.5);
@define-color th-mpris-fg-anim   #181818;
CSSEOF
else
  printf '/* mode.css — Dark mode (no overrides) */\n' > "$MODE_CSS"
fi

# Restart waybar
sh "$HOME/.config/hypr/scripts/init.sh" --waybars

# ==============================================================================
# WALLPAPER
# ==============================================================================
if [ "$MODE" = "light" ] && [ "$THEME" = "hyprashen" ]; then
  SOLID="$HOME/.config/hypr/wallpapers/hyprashen-light.png"
  if [ ! -f "$SOLID" ]; then
    if command -v magick >/dev/null 2>&1; then
      magick -size 1920x1080 xc:'#386775' "$SOLID" 2>/dev/null || true
    elif command -v convert >/dev/null 2>&1; then
      convert -size 1920x1080 xc:'#386775' "$SOLID" 2>/dev/null || true
    fi
  fi
  if [ -f "$SOLID" ]; then
    hyprctl hyprpaper preload "$SOLID" 2>/dev/null || true
    hyprctl hyprpaper wallpaper ",$SOLID" 2>/dev/null || true
    # Update hyprpaper.conf so the wallpaper persists after restart
    sed -i "s|^[[:space:]]*path[[:space:]]*=.*$|  path =  ${SOLID}|" \
      "$HOME/.config/hypr/hyprpaper.conf" 2>/dev/null || true
  fi
else
  # Restore theme wallpaper
  HYPRPAPER_DIR="$HOME/.config/hypr/wallpapers"
  HYPR_THEMES="$HOME/.config/hypr/themes"
  for _ext in jpeg jpg png webp; do
    _wall="${HYPR_THEMES}/${THEME}/wallpaper.${_ext}"
    if [ ! -f "$_wall" ]; then
      _wall="${HYPRPAPER_DIR}/${THEME}.${_ext}"
    fi
    if [ -f "$_wall" ]; then
      hyprctl hyprpaper preload "$_wall" 2>/dev/null || true
      hyprctl hyprpaper wallpaper ",$_wall" 2>/dev/null || true
      _config_path=$(echo "$_wall" | sed "s|^$HOME|~|")
      sed -i "s|^[[:space:]]*path[[:space:]]*=.*$|  path =  ${_config_path}|" \
        "$HOME/.config/hypr/hyprpaper.conf" 2>/dev/null || true
      break
    fi
  done
fi

# ==============================================================================
# QUICKSHELL — .gtk-mode flag
# ==============================================================================
GTK_MODE_FILE="$HOME/.config/my-environment/.gtk-mode"
mkdir -p "$(dirname "$GTK_MODE_FILE")"
printf '%s\n' "$MODE" > "$GTK_MODE_FILE"
