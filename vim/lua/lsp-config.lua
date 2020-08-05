local nvim_lsp = require('nvim_lsp')
local lsp_status = require('lsp-status')

-- require('vim.lsp.log').set_level("trace")

local custom_attach = function(client)
        require('completion').on_attach(client)
        require('diagnostic').on_attach(client)

        -- populate quickfix list with diagnostics
        -- TODO can we limit this easily to beancount?
        local method = "textDocument/publishDiagnostics"
        local default_callback = vim.lsp.callbacks[method]
        vim.lsp.callbacks[method] = function(err, method, result, client_id)
            default_callback(err, method, result, client_id)
            if result and result.diagnostics then
                local item_list = {}

                for _, v in ipairs(result.diagnostics) do
                    local fname = result.uri
                    table.insert(item_list, {
                        filename = fname,
                        lnum = v.range.start.line + 1,
                        col = v.range.start.character + 1;
                        text = v.message;
                    })
                end

                local old_items = vim.fn.getqflist()
                for _, old_item in ipairs(old_items) do
                    local bufnr = vim.uri_to_bufnr(result.uri)
                    if vim.uri_from_bufnr(old_item.bufnr) ~= result.uri then
                        table.insert(item_list, old_item)
                    else
                        print("Skipping Old Item")
                    end
                end

                vim.fn.setqflist({}, ' ', {
                    title = 'LSP';
                    items = item_list;
                })
            end
        end

        vim.fn.nvim_buf_set_keymap(0,'n','gd','<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap=true,silent=true})
        vim.fn.nvim_buf_set_keymap(0,'n','gD','<cmd>lua vim.lsp.buf.definition()<CR>', {noremap=true,silent=true})
        vim.fn.nvim_buf_set_keymap(0,'n','K','<cmd>lua vim.lsp.buf.hover()<CR>', {noremap=true,silent=true})
        vim.fn.nvim_buf_set_keymap(0,'n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap=true,silent=true})
        vim.fn.nvim_buf_set_keymap(0,'n','1gD','<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap=true,silent=true})
        vim.fn.nvim_buf_set_keymap(0,'n','gr','<cmd>lua vim.lsp.buf.references()<CR>', {noremap=true,silent=true})
        vim.fn.nvim_buf_set_keymap(0,'n','<c-s>','<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap=true,silent=true})
        vim.fn.nvim_buf_set_keymap(0,'n','lf','<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap=true,silent=true})
    end

-- Python
nvim_lsp.pyls_ms.setup({
    enable=true,
    on_attach=custom_attach,
})

-- beancount
nvim_lsp.beancount_language_server.setup({
    on_attach=custom_attach
})

-- C++
nvim_lsp.clangd.setup({
    cmd={
        'clangd-9',
        '--background-index',
        '--clang-tidy',
        '--completion-style=bundled',
        '--header-insertion=iwyu',
        '--suggest-missing-includes'
    },
    on_attach=custom_attach
})

-- Vim
nvim_lsp.vimls.setup({
    on_attach=custom_attach,
})

-- TS
nvim_lsp.tsserver.setup({
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    on_attach=custom_attach
})

-- jdtls
nvim_lsp.jdtls.setup({
        on_attach=custom_attach
})

-- Lua
local sumneko_settings = {
    runtime={
        version="LuaJIT",
    },
    diagnostics={
        enable=true,
        globals={
            "vim", "Color", "c", "Group", "g", "s", "describe", "it", "before_each", "after_each"
        },
    },
}
sumneko_settings.Lua = vim.deepcopy(sumneko_settings)

nvim_lsp.sumneko_lua.setup({
    settings=sumneko_settings,
    filetypes = {"lua"},
    cmd = {
        "~/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server",
        "-E",
        "~/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua"
    },
    on_attach=custom_attach
})

