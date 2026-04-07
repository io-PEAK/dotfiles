#!/usr/bin/env bash
set -u

file="${1:-}"
[[ -z "$file" || ! -e "$file" ]] && exit 0

mime="$(file -b --mime-type "$file" 2>/dev/null || true)"
ext="${file##*.}"
ext="$(printf '%s' "$ext" | tr '[:upper:]' '[:lower:]')"

pick_one() {
  local label="$1"; shift
  local out key raw clean

  out="$(FZF_DEFAULT_OPTS="" printf '%s\n' "$@" | fzf \
    --ansi \
    --no-multi \
    --marker='' \
    --pointer='' \
    --cycle \
    --height=40% \
    --layout=reverse \
    --border=rounded \
    --border-label="$label" \
    --prompt='   ' \
    --info=right \
    --color='fg:#cdd6f4,fg+:#ffffff,hl:#89b4fa,hl+:#b4befe,pointer:#f38ba8' \
    --header='  ↵ open   ESC cancel  ' \
    --header-first \
    --expect=enter,esc)"

  key="$(printf '%s\n' "$out" | sed -n '1p')"
  raw="$(printf '%s\n' "$out" | sed -n '2p')"

  [[ "$key" == "esc" || -z "$raw" ]] && return 1
  printf '%s' "$raw"
  return 0
}

# SVG -> open in external app
if [[ "$ext" == "svg" || "$mime" == "image/svg+xml" ]]; then
  open "$file"
  exit 0
fi

# Image -> image viewer
if [[ "$mime" == image/* ]]; then
  ~/.config/fzf/show_image.sh "$file"
  exit 0
fi

# Video -> picker (IINA / VLC)
if [[ "$mime" == video/* ]]; then
  vchoices=()
  [[ -d "/Applications/IINA.app" ]] && vchoices+=("IINA")
  [[ -d "/Applications/VLC.app" ]] && vchoices+=("VLC")
  [[ ${#vchoices[@]} -eq 0 ]] && { open "$file"; exit 0; }

vchoice="$(pick_one $' \033[1;38;5;111m✦\033[0m  \033[1;38;5;189mOPEN VIDEO WITH\033[0m  \033[1;38;5;111m✦\033[0m ' "${vchoices[@]}")" || exit 0

  case "$vchoice" in
    IINA) open -a "IINA" "$file" ;;
    VLC) open -a "VLC" "$file" ;;
    *) open "$file" ;;
  esac
  exit 0
fi

# IDE picker (text/other)
choices=()
command -v nvim >/dev/null 2>&1 && choices+=("nvim")
command -v code >/dev/null 2>&1 && choices+=("vscode")
command -v nano >/dev/null 2>&1 && choices+=("nano")
[[ -d "/System/Library/CoreServices/Finder.app" ]] && choices+=("finder")
[[ ${#choices[@]} -eq 0 ]] && exit 0

choice="$(pick_one $' \033[1;38;5;111m✦\033[0m  \033[1;38;5;189mOPEN WITH\033[0m  \033[1;38;5;111m✦\033[0m ' "${choices[@]}")" || exit 0

case "$choice" in
  nvim) exec nvim "$file" ;;
  vscode) code -g "$file" >/dev/null 2>&1 & disown ;;
  nano) exec nano "$file" ;;
  finder) open -R "$file" >/dev/null 2>&1 & disown ;;
esac