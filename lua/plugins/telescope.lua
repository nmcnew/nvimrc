return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
               return vim.fn.executable 'make' == 1
            end,
        },
    },
    keys = {
        { "<leader>ff", require('telescope.builtin').find_files, desc = "Find Files" },
        { "<leader>fg", require('telescope.builtin').live_grep, desc = "Telescope Live grep" },
        { "<leader>fb", require('telescope.builtin').buffers, desc = "Telescope Buffers" },
        { "<leader>fh", require('telescope.builtin').help_tags, desc = "Telescope Help" },
    },
}
