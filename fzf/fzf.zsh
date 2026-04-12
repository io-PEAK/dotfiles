# ============================================
# FZF Configuration — Multi-Theme
# ============================================

# ── Theme Definitions ──────────────────────

_fzf_theme_ember() {
  echo "--color=bg:-1,bg+:-1,gutter:#ff6b6b
  --color=fg:#e2d9f3,fg+:#ffffff,hl:#ff6b6b,hl+:#ffd93d
  --color=border:#ff6b6b,separator:#7a3520
  --color=spinner:#ffd93d,info:#b0a4c8,header:#ffd93d
  --color=pointer:#00ffb3,marker:#00ffb3,prompt:#ff9f43,scrollbar:#ff6b6b
  --color=label:#ff9f43,preview-label:#ffd93d,query:#ffffff"
}

_fzf_theme_sakura() {
  echo "--color=bg:-1,bg+:-1,gutter:#ff84a1
  --color=fg:#fde8ec,fg+:#ffffff,hl:#ff84a1,hl+:#ffcf77
  --color=border:#ff84a1,separator:#7a2535
  --color=spinner:#ffcf77,info:#e8b4be,header:#ffcf77
  --color=pointer:#ff84a1,marker:#ffd6e0,prompt:#ffafc5,scrollbar:#ff84a1
  --color=label:#ffafc5,preview-label:#ffcf77,query:#ffffff"
}

_fzf_theme_toxic() {
  echo "--color=bg:-1,bg+:-1,gutter:#39ff14
  --color=fg:#d4f5d4,fg+:#ffffff,hl:#39ff14,hl+:#fff44f
  --color=border:#39ff14,separator:#1a4d1a
  --color=spinner:#fff44f,info:#7ec87e,header:#fff44f
  --color=pointer:#fff44f,marker:#39ff14,prompt:#39ff14,scrollbar:#39ff14
  --color=label:#39ff14,preview-label:#fff44f,query:#ffffff"
}

_fzf_theme_ice() {
  echo "--color=bg:-1,bg+:-1,gutter:#00d4ff
  --color=fg:#cff4ff,fg+:#ffffff,hl:#00d4ff,hl+:#ffffff
  --color=border:#00d4ff,separator:#004d5c
  --color=spinner:#ffffff,info:#7fd8e8,header:#ffffff
  --color=pointer:#00d4ff,marker:#00ffea,prompt:#00d4ff,scrollbar:#00d4ff
  --color=label:#00d4ff,preview-label:#ffffff,query:#ffffff"
}

_fzf_theme_sunset() {
  echo "--color=bg:-1,bg+:-1,gutter:#ff4500
  --color=fg:#ffe8d6,fg+:#ffffff,hl:#ff4500,hl+:#ff00aa
  --color=border:#ff4500,separator:#7a1a00
  --color=spinner:#ff00aa,info:#e89070,header:#ff00aa
  --color=pointer:#ff00aa,marker:#ffd700,prompt:#ff6a00,scrollbar:#ff4500
  --color=label:#ff6a00,preview-label:#ff00aa,query:#ffffff"
}

_fzf_theme_mono() {
  echo "--color=bg:-1,bg+:-1,gutter:#aaaaaa
  --color=fg:#cccccc,fg+:#ffffff,hl:#ffffff,hl+:#aaaaaa
  --color=border:#888888,separator:#444444
  --color=spinner:#ffffff,info:#888888,header:#ffffff
  --color=pointer:#ffffff,marker:#aaaaaa,prompt:#cccccc,scrollbar:#888888
  --color=label:#aaaaaa,preview-label:#ffffff,query:#ffffff"
}

_fzf_theme_catppuccin() {
  echo "--color=bg:-1,bg+:-1,gutter:#313244
  --color=fg:#cdd6f4,fg+:#f5e0dc,hl:#89b4fa,hl+:#f9e2af
  --color=border:#6c7086,separator:#45475a
  --color=spinner:#f9e2af,info:#bac2de,header:#94e2d5
  --color=pointer:#f5bde6,marker:#a6e3a1,prompt:#cba6f7,scrollbar:#89b4fa
  --color=label:#cba6f7,preview-label:#94e2d5,query:#f5e0dc"
}

