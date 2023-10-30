return {
	options = {
		g = {
			python3_host_prog = "/usr/bin/python3",
		},
	},
	plugins = {
		{
			"nvim-treesitter/nvim-treesitter",
			opts = {
				ensure_installed = {
					"bash",
					"css",
					"dockerfile",
					"go",
					"html",
					"java",
					"javascript",
					"json",
					"kotlin",
					"lua",
					"nix",
					"ocaml",
					"ocaml_interface",
					"prisma",
					"python",
					"regex",
					"rust",
					"scala",
					"scss",
					"sql",
					"svelte",
					"toml",
					"tsx",
					"typescript",
					"yaml",
				},
			},
		},
		-- Colorschemes
		{ "catppuccin/nvim", name = "catppuccin" },
		{ "sainnhe/everforest" },
		{ "EdenEast/nightfox.nvim" },
		{ "Mofiqul/vscode.nvim" },
		{ "martinsione/darkplus.nvim" },
		{ "folke/tokyonight.nvim" },

		-- LSPs
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "lua_ls" },
			},
		},
		{
			"jay-babu/mason-null-ls.nvim",
			opts = {
				ensure_installed = { "prettierd", "stylua" },
			},
		},
		{
			-- override nvim-cmp plugin
			"hrsh7th/nvim-cmp",
			-- override the options table that is used in the `require("cmp").setup()` call
			opts = function(_, opts)
				-- opts parameter is the default options table
				-- the function is lazy loaded so cmp is able to be required
				local cmp = require("cmp")
				-- modify the sources part of the options table
				opts.sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "luasnip", priority = 750 },
					{
						name = "buffer",
						priority = 500,
						option = {
							get_bufnrs = function()
								return vim.api.nvim_list_bufs()
							end,
						},
					},
					{ name = "path", priority = 250 },
				})

				opts.formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[Latex]",
						},
					}),
				}
				return opts
			end,
		},
		-- end plugins
	},
	mappings = {
		n = {
			L = {
				function()
					require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
				end,
				desc = "Next buffer",
			},
			H = {
				function()
					require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
				end,
				desc = "Previous buffer",
			},
		},
		-- end mappings
	},
	colorscheme = "catppuccin",
}
