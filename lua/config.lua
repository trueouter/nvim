-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "catppuccin" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Register Razor filetypes early so roslyn.nvim's ft trigger works
vim.filetype.add({
	extension = {
		razor = "razor",
		cshtml = "razor",
	},
})

-- Open neo-tree automatically when nvim is launched with a directory
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		local arg = vim.fn.argv(0)
		if arg and arg ~= "" and vim.fn.isdirectory(arg) == 1 then
			vim.cmd("Neotree show dir=" .. vim.fn.fnameescape(vim.fn.fnamemodify(arg, ":p")))
		end
	end,
})

-- terminal keymaps
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set(
	"n",
	"<leader>rr",
	":split | resize 15 | terminal cabal v2-repl<CR>i",
	{ desc = "Run cabal REPL in split" }
)

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = "Increase width" })
vim.keymap.set("n", "<C-Left>", "<C-w>+", { desc = "Increase height" })
--vim.keymap.set("n", "<C-Left>", "<C-w><", { desc = "Decrease width" })
--vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase height" })
--vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease height" })
