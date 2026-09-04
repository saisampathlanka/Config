# Neovim Configuration

A minimal, fast, and modern Neovim configuration for full-stack development.

## Features

- **Fast & Lightweight**: Lazy-loaded plugins, no bloat
- **Transparent Background**: Matches your terminal
- **Smooth Navigation**: Relative numbers, smooth scroll, centered cursor
- **Split Management**: Easy split creation and navigation
- **Terminal Integration**: Floating terminal with `<leader>t` or `<C-\>`
- **LSP Support**: TypeScript, Python, Go, C++, Rust, SQL, and more
- **Auto-formatting**: Prettier, Ruff, GoFmt, ClangFormat, Stylua
- **Auto-completion**: nvim-cmp with LSP, snippets, buffer, path
- **Git Integration**: Gitsigns, LazyGit
- **File Explorer**: Neo-tree
- **Fuzzy Finder**: Telescope with fzf-native

## Keybindings

| Key | Action |
|-----|--------|
| `<leader>` | Space (leader key) |
| `<C-h/j/k/l>` | Navigate splits |
| `<leader>sv/sh` | Vertical/Horizontal split |
| `<leader>se/sx/so` | Equalize/Close/Only split |
| `<leader>e` | Toggle file tree |
| `<leader>ff/fg/fb` | Find files / Live grep / Buffers |
| `<leader>t` / `<C-\>` | Toggle terminal |
| `gd/gr/gi/gt` | Go to definition/references/implementation/type |
| `K` | Hover documentation |
| `<leader>ca/rn/f` | Code action / Rename / Format |
| `[d/]d` | Prev/Next diagnostic |
| `<leader>gg` | LazyGit |
| `<leader>nh` | Clear search highlights |

## Supported Languages

- **TypeScript/JavaScript**: ts_ls, eslint, prettier
- **Python**: pyright, ruff, black
- **Go**: gopls, gofumpt, goimports
- **C/C++**: clangd, clang-format
- **Rust**: rust-analyzer, rustfmt
- **SQL**: sqlls, sqlfluff (PostgreSQL dialect)
- **Lua**: lua_ls, stylua
- **Web**: html, cssls, tailwindcss, prismals
- **Config**: yaml, json, toml, dockerfile

## Installation

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repo
git clone https://github.com/yourusername/nvim-config ~/.config/nvim

# Start Neovim - plugins will auto-install
nvim
```

## Requirements

- Neovim >= 0.10
- Git
- Ripgrep (`rg`)
- fd-find (`fd` or `fdfind`)
- Node.js (for LSP servers)
- Python 3 (for Python LSP)
- Go (for Go LSP)
- CMake (for C++ LSP)
- Rust toolchain (for Rust LSP)

### Language Server Installation

Most LSP servers are auto-installed via Mason. Run `:Mason` to manage them manually.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua      # Vim options
│   │   ├── keymaps.lua      # Key mappings
│   │   └── autocmds.lua     # Auto commands
│   ├── plugins/
│   │   ├── core.lua         # Lazy.nvim
│   │   ├── ui.lua           # Colorscheme, statusline
│   │   ├── editor.lua       # Treesitter, Telescope, Neo-tree, Terminal
│   │   └── lsp.lua          # LSP, Completion, Formatting, Linting
│   └── snippets/            # LuaSnip snippets
└── lazy-lock.json           # Locked plugin versions
```

## Customization

- **Colorscheme**: Edit `lua/plugins/ui.lua` (catppuccin mocha)
- **Keybindings**: Edit `lua/config/keymaps.lua`
- **Plugins**: Add/remove files in `lua/plugins/`
- **Snippets**: Add files to `lua/snippets/`

## Commands

| Command | Description |
|---------|-------------|
| `:Lazy` | Plugin manager |
| `:Mason` | LSP manager |
| `:TSUpdate` | Update Treesitter parsers |
| `:ConformInfo` | Formatter info |
| `:checkhealth` | Health check |

## Performance

- Startup time: ~30-50ms (after first run)
- Lazy-loaded plugins
- Disabled unused built-in plugins
- Large file detection (>10MB)

## License

MIT