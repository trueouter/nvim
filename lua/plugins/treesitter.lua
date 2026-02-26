return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- Change 'configs' to 'config'
    require('nvim-treesitter.config').setup({
      ensure_installed = { 'bash', 'c', 'diff', 'haskell', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      highlight = { enable = true },
    })
  end
}

