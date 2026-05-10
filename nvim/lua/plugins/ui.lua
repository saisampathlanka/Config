return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
	},
	-- {
	-- 	"lunarvim/darkplus.nvim",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("darkplus")
	--
	-- 		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- 		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- 	end,
	-- },
	{
		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			vim.opt.background = "dark"
			vim.cmd.colorscheme("oxocarbon")

			-- transparency
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

			vim.api.nvim_set_hl(0, "LineNr", {
				bg = "none",
			})

			vim.api.nvim_set_hl(0, "CursorLineNr", {
				bg = "none",
			})

			vim.api.nvim_set_hl(0, "SignColumn", {
				bg = "none",
			})

			vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })

			local hl = vim.api.nvim_set_hl

			local groups = {
				"TelescopeNormal",
				"TelescopeBorder",
				"TelescopePromptNormal",
				"TelescopePromptBorder",
				"TelescopePromptTitle",
				"TelescopeResultsNormal",
				"TelescopeResultsBorder",
				"TelescopeResultsTitle",
				"TelescopePreviewNormal",
				"TelescopePreviewBorder",
				"TelescopePreviewTitle",
			}

			for _, group in ipairs(groups) do
				hl(0, group, { bg = "none" })
			end
		end,
	},
}
