return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- LSP Management
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Completion Engine & Sources
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",

        -- Progress UI
        "j-hui/fidget.nvim",
    },

    config = function()
        require("fidget").setup()
        require("mason").setup()

        -- Diagnostics setup
        vim.diagnostic.config({
            virtual_text = true,
            float = {
                border = "rounded",
                source = "always",
            },
        })

        -- LSP Capabilities
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        -- Mason & Server Handlers
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "pyright",
                "intelephense",
                "html",
                "cssls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                },
                            },
                        },
                    })
                end,
            },
        })

        -- Autocompletion (nvim-cmp)
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
}