# ── Base Options (no color) ─────────────────

_FZF_BASE_OPTS="
  --multi
  --layout=reverse
  --height=88%
  --border=rounded
  --border-label=' ⟡  FUZZY FINDER  ⟡ '
  --border-label-pos=center
  --margin=1,2
  --padding=0,2

  --preview='~/.config/fzf/preview.sh {}'
  --preview-window=right:58%:wrap:border-left:hidden

  --info=right
  --separator='╌'
  --scrollbar='▏'

  --prompt='⌕  '
  --pointer='❯'
  --marker='◆'

  --header='  ↵ open   ALT-I images   ALT-M videos   ALT-A all   CTRL-/ preview   CTRL-Y copy path   SPC select   ESC quit  '
  --header-first

  --bind='enter:execute(~/.config/fzf/open_file.sh {+})'
  --bind='ctrl-/:toggle-preview'
  --bind='ctrl-u:preview-half-page-up'
  --bind='ctrl-d:preview-half-page-down'
  --bind='ctrl-f:preview-page-down'
  --bind='ctrl-b:preview-page-up'

  --bind='alt-i:reload(fd --type f --hidden --follow --exclude .git --extension jpg --extension jpeg --extension png --extension gif --extension webp --extension bmp --extension tiff --extension svg)+change-border-label( ⟡  IMAGES  ⟡ )'
  --bind='alt-m:reload(fd --type f --hidden --follow --exclude .git --extension mp4 --extension mov --extension mkv --extension webm --extension avi --extension m4v --extension flv --extension wmv)+change-border-label( ⟡  VIDEOS  ⟡ )'
  --bind='alt-a:reload(fd --type f --hidden --follow --exclude .git)+change-border-label( ⟡  ALL FILES  ⟡ )'

  --bind='tab:toggle+down'
  --bind='btab:toggle+up'
  --bind='space:toggle'
  --bind='ctrl-a:select-all'
  --bind='ctrl-x:deselect-all'
  --bind='shift-up:preview-up'
  --bind='shift-down:preview-down'
  --bind='esc:abort'
"

# ── Copy path bind (separate to avoid \n quoting issues in double-quoted string) ──
_FZF_COPY_BIND=$'--bind=\'ctrl-y:execute-silent(\n  printf "%s\\n" {+} | pbcopy\n  count=$(printf "%s\\n" {+} | wc -l | tr -d " ")\n  msg="  ✔  ${count} path(s) copied  "\n  { printf "\\033[s\\033[999;1H\\033[K\\033[1;38;2;0;255;179m${msg}\\033[0m" >/dev/tty\n    sleep 0.5\n    printf "\\033[999;1H\\033[K\\033[u" >/dev/tty\n  } &\n)+bell\''

# ── Apply Theme ─────────────────────────────

_fzf_apply_theme() {
  local theme="${1:-ember}"
  local colors

  case "$theme" in
    ember)      colors=$(_fzf_theme_ember)      ;;
    sakura)     colors=$(_fzf_theme_sakura)     ;;
    toxic)      colors=$(_fzf_theme_toxic)      ;;
    ice)        colors=$(_fzf_theme_ice)        ;;
    sunset)     colors=$(_fzf_theme_sunset)     ;;
    mono)       colors=$(_fzf_theme_mono)       ;;
    catppuccin) colors=$(_fzf_theme_catppuccin) ;;
    *)          colors=$(_fzf_theme_ember)      ;;
  esac

  export FZF_DEFAULT_OPTS="$_FZF_BASE_OPTS $_FZF_COPY_BIND $colors"
  export FZF_CURRENT_THEME="$theme"
}

# ── Theme Switcher (uses fzf itself!) ────────

