return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
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
