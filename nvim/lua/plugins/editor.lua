return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      ensure_installed = {
        "bash", "c", "cpp", "css", "dockerfile", "go", "gomod", "gosum", "html",
        "javascript", "json", "jsonc", "lua", "luadoc", "markdown", "markdown_inline",
        "python", "query", "regex", "rust", "sql", "toml", "tsx", "typescript",
        "vim", "vimdoc", "yaml", "zig", "prisma", "graphql",
      },
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = { { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" }, { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" } },
    opts = {
      defaults = {
        prompt_prefix = "  ",
        selection_caret = "  ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = { horizontal = { prompt_position = "top", preview_width = 0.55 }, vertical = { mirror = false }, width = 0.87, height = 0.80, preview_cutoff = 120 },
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/", "%.lock", "%.min%.js", "%.map" },
        vimgrep_arguments = { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden", "--glob=!.git/" },
      },
      pickers = { find_files = { hidden = true, find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" } } },
    },
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    config = function(_, opts)
      require("telescope").setup(opts)
      pcall(require("telescope").load_extension, "fzf")
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = { { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" }, { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus Neo-tree" } },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = { with_markers = true, indent_marker = "│", last_indent_marker = "└", highlight = "NeoTreeIndentMarker" },
        icon = { folder_closed = "󰉋", folder_open = "󰉌", folder_empty = "󰉖", default = "󰈚" },
        git_status = { symbols = { added = "", modified = "", deleted = "✖", renamed = "󰁕", untracked = "", ignored = "", unstaged = "󰄱", staged = "", conflict = "" } },
      },
      window = { position = "left", width = 32, mapping_options = { noremap = true, nowait = true } },
      filesystem = { filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = false, hide_hidden = false, never_show = { ".git", "node_modules", "__pycache__", ".DS_Store" } }, follow_current_file = { enabled = true }, use_libuv_file_watcher = true },
      git_status = { window = { position = "float" } },
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }, { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal", mode = { "n", "t" } } },
    opts = {
      size = function(term) return term.direction == "horizontal" and 15 or vim.o.columns * 0.4 end,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = { border = "rounded", winblend = 0, highlights = { border = "Normal", background = "Normal" } },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true, ts_config = { lua = { "string", "source" }, javascript = { "string", "template_string" }, java = false }, disable_filetype = { "TelescopePrompt", "vim" }, fast_wrap = { map = "<M-e>", chars = { "{", "[", "(", '"', "'" }, pattern = [=[[%'%"%)%>%]%)%}%,]]=], end_key = "$", keys = "qwertyuiopzxcvbnmasdfghjkl", check_comma = true, highlight = "PmenuSel", highlight_grey = "LineNr" } },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      opts = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = false,
        filetypes = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript", "xml", "php", "markdown", "astro", "glimmer", "handlebars", "hbs" },
      },
    },
  },

  {
    "numToStr/Comment.nvim",
    keys = { { "gcc", mode = "n", desc = "Comment line" }, { "gc", mode = { "n", "v" }, desc = "Comment toggle" } },
    config = function()
      local ok, ts_context = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      require("Comment").setup({
        pre_hook = ok and ts_context.create_pre_hook() or nil,
      })
    end,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = { enable_autocmd = false },
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { preset = "modern", delay = 200, icons = { breadcrumb = "»", separator = "➜", group = "+", ellipsis = "…" }, win = { border = "rounded", padding = { 1, 2 }, wo = { winblend = 0 } } },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = { add = { text = "│" }, change = { text = "│" }, delete = { text = "_" }, topdelete = { text = "‾" }, changedelete = { text = "~" }, untracked = { text = "┆" } },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = { follow_files = true },
      auto_attach = true,
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = { virt_text = true, virt_text_pos = "eol", delay = 1000, ignore_whitespace = false },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = { border = "rounded", style = "minimal", relative = "cursor", row = 0, col = 1 },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts) opts = opts or {}; opts.buffer = bufnr; vim.keymap.set(mode, l, r, opts) end
        map("n", "]c", function() if vim.wo.diff then return "]c" end; vim.schedule(function() gs.next_hunk() end); return "<Ignore>" end, { expr = true, desc = "Next hunk" })
        map("n", "[c", function() if vim.wo.diff then return "[c" end; vim.schedule(function() gs.prev_hunk() end); return "<Ignore>" end, { expr = true, desc = "Prev hunk" })
        map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
        map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage hunk" })
        map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
        map("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "Diff this ~" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })
      end,
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}