fzf-theme() {
  local themes=(
    "ember"
    "sakura"
    "toxic"
    "ice"
    "sunset"
    "mono"
    "catppuccin"
  )

  # Inherit active theme colors for the picker itself
  local active_colors
  case "${FZF_CURRENT_THEME:-ember}" in
    ember)      active_colors="--color=bg:-1,bg+:-1,gutter:#ff6b6b,fg:#e2d9f3,fg+:#ffffff,hl:#ff6b6b,hl+:#ffd93d,border:#ff6b6b,pointer:#00ffb3,prompt:#ff9f43,header:#ffd93d,label:#ff9f43,marker:#00ffb3,spinner:#ffd93d,info:#b0a4c8,separator:#7a3520,scrollbar:#ff6b6b" ;;
    sakura)     active_colors="--color=bg:-1,bg+:-1,gutter:#ff84a1,fg:#fde8ec,fg+:#ffffff,hl:#ff84a1,hl+:#ffcf77,border:#ff84a1,pointer:#ff84a1,prompt:#ffafc5,header:#ffcf77,label:#ffafc5,marker:#ffd6e0,spinner:#ffcf77,info:#e8b4be,separator:#7a2535,scrollbar:#ff84a1" ;;
    toxic)      active_colors="--color=bg:-1,bg+:-1,gutter:#39ff14,fg:#d4f5d4,fg+:#ffffff,hl:#39ff14,hl+:#fff44f,border:#39ff14,pointer:#fff44f,prompt:#39ff14,header:#fff44f,label:#39ff14,marker:#39ff14,spinner:#fff44f,info:#7ec87e,separator:#1a4d1a,scrollbar:#39ff14" ;;
    ice)        active_colors="--color=bg:-1,bg+:-1,gutter:#00d4ff,fg:#cff4ff,fg+:#ffffff,hl:#00d4ff,hl+:#ffffff,border:#00d4ff,pointer:#00d4ff,prompt:#00d4ff,header:#ffffff,label:#00d4ff,marker:#00ffea,spinner:#ffffff,info:#7fd8e8,separator:#004d5c,scrollbar:#00d4ff" ;;
    sunset)     active_colors="--color=bg:-1,bg+:-1,gutter:#ff4500,fg:#ffe8d6,fg+:#ffffff,hl:#ff4500,hl+:#ff00aa,border:#ff4500,pointer:#ff00aa,prompt:#ff6a00,header:#ff00aa,label:#ff6a00,marker:#ffd700,spinner:#ff00aa,info:#e89070,separator:#7a1a00,scrollbar:#ff4500" ;;
    mono)       active_colors="--color=bg:-1,bg+:-1,gutter:#aaaaaa,fg:#cccccc,fg+:#ffffff,hl:#ffffff,hl+:#aaaaaa,border:#888888,pointer:#ffffff,prompt:#cccccc,header:#ffffff,label:#aaaaaa,marker:#aaaaaa,spinner:#ffffff,info:#888888,separator:#444444,scrollbar:#888888" ;;
    catppuccin) active_colors="--color=bg:-1,bg+:-1,gutter:#313244,fg:#cdd6f4,fg+:#f5e0dc,hl:#89b4fa,hl+:#f9e2af,border:#6c7086,pointer:#f5bde6,prompt:#cba6f7,header:#94e2d5,label:#cba6f7,marker:#a6e3a1,spinner:#f9e2af,info:#bac2de,separator:#45475a,scrollbar:#89b4fa" ;;
    *)          active_colors="--color=bg:-1,bg+:-1,gutter:#ff6b6b,fg:#e2d9f3,fg+:#ffffff,hl:#ff6b6b,hl+:#ffd93d,border:#ff6b6b,pointer:#00ffb3,prompt:#ff9f43,header:#ffd93d" ;;
  esac

  local chosen
  chosen=$(printf '%s\n' "${themes[@]}" | FZF_DEFAULT_OPTS="" fzf \
    --no-multi \
    --layout=reverse \
    --height=40% \
    --border=rounded \
    --border-label=' ⟡  THEMES  ⟡ ' \
    --border-label-pos=center \
    --margin=4,52 \
    --padding=0,1 \
    --prompt='⌕  ' \
    --pointer='❯' \
    --marker='◆' \
    --info=hidden \
    --header='  ↵ apply   ESC cancel  ' \
    --header-first \
    --bind='enter:accept' \
    --bind='esc:abort' \
    $active_colors \
    --preview='
      name=$(echo {} | cut -d"|" -f1 | tr -d " ")
      BAR="████████████"
      HALF="██████"
      case "$name" in
        ember)
          echo -e "\n  \033[38;2;255;107;107m${BAR}\033[0m  \033[38;2;255;211;61m${BAR}\033[0m"
          echo -e "  \033[38;2;0;255;179m${BAR}\033[0m  \033[38;2;255;159;67m${BAR}\033[0m"
          echo -e "\n  \033[38;2;255;107;107m▐ coral\033[0m    \033[38;2;255;211;61m▐ gold\033[0m"
          echo -e "  \033[38;2;0;255;179m▐ mint\033[0m     \033[38;2;255;159;67m▐ orange\033[0m"
          ;;
        sakura)
          echo -e "\n  \033[38;2;255;132;161m${BAR}\033[0m  \033[38;2;255;207;119m${BAR}\033[0m"
          echo -e "  \033[38;2;255;175;197m${BAR}\033[0m  \033[38;2;255;214;224m${BAR}\033[0m"
          echo -e "\n  \033[38;2;255;132;161m▐ rose\033[0m     \033[38;2;255;207;119m▐ gold\033[0m"
          echo -e "  \033[38;2;255;175;197m▐ blush\033[0m    \033[38;2;255;214;224m▐ petal\033[0m"
          ;;
        toxic)
          echo -e "\n  \033[38;2;57;255;20m${BAR}\033[0m  \033[38;2;255;244;79m${BAR}\033[0m"
          echo -e "  \033[38;2;150;255;100m${BAR}\033[0m  \033[38;2;200;255;150m${BAR}\033[0m"
          echo -e "\n  \033[38;2;57;255;20m▐ acid\033[0m     \033[38;2;255;244;79m▐ lime\033[0m"
          echo -e "  \033[38;2;150;255;100m▐ neon\033[0m     \033[38;2;200;255;150m▐ green\033[0m"
          ;;
        ice)
          echo -e "\n  \033[38;2;0;212;255m${BAR}\033[0m  \033[38;2;0;255;234m${BAR}\033[0m"
          echo -e "  \033[38;2;127;216;232m${BAR}\033[0m  \033[38;2;200;240;255m${BAR}\033[0m"
          echo -e "\n  \033[38;2;0;212;255m▐ cyan\033[0m     \033[38;2;0;255;234m▐ aqua\033[0m"
          echo -e "  \033[38;2;127;216;232m▐ mist\033[0m     \033[38;2;200;240;255m▐ frost\033[0m"
          ;;
        sunset)
          echo -e "\n  \033[38;2;255;69;0m${BAR}\033[0m  \033[38;2;255;0;170m${BAR}\033[0m"
          echo -e "  \033[38;2;255;215;0m${BAR}\033[0m  \033[38;2;255;106;0m${BAR}\033[0m"
          echo -e "\n  \033[38;2;255;69;0m▐ orange\033[0m   \033[38;2;255;0;170m▐ magenta\033[0m"
          echo -e "  \033[38;2;255;215;0m▐ gold\033[0m     \033[38;2;255;106;0m▐ ember\033[0m"
          ;;
        mono)
          echo -e "\n  \033[38;2;255;255;255m${BAR}\033[0m  \033[38;2;204;204;204m${BAR}\033[0m"
          echo -e "  \033[38;2;170;170;170m${BAR}\033[0m  \033[38;2;100;100;100m${BAR}\033[0m"
          echo -e "\n  \033[38;2;255;255;255m▐ white\033[0m    \033[38;2;204;204;204m▐ silver\033[0m"
          echo -e "  \033[38;2;170;170;170m▐ grey\033[0m     \033[38;2;100;100;100m▐ dim\033[0m"
          ;;
        catppuccin)
          echo -e "\n  \033[38;2;137;180;250m${BAR}\033[0m  \033[38;2;245;194;231m${BAR}\033[0m"
          echo -e "  \033[38;2;148;226;213m${BAR}\033[0m  \033[38;2;203;166;247m${BAR}\033[0m"
          echo -e "\n  \033[38;2;137;180;250m▐ blue\033[0m     \033[38;2;245;194;231m▐ pink\033[0m"
          echo -e "  \033[38;2;148;226;213m▐ teal\033[0m     \033[38;2;203;166;247m▐ lavender\033[0m"
          ;;
      esac
    ' \
    --preview-window=hidden)

  [[ -z "$chosen" ]] && return

  local theme_name
  theme_name=$(echo "$chosen" | cut -d'│' -f1 | tr -d ' ')

  _fzf_apply_theme "$theme_name"

  mkdir -p ~/.config/fzf
  echo "$theme_name" > ~/.config/fzf/theme

  # Open fzf in the config folder right after applying a theme.
  (
    cd ~/.config/fzf || exit
    command fzf \
      --border-label=' ⟡  FZF CONFIG  ⟡ ' \
      --border-label-pos=center \
      --prompt='fzf/ ' \
      --preview='~/.config/fzf/preview.sh {}' \
      --preview-window=right:58%:wrap:border-left
  )
}

