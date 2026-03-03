# Plugin Configuration

This folder contains all Neovim plugin setup files.

Each `.lua` file configures a specific plugin or feature.  
All files inside this directory are automatically loaded by `lazy.nvim`.

This is done from `init.lua` using:

```lua
require("lazy").setup("plugins")
```

---

## **Directory Structure**

```bash
plugins/
├── autocompletion.lua
├── color-scheme.lua
├── cord.lua
├── debugger.lua
├── fzf-lua.lua
├── image.lua
├── img-clip.lua
├── lsp-config.lua
├── lualine.lua
├── neo-tree.lua
├── none-ls.lua
├── snacks.lua
├── telescope.lua
└── treesitter.lua
```

---

## **File Overview**

### 📄 `autocompletion.lua`
```bash
Sets up autocompletion engine and completion sources.
```

### 📄 `color-scheme.lua`
```bash
Configures colorscheme and theme behavior.
```

### 📄 `cord.lua`
```bash
Discord Rich Presence integration for Neovim.
```

### 📄 `debugger.lua`
```bash
Debug Adapter Protocol (DAP) configuration.
```

### 📄 `fzf-lua.lua`
```bash
Fuzzy finder setup using fzf-lua.
```

### 📄 `image.lua`
```bash
Enables image rendering inside Neovim.
```

### 📄 `img-clip.lua`
```bash
Allows pasting images directly from the clipboard.
```

### 📄 `lsp-config.lua`
```bash
Language Server Protocol setup and configuration.
```

### 📄 `lualine.lua`
```bash
Statusline configuration.
```

### 📄 `neo-tree.lua`
```bash
File explorer setup and customization.
```

### 📄 `none-ls.lua`
```bash
Formatter and linter integration using none-ls.
```

### 📄 `snacks.lua`
```bash
UI utilities and notification enhancements.
```

### 📄 `telescope.lua`
```bash
Fuzzy finder setup using Telescope.
```

### 📄`treesitter.lua`
```bash
Syntax highlighting and parsing configuration.
```

---

## **Managing Plugins**

This setup uses `lazy.nvim`.

On first launch, plugins install automatically.

If needed, you can manually manage plugins using:

```vim
:Lazy            " Open Lazy UI
:Lazy sync       " Install / update / clean plugins
:Lazy update     " Update plugins
:Lazy restore    " Restore from lazy-lock.json
```

After cloning the repository, run:

```vim
:Lazy sync
```
