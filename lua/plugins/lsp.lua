return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            function()
                local cmp_lsp = require('cmp_nvim_lsp')
                local capabilities = vim.tbl_deep_extend(
                    "force",
                    {},
                    vim.lsp.protocol.make_client_capabilities(),
                    cmp_lsp.default_capabilities())
                vim.lsp.config('*', {
                    capabilities = capabilities,
                    root_markers = { '.git', '.hg' },
                })
                vim.diagnostic.config({
                    float = {
                        focusable = false,
                        style = "minimal",
                        border = "rounded",
                        source = "always",
                        header = "",
                        prefix = "",
                    },
                })
                return {
                    ensure_installed = { "rust_analyzer", "gopls" },
                    automatic_enable = true,
                }
            end
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            { "neovim/nvim-lspconfig" },
            { 'hrsh7th/cmp-nvim-lsp', opts = {} },
            {
                'hrsh7th/nvim-cmp',
                config = function()
                    local cmp = require('cmp')
                    local cmp_select = { behavior = cmp.SelectBehavior.Select }
                    cmp.setup({
                        snippet = {
                            expand = function(args)
                                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                            end,
                        },
                        mapping = cmp.mapping.preset.insert({
                            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                            ["<C-Space>"] = cmp.mapping.complete(),
                        }),
                        sources = cmp.config.sources({
                            { name = 'nvim_lsp' },
                            { name = 'luasnip' }, -- For luasnip users.
                        }, {
                            { name = 'buffer' },
                        })
                    })
                end,
                dependencies = {
                    { 'hrsh7th/cmp-buffer' },
                    { 'hrsh7th/cmp-path' },
                    { 'hrsh7th/cmp-cmdline' },
                    { 'L3MON4D3/LuaSnip',        opts = {} },
                    { 'saadparwaiz1/cmp_luasnip' },
                }
            },
        }
    },
    {
        "j-hui/fidget.nvim",
        tag = "v1.6.1",
    }
}
