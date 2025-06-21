
return {
    { 
        'rebelot/kanagawa.nvim',
        opts = {
            theme = "wave",
        },
        config = function()
            vim.cmd([[colorscheme kanagawa]])
        end
    },
}
