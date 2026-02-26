return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.config').setup({
      ensure_installed = { 'c_sharp', 'bash', 'c', 'css', 'diff', 'haskell', 'html', 'java', 'javascript', 'jsdoc', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'razor', 'tsx', 'typescript', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = { enable = true },
    })
  end
}

