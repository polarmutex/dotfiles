local lspconfig = require('lspconfig')
local custom_attach = require("polarmutex.lsp.attach")
local lspstatus = require('lsp-status')

lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
  on_attach = custom_attach,

  -- Required for lsp-status
  init_options = {
    clangdFileStatus = true
  },
  handlers = lspstatus.extensions.clangd.setup(),
  capabilities = lspstatus.capabilities,
})

