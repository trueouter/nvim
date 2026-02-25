# Neovim Config

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
| `<leader>sd` | Search diagnostics |
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
| `<leader>q` | Diagnostics quickfix list |

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
