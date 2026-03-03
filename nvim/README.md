<h1 align="center">
  <img src="images/readme/neovim.ico" width="100" /> 
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/editor-Neovim-red" />
  <img src="https://img.shields.io/badge/plugin--manager-LazyVim-lightgreen" />
  <img src="https://img.shields.io/badge/platform-macOS-blue" />
</p>

## **Overview**

This directory contains my personal Neovim configuration.

- My editor of choice is Neovim.
- Configuration is written entirely in Lua.
- Plugin management is handled using **LazyVim**.
- This setup is designed primarily for macOS but works on Linux as well.

---

## **Preview**

<img src="images/nvim-dashboard.png" width="900" />

---

## **Directory Structure**

```bash
nvim/
├── init.lua
├── last_theme.txt
├── lazy-lock.json
└── lua/
    ├── vim-options.lua
    └── plugins/
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
## **Installation**

### Install Neovim

```bash
brew install neovim
```

Confirm installation:

```bash
nvim --version
```

---

## **Apply This Configuration**

I keep this configuration inside:

```
~/github/dotfiles/nvim
```

It is symlinked to:

```
~/.config/nvim
```

To apply:

```bash
mkdir -p ~/.config
ln -s ~/github/dotfiles/nvim ~/.config/nvim
```
On first launch, Lazy will automatically install all plugins.

If you ever need to manually synchronize plugins, run:

```vim
:Lazy sync
```

Useful commands:

```vim
:Lazy            " Open Lazy UI
:Lazy sync       " Install / update / clean plugins
:Lazy update     " Update plugins
:Lazy clean      " Remove unused plugins
:Lazy restore    " Restore plugins from lazy-lock.json
```

> [!IMPORTANT]
> After cloning this repository, always run `:Lazy sync` once to ensure all plugins are installed correctly.
---

## **File Overview**

> ### `init.lua`

Main Neovim bootstrap file.

This file is responsible for:

- Loading core editor options first (`vim-options.lua`)
- Bootstrapping `lazy.nvim` if it is not already installed
- Prepending Lazy to Neovim’s runtime path
- Registering and loading all plugins from `lua/plugins/`
- Enforcing background transparency across selected highlight groups
- Reapplying transparency automatically on every colorscheme change
- Suppressing specific plugin notifications (image-clip workaround)

It acts as the orchestration layer of the entire configuration.

---

> ### `last_theme.txt`

Stores the last applied colorscheme.

Used to persist theme state between Neovim sessions.

---

> ### `lazy-lock.json`

Auto-generated lockfile created by `lazy.nvim`.

- Pins plugin versions
- Ensures reproducible plugin installs
- Should not be manually edited

---

> ### `lua/`

Contains modular Lua configuration files.

For a detailed breakdown:

- [`vim-options.lua`](nvim/lua/README.md) — custom Vim options and keybindings  
- [`plugins/`](nvim/lua/plugins/README.md) — plugin configurations and lazy-loaded modules  


---

>[!NOTE]
>
> - Requires a Nerd Font for proper icon rendering.
> - Designed for use with my Ghostty + Starship + Tmux workflow.
> - This configuration evolves as I experiment with new tools.

---

This Neovim setup is part of my larger dotfiles ecosystem.  
For full environment configuration, refer to the root repository [README](https://github.com/io-PEAK/dotfiles/blob/main/README.md).
