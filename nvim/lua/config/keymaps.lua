local keymap = vim.keymap.set

-- Escape Mode
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Oil
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope
local builtin = pcall(require, "telescope.builtin")

if builtin then
	keymap("n", "<leader><leader>", "<CMD>Telescope find_files<CR>", { desc = "Find Files" })
	keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Live Grep" })
	keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Buffers" })
	keymap("n", "<leader>fh", "<CMD>help_tags<CR>", { desc = "Search Help Docs" })
	keymap("n", "<leader>fs", "<CMD>lsp_document_symbols<CR>", { desc = "Find Functions/Variables" })
end

-- LSP
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Fold
keymap("n", "<Tab>", "za", { desc = "Toggle fold" })
keymap("n", "zR", "zR", { desc = "Open all folds" })
keymap("n", "zM", "zM", { desc = "Close all folds" })

-- Terminal
local Terminal = require("toggleterm.terminal").Terminal
local float_term = Terminal:new({ direction = "float" })

function _float_terminal_toggle()
	float_term:toggle()
end

vim.keymap.set("n", "<leader>tt", "<cmd>lua _float_terminal_toggle()<CR>", { desc = "Toggle Floating Terminal" })
