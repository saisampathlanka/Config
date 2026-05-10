_G.cp_mode = false

function _G.toggle_coding_mode()
	_G.cp_mode = not _G.cp_mode

	if _G.cp_mode then
		vim.lsp.stop_client(vim.lsp.get_active_clients())
		print("Switching to CP Mode (LSP Off)")
	else
		vim.diagnostic.enable()

		pcall(vim.cmd, "TSBufEnable highlight")

		vim.cmd("edit")

		-- vim.cmd("LspStart")
		print("Switching to Dev Mode (LSP On)")
	end

	vim.cmd("redrawstatus")
end

vim.keymap.set("n", "<leader>m", "<cmd>lua toggle_coding_mode()<CR>", { desc = "Toggle CP/Dev Mode" })
