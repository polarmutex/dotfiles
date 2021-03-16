local lspconfig = require('lspconfig')
local custom_attach = require("polarmutex.lsp.attach")

lspconfig.beancount.setup({
    cmd = {
        'node',
        '--inspect',
        '/home/brian/repos/beancount-language-server/out/cli.js',
        --'beancount-langserver',
        '--stdio'
    },
    on_attach=custom_attach,
    init_options = {
      journalFile = "~/repos/beancount/journal.beancount",
      pythonPath = "~/.cache/pypoetry/virtualenvs/beancount-repo-iwRmyqK8-py3.9/bin/python3";
    },
})
