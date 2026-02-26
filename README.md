# Neovim Config

## Prerequisites

### System Tools

These must be installed **before** launching Neovim:

| Tool | Why | Install (macOS) |
|------|-----|-----------------|
| `git` | Plugin manager bootstrap | `brew install git` |
| `make` | Build `telescope-fzf-native` | Xcode CLT / `brew install make` |
| `ripgrep` | Telescope live-grep | `brew install ripgrep` |
| `.NET SDK` | Roslyn LSP (C# / Razor) | `brew install dotnet` |
| GHCup (`ghcup`, `cabal`) | HLS + cabal REPL | [ghcup.haskell.org](https://www.haskell.org/ghcup/) |
| JDK 17+ | Java (jdtls) | `brew install openjdk` |
| Node.js / npm | Mason-installed JS/HTML/CSS servers | `brew install node` |

### LSP Servers (Mason)

Installed **automatically** by mason-lspconfig on first launch:

`lua_ls` · `hls` · `html` · `cssls` · `ts_ls`

Install **manually** via `:MasonInstall`:

```
:MasonInstall roslyn
:MasonInstall jdtls
```

> `roslyn` comes from the [Crashdummyy/mason-registry](https://github.com/Crashdummyy/mason-registry), which is already configured.

### Formatters (Mason)

Used by conform.nvim — install via `:MasonInstall`:

```
:MasonInstall stylua csharpier prettier
```

| Formatter | Languages |
|-----------|-----------|
| `stylua` | Lua |
| `csharpier` | C# |
| `prettier` | HTML, CSS, JS, TS, JSX, TSX |

## Keymaps

Leader key: `Space`

### Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move focus between windows |
| `<leader><leader>` | List open buffers |
| `<leader>/` | Fuzzy search in current buffer |

### Search (Telescope)

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sw` | Grep word under cursor |
| `<leader>sd` | Search diagnostics (all buffers) |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>s/` | Live grep in open files |
| `<leader>sn` | Find files in nvim config |

### LSP — Navigation

| Key | Action |
|-----|--------|
| `grd` | Go to definition (`<C-t>` to jump back) |
| `grr` | References |
| `gri` | Implementation |
| `grt` | Type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |

### LSP — Actions

| Key | Action |
|-----|--------|
| `grn` | Rename symbol |
| `gra` | Code action |
| `]d` / `[d` | Next / previous diagnostic |
| `gl` | Diagnostic float (message under cursor) |
| `<leader>q` | Diagnostics → location list (current buffer) |
| `<leader>d` | Diagnostics → Telescope picker (current buffer) |
| `<leader>D` | Diagnostics → Telescope picker (workspace) |

### Completion (insert mode)

| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion |
| `<Tab>` / `<S-Tab>` | Next / previous item |
| `<CR>` | Confirm selection |
| `<C-e>` | Dismiss menu |
| `<C-d>` / `<C-u>` | Scroll docs |

### Other

| Key | Action |
|-----|--------|
| `<leader>rr` | Run cabal v2-repl in terminal split |
| `<leader>n` | Toggle file tree (Neo-tree) |
| `<leader>?` | Show buffer-local keymaps (which-key) |
| `<Esc><Esc>` | Exit terminal mode |
