return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup({
				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry", -- needed for roslyn
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "hls", "html", "cssls", "ts_ls" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			-- advertise nvim-cmp capabilities to LSP servers
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config["hls"] = {
				cmd = { "haskell-language-server-wrapper", "lsp" },
				filetypes = { "haskell", "lhaskell" },
				root_markers = { "*.cabal", "cabal.project", "stack.yaml", "hie.yaml", ".git" },
				capabilities = capabilities,
			}

			vim.lsp.config["lua_ls"] = {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
					},
				},
			}

			vim.lsp.enable("lua_ls")
			vim.lsp.enable("hls")

			-- LSP action keymaps (non-Telescope) — attached per buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
				callback = function(event)
					local buf = event.buf
					vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = buf, desc = "[R]e[n]ame" })
					vim.keymap.set(
						{ "n", "v" },
						"gra",
						vim.lsp.buf.code_action,
						{ buffer = buf, desc = "Code [A]ction" }
					)
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, { buffer = buf, desc = "Next [D]iagnostic" })
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, { buffer = buf, desc = "Prev [D]iagnostic" })
					vim.keymap.set(
						"n",
						"<leader>q",
						vim.diagnostic.setloclist,
						{ buffer = buf, desc = "Diagnostic [Q]uickfix list" }
					)
					vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = buf, desc = "Diagnostic float" })
					vim.keymap.set(
						"n",
						"<leader>d",
						"<cmd>Telescope diagnostics bufnr=0<cr>",
						{ buffer = buf, desc = "Buffer [D]iagnostics" }
					)
					vim.keymap.set(
						"n",
						"<leader>D",
						"<cmd>Telescope diagnostics<cr>",
						{ buffer = buf, desc = "Workspace [D]iagnostics" }
					)
				end,
			})
		end,
	},
	{
		"seblyng/roslyn.nvim",
		ft = { "cs", "razor" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		init = function()
			-- Register razor/cshtml filetypes before the plugin loads
			vim.filetype.add({
				extension = {
					razor = "razor",
					cshtml = "razor",
				},
			})

			-- Configure Roslyn LSP settings
			vim.lsp.config("roslyn", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = {
					["csharp|background_analysis"] = {
						dotnet_analyzer_diagnostics_scope = "fullSolution",
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			})
		end,
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {},
	},
}
