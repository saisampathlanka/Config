local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.termguicolors = true
opt.cursorline = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.wrap = true

opt.clipboard = "unnamedplus"

-- Fold
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.foldnestmax = 10
-- opt.foldcolumn = "1"

-- Custom Fold Function
_G.custom_fold_text = function()
	local start_line = vim.v.foldstart
	local end_line = vim.v.foldend
	local line_count = end_line - start_line + 1
	local line_content = vim.api.nvim_buf_get_lines(0, start_line - 1, start_line, false)[1]

	line_content = line_content:gsub("^%s*", "")

	return "   " .. line_content .. " ... (" .. line_count .. " lines) "
end

-- Custom Fold Text
opt.foldtext = "v:lua.custom_fold_text()"
opt.fillchars = {
	fold = " ",
	foldopen = "",
	foldsep = " ",
	foldclose = "",
}

opt.foldlevel = 99
opt.foldlevelstart = 99

-- Function to return the current mode string
function _G.get_current_mode()
	return _G.cp_mode and " CP " or " Dev "
end

_G.cga_get_mode = function()
	local m = vim.api.nvim_get_mode().mode

	local map = {
		n = "NORMAL",
		i = "INSERT",
		v = "VISUAL",
		V = "V-LINE",
		["\22"] = "V-BLOCK",
		c = "COMMAND",
		R = "REPLACE",
	}

	return map[m] or m
end

-- Standard Neovim statusline
-- vim.opt.statusline = "%f %m %=%{v:lua.get_current_mode()} %l:%c"
vim.opt.statusline = "%f %m %= %{v:lua.get_current_mode()} | %{v:lua.cga_get_mode()} %l:%c"

-- disable command/status message and modify to floating notification
vim.opt.cmdheight = 0
vim.opt.showmode = false

vim.notify = function(msg, level, opts)
	vim.api.nvim_echo({ { msg } }, false, {})
end
