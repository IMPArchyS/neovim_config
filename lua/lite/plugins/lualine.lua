return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/noice.nvim", -- Connects statusline events
    },
    event = "VeryLazy",
    config = function()
        vim.opt.cmdheight = 0
        vim.opt.laststatus = 3

        -- Helper to detect macro recording
        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            return recording_register == "" and "" or ("󰑋 @" .. recording_register)
        end

        -- Trigger statusline refresh on macro enter/leave
        vim.api.nvim_create_autocmd("RecordingEnter", {
            callback = function() require("lualine").refresh({ place = { "statusline" } }) end,
        })
        vim.api.nvim_create_autocmd("RecordingLeave", {
            callback = function()
                vim.defer_fn(function() require("lualine").refresh({ place = { "statusline" } }) end, 50)
            end,
        })

        require("lualine").setup({
            options = {
                theme = "auto",
                icons_enabled = true,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    { "filename", path = 1 },
                },
                lualine_x = {
                    -- Active command status from Noice
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        color = { fg = "#ff9e64" },
                    },
                    -- Macro indicator
                    {
                        show_macro_recording,
                        color = { fg = "#ff5555", gui = "bold" },
                    },
                    { "searchcount", maxcount = 999, timeout = 500 },
                    "diagnostics",
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
