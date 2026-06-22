#!/usr/bin/env sh

# shellcheck disable=SC1091
# DEPRECATED: Sourcing base.sh directly is deprecated.
# Prefer: . "${HOME}/.config/.my-environment-bootstrap"
. "$HOME/.config/.my-environment-bootstrap"

mkdir -p "$HYPR_CACHE_DIR"
