return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.configs')
            configs.setup({
                ensure_installed = { "svelte", "typescript", "css", "html", "lua", "vim", "c_sharp", "vimdoc", "rust", "go" },
                auto_install = true,
                highlight = { enable = true },
            })
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup()
        end,
    },
    'nvim-tree/nvim-web-devicons',
}
