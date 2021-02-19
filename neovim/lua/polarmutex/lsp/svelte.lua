local lspconfig = require('lspconfig')
local custom_attach = require("polarmutex.lsp.attach")

lspconfig.svelte.setup({
    on_attach=custom_attach,
    settings = {
        svelte =  {
            plugin = {
                html = {
                    completions = {
                        enable = true,
                        emmet = false
                    },
                },
                svelte = {
                    completions = {
                        enable = true,
                        emmet = false
                    },
                },
                css = {
                    completions = {
                        enable = true,
                        emmet = false
                    },
                },
            }
        }
    },
})
