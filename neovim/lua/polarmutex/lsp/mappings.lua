local utils = require("polarmutex.utils")

local lsp_maps = {

    {'n','gd','<cmd>lua vim.lsp.buf.declaration()<CR>'},
    {'n','gD','<cmd>lua vim.lsp.buf.definition()<CR>'},
    {'n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>'},
    {'n','1gD','<cmd>lua vim.lsp.buf.type_definition()<CR>'},
    {'n','K','<cmd>lua vim.lsp.buf.hover()<CR>'},
    {'n','gr','<cmd>lua vim.lsp.buf.references()<CR>'},
    {'n','<c-s>','<cmd>lua vim.lsp.buf.signature_help()<CR>'},
    {'n','lf','<cmd>lua vim.lsp.buf.formatting()<CR>'},
    {'n','<leader>ca','<cmd>lua vim.lsp.buf.code_actions()<CR>'},
    {'n','<leader>cr','<cmd>lua MyLuaRename()<CR>'},
    {'n','<leader>dn','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'},
    {'n','<leader>dp','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'},

}

utils.keymaps(lsp_maps)
