#!/usr/bin/env sh

# shellcheck disable=SC1091
# DEPRECATED: Sourcing base.sh directly is deprecated.
# Prefer: . "${HOME}/.config/my-hyprland/sh/bootstrap.sh"
. "$HOME/.config/my-hyprland/sh/bootstrap.sh"

mkdir -p "$HYPR_CACHE_DIR"
