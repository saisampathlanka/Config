vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↳ "

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes:1"
opt.colorcolumn = "100"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.pumheight = 10
opt.cmdheight = 1
opt.laststatus = 3
opt.showmode = false
opt.showcmd = false
opt.ruler = false

opt.splitbelow = true
opt.splitright = true
opt.equalalways = false

opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.updatetime = 200
opt.timeoutlen = 300
opt.ttimeoutlen = 10

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

opt.completeopt = "menu,menuone,noselect,preview"
opt.shortmess:append("c")

opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.mousemoveevent = true

opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "▾",
  foldclose = "▸",
  foldsep = " ",
  diff = "╱",
  msgsep = "─",
}

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

opt.smoothscroll = true

vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 2 },
  signs = { text = { [1] = "●", [2] = "●", [3] = "●", [4] = "●" } },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
})

vim.filetype.add({
  extension = { mdx = "mdx", sql = "sql" },
  pattern = { [".env.*"] = "sh" },
})