local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 }) end,
})

augroup("AutoResize", { clear = true })
autocmd("VimResized", { group = "AutoResize", command = "wincmd =" })

augroup("TerminalSettings", { clear = true })
autocmd("TermOpen", {
  group = "TerminalSettings",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.cursorline = false
    vim.cmd("startinsert")
  end,
})

augroup("AutoClose", { clear = true })
autocmd("FileType", {
  group = "AutoClose",
  pattern = { "qf", "help", "man", "notify", "lspinfo", "spectre_panel", "startuptime", "tsplayground", "PlenaryTestPopup" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

augroup("RestoreCursor", { clear = true })
autocmd("BufReadPost", {
  group = "RestoreCursor",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

augroup("AutoWrap", { clear = true })
autocmd("FileType", {
  group = "AutoWrap",
  pattern = { "markdown", "text", "gitcommit", "mdx", "typst" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 80
    vim.opt_local.colorcolumn = "80"
  end,
})

augroup("AutoFormat", { clear = true })
autocmd("BufWritePre", {
  group = "AutoFormat",
  pattern = { "*.lua", "*.go", "*.rs", "*.py", "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.yaml", "*.yml", "*.toml" },
  callback = function()
    vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
  end,
})

augroup("Database", { clear = true })
autocmd("FileType", {
  group = "Database",
  pattern = { "sql", "mysql", "plsql" },
  callback = function()
    vim.opt_local.commentstring = "-- %s"
  end,
})

augroup("LargeFile", { clear = true })
autocmd("BufReadPre", {
  group = "LargeFile",
  callback = function(args)
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    if ok and stats and stats.size > 10 * 1024 * 1024 then
      vim.b.large_file = true
      vim.opt_local.syntax = "off"
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.undofile = false
      vim.opt_local.swapfile = false
    end
  end,
})

augroup("NoWelcome", { clear = true })
autocmd("VimEnter", {
  group = "NoWelcome",
  callback = function()
    if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
      vim.cmd("enew")
    end
  end,
})

vim.g.started_with_stdin = false
autocmd("StdinReadPre", { callback = function() vim.g.started_with_stdin = true end })

autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  end,
})

augroup("TreesitterHighlight", { clear = true })
autocmd("FileType", {
  group = "TreesitterHighlight",
  pattern = { "lua", "python", "javascript", "typescript", "tsx", "go", "cpp", "c", "rust", "html", "css", "json", "yaml", "toml", "markdown", "bash", "sql", "dockerfile", "vim", "query", "regex", "luadoc", "vimdoc", "zig", "prisma", "graphql" },
  callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype
    local ok = pcall(vim.treesitter.start, bufnr, ft)
    if not ok then
      local lang = vim.treesitter.language.get_lang(ft)
      if lang then
        pcall(vim.treesitter.start, bufnr, lang)
      end
    end
  end,
})