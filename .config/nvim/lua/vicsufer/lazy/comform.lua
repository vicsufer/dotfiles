return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform");
        conform.setup({
            formaters_by_ft = {
                lua        = { "stylua" },
                javascript = { "prettier" },
                css        = { "prettier" },
                json       = { "prettier" },
                yaml       = { "yamlfix" },
                go         = { "gopls" },
                rust       = { "rustft" },
                markdown   = { "prettier" },
                terraform  = { "terraform_fmt" },
                terragrunt = { "terragrunt_hclfmt" },
                bash       = { "beautysh" },
                sh         = { "beautysh" },
                zsh        = { "beautysh" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            }
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end
}
