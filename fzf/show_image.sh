#!/usr/bin/env bash
set -u

file="${1:-}"
[[ -z "$file" || ! -f "$file" ]] && exit 0
file -b --mime-type "$file" 2>/dev/null | grep -q '^image/' || exit 0

viewer='
clear
kitten icat --stdin=no --transfer-mode=memory --align=center --scale-up --silent "'"$file"'"
echo
echo "[q] close"
while IFS= read -rsn1 k; do
  [[ "$k" == "q" ]] && break
done
clear
'

if command -v ghostty >/dev/null 2>&1; then
  ghostty -e sh -lc "$viewer"
  exit 0
fi

if [[ -n "${KITTY_WINDOW_ID:-}" || "${TERM:-}" == "xterm-kitty" ]]; then
  kitten @ launch --type=window sh -lc "$viewer"
  exit 0
fi

exit 0