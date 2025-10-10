local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},
	config = function()
		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"pyright",
				"clangd",
				"html",
				"jdtls",
			}
		}

		vim.lsp.enable("lua_ls")
		vim.lsp.config("rust_analyzer", {
			settings = {
				['rust-analyzer'] = {
					diagnostics = {
						enable = false,
					},
					cargo = {
						targetDir = true,
					},
				}
			}
		})
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("pyright")
		vim.lsp.enable("clangd")
		vim.lsp.enable("html")
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("jdtls")
		vim.lsp.config("kotlin_language_server", {
			cmd = { 'kotlin-language-server' },
			cmd_env = {
				JAVA_HOME = '/usr/lib/jvm/java-11-openjdk',
			},
		})
		vim.lsp.enable("kotlin_language_server")

		local cmp = require("cmp");
		local luasnip = require("luasnip");
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			}, {
				{ name = 'buffer' },
			})
		})
	end
}
