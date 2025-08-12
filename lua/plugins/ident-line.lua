return {
    'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        config = function()
            local highlight = {
                'RainbowRed',
                'RainbowYellow',
                'RainbowBlue',
                'RainbowOrange',
                'RainbowGreen',
                'RainbowViolet',
                'RainbowCyan',
            }
            local hooks = require 'ibl.hooks'
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
                vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
                vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
                vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
                vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
                vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
                vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
            end)

            vim.g.rainbow_delimiters = { highlight = highlight }
            require('ibl').setup { scope = { highlight = highlight } }
            hooks.register(
                hooks.type.SCOPE_HIGHLIGHT,
                hooks.builtin.scope_highlight_from_extmark
            )
        end,
    },

    {
        'echasnovski/mini.indentscope',
        version = '*',
        config = function()
            require('mini.indentscope').setup()
        end,
    },

    {
        'Mr-LLLLL/cool-chunk.nvim',
        event = { 'CursorHold', 'CursorHoldI' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('cool-chunk').setup {}
        end,
    },

    -- Rainbow brace
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
            require('rainbow-delimiters.setup').setup {
                strategy = {
                    [''] = 'rainbow-delimiters.strategy.global',
                    vim = 'rainbow-delimiters.strategy.local',
                },

                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },

                priority = {
                    [''] = 110,
                    lua = 210,
                },

                --[[highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },]]
            }
        end,
    },

    -- Highlight todo, notes, etc in comments
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
}
