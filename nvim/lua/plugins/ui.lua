return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
      dim_inactive = { enabled = false },
      no_italic = true,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      custom_highlights = function(colors)
        return {
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE", fg = colors.surface2 },
          TelescopeNormal = { bg = "NONE" },
          TelescopeBorder = { bg = "NONE", fg = colors.surface2 },
          TelescopePromptNormal = { bg = "NONE" },
          TelescopePromptBorder = { bg = "NONE", fg = colors.surface2 },
          TelescopeResultsNormal = { bg = "NONE" },
          TelescopeResultsBorder = { bg = "NONE", fg = colors.surface2 },
          TelescopePreviewNormal = { bg = "NONE" },
          TelescopePreviewBorder = { bg = "NONE", fg = colors.surface2 },
          NeoTreeNormal = { bg = "NONE" },
          NeoTreeNormalNC = { bg = "NONE" },
          NeoTreeEndOfBuffer = { bg = "NONE" },
          WhichKeyFloat = { bg = "NONE" },
          LazyNormal = { bg = "NONE" },
          MasonNormal = { bg = "NONE" },
          LspInfoBorder = { bg = "NONE", fg = colors.surface2 },
          CursorLine = { bg = "NONE" },
          CursorLineNr = { fg = colors.lavender, bold = true },
          LineNr = { fg = colors.surface2 },
          SignColumn = { bg = "NONE" },
          FoldColumn = { bg = "NONE" },
          VertSplit = { fg = colors.surface1, bg = "NONE" },
          WinSeparator = { fg = colors.surface1, bg = "NONE" },
          StatusLine = { bg = "NONE", fg = colors.text },
          StatusLineNC = { bg = "NONE", fg = colors.overlay1 },
          TabLine = { bg = "NONE", fg = colors.overlay1 },
          TabLineFill = { bg = "NONE" },
          TabLineSel = { bg = "NONE", fg = colors.lavender, bold = true },
          Pmenu = { bg = "NONE", fg = colors.text },
          PmenuSel = { bg = colors.surface1, fg = colors.text },
          PmenuSbar = { bg = "NONE" },
          PmenuThumb = { bg = colors.overlay0 },
        }
      end,
      integrations = {
        telescope = { enabled = true },
        neotree = { enabled = true },
        treesitter = true,
        native_lsp = { enabled = true, inlay_hints = { background = true } },
        gitsigns = true,
        cmp = true,
        which_key = true,
        notify = true,
        mini = { enabled = true, indentscope_color = "lavender" },
        leap = true,
        markdown = true,
        mason = true,
        noice = true,
        lsp_trouble = true,
        indent_blankline = { enabled = true, colored_indent_levels = false },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { { "mode", fmt = function(str) return str:sub(1, 1) end } },
        lualine_b = { { "branch", icon = "󰘬" }, { "diff", symbols = { added = "+", modified = "~", removed = "-" } } },
        lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " 🔒", unnamed = "" } } },
        lualine_x = {
          { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = "● ", warn = "● ", info = "● ", hint = "● " } },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 1 } },
        },
        lualine_y = { { "progress", separator = "", padding = { left = 1, right = 1 } } },
        lualine_z = { { "location", padding = { left = 1, right = 1 } } },
      },
      inactive_sections = {
        lualine_a = {}, lualine_b = {}, lualine_c = { "filename" }, lualine_x = { "location" }, lualine_y = {}, lualine_z = {},
      },
      extensions = { "neo-tree", "lazy", "mason", "trouble", "toggleterm" },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│", tab_char = "│", highlight = "IblIndent" },
      scope = { enabled = true, show_start = false, show_end = false, highlight = "IblScope" },
      exclude = { filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "toggleterm" } },
    },
    config = function(_, opts)
      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#313244" })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#7f849c" })
      end)
      require("ibl").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = { override = { ["vim.lsp.util.convert_input_to_markdown_lines"] = true, ["vim.lsp.util.stylize_markdown"] = true, ["cmp.entry.get_documentation"] = true } },
      presets = { bottom_search = true, command_palette = true, long_message_to_split = true, inc_rename = false, lsp_doc_border = true },
      routes = { { filter = { event = "msg_show", find = "written" }, opts = { skip = true } } },
    },
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      render = "wrapped-compact",
      stages = "slide",
      timeout = 3000,
      max_height = 5,
      max_width = 60,
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = { input = { border = "rounded", win_options = { winblend = 0 } }, select = { backend = { "telescope", "builtin" }, telescope = nil } },
  },
}