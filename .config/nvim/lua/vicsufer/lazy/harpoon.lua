return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup({})

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add file to harpoon" })
        vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Add file to harpoon" })

        vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Jump to harpoon file 1" })
        vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Jump to harpoon file 2" })
        vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Jump to harpoon file 3" })
        vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Jump to harpoon file 4" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
            { desc = "Jump to previous harpoon file" })
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Jump to next harpoon file" })
    end
}
