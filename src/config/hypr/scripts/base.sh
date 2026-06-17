#!/usr/bin/env sh

# shellcheck disable=SC1091
# DEPRECATED: Sourcing base.sh directly is deprecated.
# Prefer: . "${HOME}/.config/.environment-bootstrap"
. "$HOME/.config/.environment-bootstrap"

mkdir -p "$HYPR_CACHE_DIR"
