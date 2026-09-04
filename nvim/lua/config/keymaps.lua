local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>x", "<cmd>x<cr>", { desc = "Save & Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit All" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
map("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close split" })
map("n", "<leader>so", "<cmd>only<cr>", { desc = "Close other splits" })

map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
map("n", "<Down>", "gj", opts)
map("n", "<Up>", "gk", opts)
map("v", "j", "gj", opts)
map("v", "k", "gk", opts)

map("n", "H", "^", opts)
map("n", "L", "g_", opts)
map("v", "H", "^", opts)
map("v", "L", "g_", opts)

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-f>", "<C-f>zz", opts)
map("n", "<C-b>", "<C-b>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "*", "*zzzv", opts)
map("n", "#", "#zzzv", opts)

map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

map("n", "J", "mzJ`z", opts)

map("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })

map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus file tree" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace symbols" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>fC", "<cmd>Telescope git_bcommits<cr>", { desc = "Buffer commits" })

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

map("n", "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Move left from terminal" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Move down from terminal" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Move up from terminal" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Move right from terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Type definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { desc = "List diagnostics" })

map("n", "<leader>;", ":", { desc = "Command mode" })
map("v", "<leader>;", ":", { desc = "Command mode" })

map("i", "jk", "<Esc>", opts)
map("i", "kj", "<Esc>", opts)

map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Markdown preview" })