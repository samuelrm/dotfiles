local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        ["golangci_lint_ls"] = function()
            require('lspconfig')["golangci_lint_ls"].setup({
                init_options = {
                    command = {
                        'golangci-lint',
                        'run',
                        '--output.json.path=stdout',
                        '--show-stats=false'
                    },
                },
            })
        end
    },
})
