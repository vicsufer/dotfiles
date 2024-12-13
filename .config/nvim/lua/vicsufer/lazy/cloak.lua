return {
    "laytan/cloak.nvim",
    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",
            -- The applied highlight group (colors) on the cloaking, see `:h highlight`.
            highlight_group = "Comment",
            patterns = {
                {
                    -- Match any file starting with ".env".
                    -- This can be a table to match multiple file patterns.
                    file_pattern = {
                        ".secrets*",
                        ".env*",
                        ".dev.vars",
                        "wrangler.toml",
                        "config.toml",
                    },
                    -- Match an equals sign and any character after it.
                    -- This can also be a table of patterns to cloak,
                    -- example: cloak_pattern = { ":.+", "-.+" } for yaml files.
                    cloak_pattern = "=.+"
                },

                vim.keymap.set({ "n" }, "<leader>c", vim.cmd.CloakToggle, { desc = "Toggle cloaking state" })
            },
        })
    end
}
