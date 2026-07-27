local isTransparent = true
local theme = "rose-pine"

function SetupTheme(color, transparent)
    vim.cmd.colorscheme(color)

    if transparent then
        local groups = {
            "Normal", "NormalFloat", "NormalNC",
        }
        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
    end
end

return {
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        priority = 1000,
        lazy = theme ~= "gruvbox",
        config = function()
            local opts = {
                contrast = "", -- hard, soft, "" - medium
                transparent_mode = isTransparent,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                },
            }
            require("gruvbox").setup(opts)
            if theme == "gruvbox" then
                SetupTheme("gruvbox", isTransparent)
            end
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        lazy = theme ~= "rose-pine",
        config = function()
            local opts = {
                transparency = isTransparent,
                disable_background = isTransparent,
            }
            require('rose-pine').setup(opts)
            if theme == "rose-pine" then
                SetupTheme("rose-pine", isTransparent)
            end
        end
    },
    {
        "folke/tokyonight.nvim",
        name = "tokyonight",
        priority = 1000,
        lazy = theme ~= "tokyonight",
        config = function()
            local opts = {
                style = "storm", -- options: storm, moon, night, day
                transparent = isTransparent,
            }

            if isTransparent then
                opts.styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                }
            end
            require("tokyonight").setup(opts)
            if theme == "tokyonight" then
                SetupTheme("tokyonight", isTransparent)
            end
        end
    },
}
