local lspconfig = require("lspconfig")
local lspname = "beancount"
local install_path = vim.fn.stdpath("data") .. "/lspinstall/" .. lspname

lspconfig[lspname].setup{
    cmd = {
        -- "node",
        -- "--inspect",
        -- "/home/brian/repos/beancount-language-server/out/cli.js",
        "beancount-langserver", "--stdio",
    },
    init_options = {
        journalFile = "~/repos/beancount/journal.beancount",
        pythonPath = "~/.cache/pypoetry/virtualenvs/beancount-repo-iwRmyqK8-py3.9/bin/python3",
    },
    flags = {
        -- time in millisec to debounce dichange notifications
        debounce_text_changes = 500,
    },
}
