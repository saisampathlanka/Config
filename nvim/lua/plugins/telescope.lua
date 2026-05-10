return {
    {
        'nvim-telescope/telescope.nvim',
        branch = 'master', 
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable('make') == 1
                end,
            },
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')

            telescope.setup({
                defaults = {
                    preview = {
                        treesitter = false, 
                    },
                    path_display = { "truncate" },
                    mappings = {
                        i = {
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-j>'] = actions.move_selection_next,
                        },
                    },
                    layout_config = {
                        horizontal = { preview_width = 0.55, results_width = 0.8 },
                        width = 0.87, height = 0.80,
                    },
                },
            })
        end,
    },
}
