return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        --explorer = { enabled = true },
        --indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        --scroll = { enabled = true },
        statuscolumn = {
            enabled = false, -- conflict with Oil
            -- left = { 'mark', 'sign' }, -- priority of signs on the left (high to low)
            right = { 'fold', 'git' }, -- priority of signs on the right (high to low)
            folds = {
                open = true, -- show open fold icons
                git_hl = true, -- use Git Signs hl for fold icons
            },
            git = {
                -- patterns to match Git signs
                patterns = { 'GitSign', 'MiniDiffSign' },
            },
            refresh = 50, -- refresh at most every 50ms
        },
        words = { enabled = true },
        dashboard = {
            enabled = true,

            sections = {
                { section = 'header' },
                { section = 'keys', gap = 1, padding = 1 },
                { section = 'startup' },
            },
        },
    },
}
