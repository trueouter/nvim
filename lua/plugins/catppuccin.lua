return { 
  "catppuccin/nvim",
   name = "catppuccin",
   priority = 1000,
   lazy = false,
   config = function()
     require('catppuccin').setup({
       flavour = "auto", -- Hardcode to light
       background = {
         light = 'latte',
         dark = 'mocha',
       },
     })
     vim.cmd.colorscheme "catppuccin"
   end
 }
