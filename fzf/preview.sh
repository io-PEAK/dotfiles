#!/usr/bin/env bash
set -u

file="${1:-}"
[[ -z "$file" ]] && exit 0
[[ ! -e "$file" ]] && exit 0

# Always clear graphics remnants (both terminals)
printf '\033_Ga=d,d=A\033\\' 2>/dev/null

if [[ -d "$file" ]]; then
  if command -v eza >/dev/null 2>&1; then
    eza --tree --level=2 --color=always "$file" | head -200
  else
    ls -la "$file" | head -200
  fi
  exit 0
fi

if file -b --mime-type "$file" 2>/dev/null | grep -q '^image/'; then
  echo "Image: $file"
  file "$file"
  echo ""
  echo "Press ENTER to open image viewer"
  exit 0
fi

bat --color=always --style=numbers "$file" 2>/dev/null || cat "$file"