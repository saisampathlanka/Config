return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },

        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          vim.keymap.set('n', ']c', function() gs.nav_hunk('next') end, { buffer = bufnr, desc = "Next Change" })
          vim.keymap.set('n', '[c', function() gs.nav_hunk('prev') end, { buffer = bufnr, desc = "Prev Change" })
          vim.keymap.set('n', '<leader>gp', gs.preview_hunk, { buffer = bufnr, desc = "Preview Change" })
        end
      })
    end
  }
}
