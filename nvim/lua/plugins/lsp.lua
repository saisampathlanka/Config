return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "pyright", "clangd", "gopls", "ts_ls", "stylua" },
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = { "pyright", "clangd", "gopls", "ts_ls", "stylua" }

			for _, server_name in ipairs(servers) do
				local config = { capabilities = capabilities }

				vim.lsp.config(server_name, config)
			end

			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					focused = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			local signs = {
				Error = "󰅚 ", -- or " "
				Warn = "󰀪 ", -- or " "
				Hint = "󰛩 ", -- or  "󰌵 "
				Info = "󰋽 ", -- or " "
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				python = { "isort", "black" },
				javascript = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
			},
			format_on_save = function()
				if _G.cp_mode then
					return
				end

				return {
					timeout_ms = 500,
					lsp_fallback = true,
				}
			end,
		},
	},
}
