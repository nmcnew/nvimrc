vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.expandtab=true
vim.o.smarttab=true
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        "--filter=blob:none",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
require("kanagawa").load("dragon")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


require'nvim-treesitter.configs'.setup {
    ensure_installed = { "svelte", "typescript", "css", "html", "lua", "vim", "c_sharp", "vimdoc", "rust", "go" },
    auto_install = true,
    highlight = { enable = true },
}

local EditorGroup = vim.api.nvim_create_augroup('EditorGroup', {})

vim.api.nvim_create_autocmd('LspAttach', {
    group = EditorGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrf", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

if vim.fn.has("wsl") == 1 then
    if vim.fn.executable("wl-copy") == 0 then
        print("Seems like you are under wsl, but do not have wl-copy, this integration won't work")
    else
        vim.g.clipboard = {
            name = 'wl-clipboard (wsl)',
        copy = {
            ["+"] = 'wl-copy --foreground --type text/plain',
            ["*"] = 'wl-copy --foreground --primary --type text/plain',
        },
        paste = {
            ["+"] = (function()
                return vim.fn.systemlist('wl-psate --no-newline|sed -e "s/\r$//"', {''}, 1)
            end),
            ["*"] = (function()
                return vim.fn.systemlist('wl-psate --primary --no-newline|sed -e "s/\r$//"', {''}, 1)
            end),

        },
            cache_enabled = true,
        }
    end
end
