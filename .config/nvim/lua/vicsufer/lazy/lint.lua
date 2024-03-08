return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint");
        lint.linters_by_ft = {
            -- lua        = { "luacheck" }, Not possible to install properly
            javascript = { "eslint_d" },
            css        = { "stylelint" },
            json       = { "jsonlint" },
            yaml       = { "yamllint" },
            markdown   = { "markdownlint" },
            terraform  = { "tflint" },
            terragrunt = { "tflint" },
            bash       = { "shellcheck" },
            sh         = { "shellcheck" },
            zsh        = { "shellcheck" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufwritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end
        })
        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end
}
