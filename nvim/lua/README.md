# Lua Configuration

This directory contains core Lua configuration files used by Neovim.

---

## **File Overview**

### 📄 `vim-options.lua`

```bash 
This file defines base editor behavior, keybindings, and UI tweaks.  
It is loaded first from `init.lua` and sets foundational defaults before plugins initialize.
```
---
## **Configuration Breakdown**

### Basic Indentation

```lua
expandtab
tabstop = 2
softtabstop = 2
shiftwidth = 2
```

- Uses spaces instead of tabs
- Enforces consistent 2-space indentation

---

### Core Options

- `cmdheight = 0` — Minimal command-line height
- `equalalways = false` — Prevents automatic window resizing
- `fillchars.eob = " "` — Removes `~` from empty buffer lines

---

### Clipboard

```lua
vim.opt.clipboard = "unnamedplus"
```

- Uses system clipboard
- Enables copy/paste integration with macOS

---

### Leader Keys

```lua
vim.g.mapleader = " "
vim.g.maplocalleader = " "
```

- Sets `<Space>` as both global and local leader key

---

### Window Navigation

Custom keymaps for faster window movement:

- `<C-h>` → Left
- `<C-l>` → Right
- `<C-j>` → Down
- `<C-k>` → Up

---

### Integrated Terminal Toggle

`<leader>t`

- Opens a bottom split terminal (height: 12)
- Automatically enters insert mode
- If already inside a terminal buffer, it closes it
- `<Esc>` in terminal mode closes the terminal

---

### Floating Window Handling

Pressing `q`:

- Closes floating windows safely
- Does not interfere with macro recording

---

### Smart `<Esc>` Behavior

Enhanced escape logic:

1. Closes floating windows
2. Closes quickfix or location lists
3. Clears search highlighting

This creates a unified "dismiss UI elements" behavior under a single key.

---

> [!NOTE]
>
> This file contains only core Neovim behavior.
> Plugin-specific configuration is located in:
>
> - [`plugins/`](plugins/README.md) — modular plugin specifications and lazy-loading configuration.