# ── Boot: load saved theme or default ───────

_fzf_boot_theme() {
  local saved="ember"
  [[ -f ~/.config/fzf/theme ]] && saved=$(cat ~/.config/fzf/theme)
  _fzf_apply_theme "$saved"
}
_fzf_boot_theme

# ── Remaining exports ────────────────────────

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_CTRL_T_OPTS="
  --border-label=' ⟡  FILES  ⟡ '
  --border-label-pos=center
  --preview='~/.config/fzf/preview.sh {}'
  --preview-window=right:58%:wrap:border-left
"

export FZF_CTRL_R_OPTS="
  --border-label=' ⟡  HISTORY  ⟡ '
  --border-label-pos=center
  --preview='echo {}'
  --preview-window=down:4:wrap:border-top
  --bind='ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --header='  CTRL-Y copy to clipboard  '
"

export FZF_ALT_C_OPTS="
  --border-label=' ⟡  DIRECTORIES  ⟡ '
  --border-label-pos=center
  --preview='eza --tree --level=2 --color=always --icons {} | head -200'
  --preview-window=right:58%:wrap:border-left
"

fzf_with_preview() {
  fzf "$@"
  printf '\033_Ga=d,d=A\033\\' >/dev/tty 2>/dev/null
  kitten icat --clear --stdin=no --silent 2>/dev/null
}

alias fzfp='fzf_with_preview --preview "~/.config/fzf/preview.sh {}"'
alias fzfd='fd --type d --hidden --follow --exclude .git | fzf_with_preview --border-label=" ⟡  DIRECTORIES  ⟡ " --preview "eza --tree --level=2 --color=always --icons {} | head -200"'
alias fzfg='echo "" | fzf_with_preview --disabled --ansi \
  --border-label=" ⟡  GREP  ⟡ " \
  --bind "change:reload: rg --line-number --no-heading --color=always --smart-case --hidden --follow --glob \"!.git/*\" --glob \"!node_modules/*\" --glob \"!Library/*\" {q} || true" \
  --delimiter ":" \
  --preview "bat --color=always --style=numbers,changes --highlight-line {2} {1} 2>/dev/null" \
  --preview-window "right:58%:wrap:border-left:+{2}-5" \
  --prompt "⌕  Search  " \
  --bind "ctrl-y:execute-silent(echo {} | pbcopy)"'