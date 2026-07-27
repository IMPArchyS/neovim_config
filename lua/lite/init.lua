-- setup keybinds, editor config and plugins
require("lite.config.keybinds")
require("lite.config.editor_config")
require("lite.config.lazy")

-- setup hot realod for nvim lua config checks
function R(name)
    require("plenary.reload").reload_module(name)
end

-- highlight on copy 
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "highlight when copying text",
    group = vim.api.nvim_create_augroup("lite_yank_group", {clear = true }),
    callback = function ()
        vim.hl.on_yank()
    end
})

-- setup keybinds for intellisense
local lite_group = vim.api.nvim_create_augroup("lite_group", {})

vim.api.nvim_create_autocmd('LspAttach', {
    group = lite_group,
    callback = function(e)
        require("lite.config.lsp_keybinds").setup(e.buf)
    end
})

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
