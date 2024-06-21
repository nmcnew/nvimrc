return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    {
        'ActivityWatch/aw-watcher-vim',
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup()
        end,
    },
    'nvim-tree/nvim-web-devicons',
    'rebelot/kanagawa.nvim',
}
