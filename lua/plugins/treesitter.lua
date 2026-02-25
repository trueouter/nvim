return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local filetypes = { 'bash', 'c', 'diff', 'haskell', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() pcall(vim.treesitter.start) end,
    })
  end
}

