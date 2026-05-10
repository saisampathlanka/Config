return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local status, configs = pcall(require, "nvim-treesitter.configs")
			if not status then
				configs = require("nvim-treesitter")
			end

			require("nvim-treesitter.install").compilers = { "clang", "gcc" }

			configs.setup({
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"lua",
					"python",
					"javascript",
					"typescript",
					"vim",
					"vimdoc",
					"markdown",
					"markdown_inline",
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})

			vim.wo.foldmethod = "expr"
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	},
}
