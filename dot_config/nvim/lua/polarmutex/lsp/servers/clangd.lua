local lspstatus = require("lsp-status")
local lspconfig = require("lspconfig")
local lspname = "clangd"
local install_path = vim.fn.stdpath("data") .. "/lspinstall/" .. lspname

lspconfig[lspname].setup{
    cmd = {
        "clangd", "--background-index", "--suggest-missing-includes", "--clang-tidy",
        "--header-insertion=iwyu",
    },
    -- Required for lsp-status
    init_options = {clangdFileStatus = true},
    handlers = lspstatus.extensions.clangd.setup(),
    capabilities = lspstatus.capabilities,
}
