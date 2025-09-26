# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal Neovim configuration built with Lazy.nvim as the plugin manager. The configuration is modular, with each plugin configured in separate files under `lua/jknafou/lazy/`.

## Architecture

The configuration follows a modular structure:

- `init.lua` - Entry point, loads `require("jknafou")`
- `lua/jknafou/init.lua` - Core initialization, loads settings, remaps, and lazy plugin manager
- `lua/jknafou/set.lua` - Vim options and editor settings
- `lua/jknafou/remap.lua` - Global keymaps and leader key configuration (space as leader)
- `lua/jknafou/lazy_init.lua` - Lazy.nvim setup and configuration
- `lua/jknafou/lazy/` - Individual plugin configurations

### Plugin Management

- Uses Lazy.nvim for plugin management
- Plugin lock file: `lazy-lock.json` (committed to track exact versions)
- Each plugin has its own configuration file in `lua/jknafou/lazy/`
- Main plugin spec in `lua/jknafou/lazy/init.lua`

### Key Components

**LSP Configuration (`lua/jknafou/lazy/lsp.lua`)**:
- Mason for LSP server management
- Supports: Lua, Rust, Go, Python (Pyright/Pylsp), LaTeX (Texlab), Zig
- Python setup includes Rye project support with src/ directory detection
- Ruff for Python formatting with auto-format on save
- nvim-cmp for autocompletion with LSP integration

**Navigation**:
- Telescope for fuzzy finding (`lua/jknafou/lazy/telescope.lua`)
- Harpoon2 for quick file switching (`lua/jknafou/lazy/harpoon.lua`)
- Oil for file browsing (replaces netrw)
- Tmux navigation integration (`lua/jknafou/lazy/nvim-tmux-navigator.lua`)

**Clipboard Integration**:
- Tmux clipboard sharing (`lua/jknafou/lazy/tmux-clipboard.lua`)
- Seamless copy/paste between tmux panes and Neovim
- Uses vim-tmux-clipboard plugin and tmux-yank

**Testing**:
- vim-test with vimux strategy for running tests
- Plenary for Lua testing (keymap: `<leader>tf` for test file)

## Common Commands

### Plugin Management
- `:Lazy` - Open Lazy.nvim interface
- `:Lazy sync` - Update/install plugins
- `:Lazy clean` - Remove unused plugins

### LSP
- `:Mason` - Open Mason LSP installer
- `:LspRestart` - Restart LSP servers
- Format: `<leader>f` - Format current buffer using conform.nvim

### Testing
- `<leader>tt` - Run nearest test
- `<leader>tf` - Run tests in current file
- `<leader>tl` - Run last test
- `<leader>ts` - Run test suite
- `<leader>tv` - Visit last test result

### Key Navigation Patterns
- Leader key: `<space>`
- File finding: `<leader>pf` (all files), `<C-p>` (git files)
- Grep: `<leader>ps` (search), `<leader>pws` (word under cursor)
- Harpoon: `<leader>a` (add), `<C-e>` (toggle menu), `<leader>1-5` (jump to file)
- File browser: `<leader>pv` (oil), `<leader>-` (parent directory)

### Tmux Clipboard Integration
- `<leader>ty` - Copy selection to both tmux buffer and system clipboard
- `<leader>tp` - Paste from tmux buffer
- `<leader>tb` - Show current tmux buffer content
- In tmux: `[` enters copy mode, `]` pastes from buffer
- In tmux copy mode: `v` start selection, `y` copy and exit

## Development Notes

- Uses tabs for indentation (not spaces) - see `set.lua`
- Dynamic scrolloff based on window height
- Auto-removes trailing whitespace on save
- Terminal integration with split terminal (`<leader>st`)
- LSP keybindings are set up in autocmd on LSP attach
- Supports tmux integration with window navigation
- GitHub Copilot integrated with completion system