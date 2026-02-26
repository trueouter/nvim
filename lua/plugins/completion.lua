return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',   -- LSP completions
      'hrsh7th/cmp-buffer',      -- words from current buffer
      'hrsh7th/cmp-path',        -- filesystem paths
      'onsails/lspkind-nvim',    -- icons in completion menu
    },
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),       -- manually trigger
          ['<Tab>']     = cmp.mapping.select_next_item(),
          ['<S-Tab>']   = cmp.mapping.select_prev_item(),
          ['<CR>']      = cmp.mapping.confirm({ select = false }), -- confirm only if explicitly selected
          ['<C-e>']     = cmp.mapping.abort(),
          ['<C-d>']     = cmp.mapping.scroll_docs(4),
          ['<C-u>']     = cmp.mapping.scroll_docs(-4),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
          }),
        },
        experimental = {
          ghost_text = true,  -- shows preview of first completion inline
        },
      })
    end,
  }
}
