return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Fugitive" })

        local vicsufer_Fugitive = vim.api.nvim_create_augroup("vicsufer_Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = vicsufer_Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, { desc = "git push" })

                local Terminal = require('toggleterm.terminal').Terminal
                local commitizen = Terminal:new({ cmd = "cz commit -- -S", hidden = true })

                function _commitizen_toggle()
                    commitizen:toggle()
                end

                vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>lua _commitizen_toggle()<CR>",
                    { noremap = true, silent = true, desc = "Conventional commit" })

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({ 'pull', '--rebase' })
                end, { desc = "git pull --rebase" })

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
            end,
        })


        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
    end
}
