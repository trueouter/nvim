return {
  {
    "mason-org/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "hls" },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      -- advertise nvim-cmp capabilities to LSP servers
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config['hls'] = {
        cmd = { 'haskell-language-server-wrapper', 'lsp' },
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
        root_markers = { '*.cabal', 'cabal.project', 'stack.yaml', 'hie.yaml', '.git' },
        capabilities = capabilities,
      }

      vim.lsp.config['lua_ls'] = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' }
          }
        }
      }

      vim.lsp.enable 'lua_ls'
      vim.lsp.enable 'hls'

      -- LSP action keymaps (non-Telescope) — attached per buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-keymaps', { clear = true }),
        callback = function(event)
          local buf = event.buf
          vim.keymap.set('n', 'grn', vim.lsp.buf.rename,       { buffer = buf, desc = '[R]e[n]ame' })
          vim.keymap.set({ 'n', 'v' }, 'gra', vim.lsp.buf.code_action, { buffer = buf, desc = 'Code [A]ction' })
          vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 })  end, { buffer = buf, desc = 'Next [D]iagnostic' })
          vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, { buffer = buf, desc = 'Prev [D]iagnostic' })
          vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { buffer = buf, desc = 'Diagnostic [Q]uickfix list' })
        end,
      })
    end
  }
}
