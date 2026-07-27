local M = {}

function M.setup(buf, gs)
    local opts = { buffer = buf }

    vim.keymap.set("n", "]c", function() 
        if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
        else
            gs.next_hunk()
        end
    end, opts)

    vim.keymap.set("n", "[c", function() 
        if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
        else
            gs.prev_hunk()
        end
    end, opts)

    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts)
    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts)
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
    vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, opts)
end

return M
