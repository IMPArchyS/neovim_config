return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            cmdline = {
                enabled = true,
                view = "cmdline_popup", -- Displays command prompt as a centered popup
            },
            messages = {
                enabled = true, -- Intercepts bottom messages like "file written"
            },
            popupmenu = {
                enabled = true, -- Floating completion menu for commands
            },
            presets = {
                bottom_search = true, -- Shows search ('/') neatly without opening raw cmdline
                command_palette = true, -- Positions command palette near the top/center
                long_message_to_split = true,
            },
        },
    },
}
