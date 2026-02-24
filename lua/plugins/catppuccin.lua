return { 
  "catppuccin/nvim", 
   nvimname = "catppuccin", 
   priority = 1000,
   lazy = false,
   config = function()
     vim.cmd.colorscheme "catppuccin"
     require('catppuccin').setup({
       flavour = "auto",
       background = {
         light = 'latte',
         dark = 'mocha'
       }})
   end
 }
