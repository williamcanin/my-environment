#!/usr/bin/env sh
# install.sh — my-environment installer via GitHub Releases
#
# Usage:
#   curl -fsSL https://williamcanin.github.io/my-environment/install.sh | sh
#   curl -fsSL https://williamcanin.github.io/my-environment/install.sh | sh -s -- 0.1.1
#   curl -fsSL https://williamcanin.github.io/my-environment/install.sh | sh -s -- --releases
#
# Important: when using "curl ... | sh", the script is sent to the shell's
# standard input. To pass arguments (version, flags), you need "sh -s -- ARGS".
# Alternatively, the version can also be set via the VERSION environment
# variable (e.g.: VERSION=0.1.1 curl ... | sh).

set -eu

# ===== Config =====
NAME="my-environment"
REPO="williamcanin/my-environment"
API="https://api.github.com/repos/${REPO}"
WORKDIR=""

# ===== Colors (with fallback when stdout is not a terminal) =====
if [ -t 1 ]; then
  C_BLUE=$(printf '\033[1;34m')
  C_GREEN=$(printf '\033[1;32m')
  C_RED=$(printf '\033[1;31m')
  C_YELLOW=$(printf '\033[1;33m')
  C_OFF=$(printf '\033[0m')
else
  C_BLUE="" ; C_GREEN="" ; C_RED="" ; C_YELLOW="" ; C_OFF=""
fi

info() { printf '%s[%s]%s %s\n' "$C_BLUE" "$NAME" "$C_OFF" "$1"; }
ok()   { printf '%s[%s]%s %s\n' "$C_GREEN" "$NAME" "$C_OFF" "$1"; }
warn() { printf '%s[%s]%s %s\n' "$C_YELLOW" "$NAME" "$C_OFF" "$1" >&2; }
die()  { printf '%s[%s]%s %s\n' "$C_RED" "$NAME" "$C_OFF" "$1" >&2; exit 1; }

cleanup() {
  [ -n "$WORKDIR" ] && [ -d "$WORKDIR" ] && rm -rf "$WORKDIR"
  return 0
}
trap cleanup EXIT INT TERM

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || die "Required command not found: $1"
}

usage() {
  cat <<EOF
${NAME} — installer via GitHub Releases

Usage:
  install.sh                  Install the latest release
  install.sh VERSION          Install a specific version (e.g.: 0.1.1 or v0.1.1)
  install.sh -l, --releases   List available releases
  install.sh -h, --help       Show this help

Examples (via curl | sh):
  curl -fsSL <url>/install.sh | sh
  curl -fsSL <url>/install.sh | sh -s -- 0.1.1
  curl -fsSL <url>/install.sh | sh -s -- --releases
  VERSION=0.1.1 curl -fsSL <url>/install.sh | sh
EOF
}

gh_get() {
  # GET with Accept/User-Agent headers. $1 = full URL.
  curl -fsSL -H "Accept: application/vnd.github+json" -H "User-Agent: ${NAME}-install-script" "$1"
}

extract_tags() {
  # Reads JSON from stdin and extracts every "tag_name" value.
  sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p'
}

list_releases() {
  info "Fetching releases for ${REPO}..."
  json=$(gh_get "${API}/releases") || die "Failed to query the GitHub API (rate limit or network issue)."
  tags=$(printf '%s\n' "$json" | extract_tags)
  [ -n "$tags" ] || die "No releases found."
  printf '%sAvailable releases:%s\n' "$C_GREEN" "$C_OFF"
  printf '%s\n' "$tags" | sed 's/^/  - /'
}

latest_tag() {
  json=$(gh_get "${API}/releases/latest") || die "Failed to fetch the latest release (rate limit, network issue, or no release published)."
  tag=$(printf '%s\n' "$json" | extract_tags | head -n1)
  [ -n "$tag" ] || die "Could not determine the latest version."
  printf '%s' "$tag"
}

tag_exists() {
  # $1 = candidate tag. Returns 0 if the release exists (HTTP 200).
  status=$(curl -sS -o /dev/null -w '%{http_code}' \
    -H "Accept: application/vnd.github+json" -H "User-Agent: ${NAME}-install-script" \
    "${API}/releases/tags/$1" 2>/dev/null) || status="000"
  [ "$status" = "200" ]
}

resolve_tag() {
  # $1 = version provided by the user (with or without the "v" prefix)
  want="$1"
  if tag_exists "$want"; then
    printf '%s' "$want"
    return 0
  fi
  case "$want" in
    v*) : ;;
    *)
      if tag_exists "v${want}"; then
        printf '%s' "v${want}"
        return 0
      fi
      ;;
  esac
  die "Version '$want' not found. Use --releases to list the available versions."
}

main() {
  need_cmd curl
  need_cmd unzip
  need_cmd make
  need_cmd sed
  need_cmd find
  need_cmd mktemp

  version_arg="${VERSION:-}"

  while [ $# -gt 0 ]; do
    case "$1" in
      -h|--help)
        usage
        exit 0
        ;;
      -l|--releases)
        list_releases
        exit 0
        ;;
      -*)
        die "Unknown option: $1 (use --help)"
        ;;
      *)
        version_arg="$1"
        ;;
    esac
    shift
  done

  if [ -n "$version_arg" ]; then
    info "Resolving requested version: ${version_arg}"
    tag=$(resolve_tag "$version_arg")
  else
    info "Fetching the latest available version..."
    tag=$(latest_tag)
  fi
  ok "Selected version: ${tag}"

  download_url="https://github.com/${REPO}/archive/refs/tags/${tag}.zip"

  WORKDIR=$(mktemp -d "/tmp/${NAME}.XXXXXX") || die "Could not create a temporary directory."
  zip_file="${WORKDIR}/${NAME}-${tag}.zip"

  info "Downloading ${download_url}..."
  curl -fsSL -o "$zip_file" "$download_url" || die "Failed to download the release archive."

  info "Extracting archive..."
  unzip -q "$zip_file" -d "$WORKDIR" || die "Failed to extract the .zip archive."

  extracted_dir=$(find "$WORKDIR" -mindepth 1 -maxdepth 1 -type d | head -n1)
  [ -n "$extracted_dir" ] && [ -d "$extracted_dir" ] || die "Could not locate the extracted folder."

  info "Running 'make install' in ${extracted_dir}..."
  (cd "$extracted_dir" && make install) || die "Failed to run 'make install'."

  ok "${NAME} installed successfully (version ${tag})."
}

main "$@"
