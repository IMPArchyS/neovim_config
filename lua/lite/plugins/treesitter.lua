return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- old `master` is frozen; this repo is a full rewrite on `main`
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ensure_installed = {
            "vimdoc", "javascript", "typescript", "c", "cpp", "lua", "rust",
            "jsdoc", "bash", "python", "php", "java", "c_sharp",
            "html", "css", "json", "yaml", "markdown", "markdown_inline", "regex",
        }

       require("nvim-treesitter").install(ensure_installed)

       vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end
}
