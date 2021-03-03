
local lspconfig = require('lspconfig')

--lspconfig.pyls_ms.setup({
--    on_attach=custom_attach,
--})
lspconfig.pyright.setup({
    on_attach=custom_attach,
    settings = {
        analysis = {
            autoSearchPaths = true
        },
        pyright = {
            useLibraryCodeForTypes = true
        }
    },
    before_init = function(initialization_params, config)
        -- do I still need this?
        initialization_params['workspaceFolders'] = {{
            name = 'workspace',
            uri = initialization_params['rootUri']
        }}
    end;
})
