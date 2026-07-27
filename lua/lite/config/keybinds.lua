vim.g.mapleader = " "

local function safe_buffer_delete()
    local bufnr = vim.api.nvim_get_current_buf()
    local alt = vim.fn.bufnr("#")

    if alt ~= -1 and alt ~= bufnr and vim.fn.buflisted(alt) == 1 then
        vim.cmd("buffer " .. alt)
    else
        vim.cmd("bnext")
    end

    if vim.api.nvim_buf_is_valid(bufnr) then
        vim.cmd("bdelete " .. bufnr)
    end
end 

vim.keymap.set("n", "<leader>bd", safe_buffer_delete, { desc = "Close buffer"})
