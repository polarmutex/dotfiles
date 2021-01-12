local nvim_lsp = require('lspconfig')
local status = require('polarmutex.lsp-status')

--require('vim.lsp.log').set_level("trace")
--require('vim.lsp.log').set_level("debug")

-- from rockerboo
function DoFormat()
    vim.lsp.buf.formatting_sync(nil, 1000)
end
local attach_formatting = function(client)
  -- Skip tsserver for now so we dont format things twice
  if client.name == "tsserver" then return end

  --print(string.format('attaching format to %s', client.name))

  vim.api.nvim_command [[augroup Format]]
  vim.api.nvim_command [[autocmd! * <buffer>]]
  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua DoFormat()]]
  vim.api.nvim_command [[augroup END]]
end


-- from tj
local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

-- Turn on status.
status.activate()

local custom_attach = function(client)
        require('completion').on_attach(client)
        status.on_attach(client)

        if client.resolved_capabilities.document_formatting then
            attach_formatting(client)
        end

        if vim.api.nvim_buf_get_option(0,'filetype') == 'beancount' then
            -- populate quickfix list with diagnostics
            -- TODO can we limit this easily to beancount?
            local method = "textDocument/publishDiagnostics"
            local default_callback = vim.lsp.handlers[method]
            vim.lsp.handlers[method] = function(err, method, result, client_id)
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
                        end
                    end

                    vim.fn.setqflist({}, ' ', {
                        title = 'LSP';
                        items = item_list;
                    })
                end
            end
        end

        mapper('n','gd','<cmd>lua vim.lsp.buf.declaration()<CR>')
        mapper('n','gD','<cmd>lua vim.lsp.buf.definition()<CR>')
        mapper('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
        mapper('n','1gD','<cmd>lua vim.lsp.buf.type_definition()<CR>')
        mapper('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
        mapper('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
        mapper('n','<c-s>','<cmd>lua vim.lsp.buf.signature_help()<CR>')
        mapper('n','lf','<cmd>lua vim.lsp.buf.formatting()<CR>')
        mapper('n','<leader>ca','<cmd>lua vim.lsp.buf.code_actions()<CR>')
        mapper('n','<leader>cr','<cmd>lua MyLuaRename()<CR>')
        mapper('n','<leader>dn','<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
        mapper('n','<leader>dp','<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    end

-- Python
--nvim_lsp.pyls_ms.setup({
--    on_attach=custom_attach,
--})
--nvim_lsp.pyright.setup({
--    on_attach=custom_attach,
--    settings = {
--        analysis = {
--            autoSearchPaths = true
--        },
--        pyright = {
--            useLibraryCodeForTypes = true
--        }
--    },
--    before_init = function(initialization_params, config)
--        initialization_params['workspaceFolders'] = {{
--            name = 'workspace',
--            uri = initialization_params['rootUri']
--        }}
--    end;
--})

-- beancount
nvim_lsp.beancount.setup({
    on_attach=custom_attach
})

-- C++
nvim_lsp.clangd.setup({
    cmd={
        'clangd-10',
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

-- diagnosticls
nvim_lsp.efm.setup {
    on_attach = custom_attach,
    init_options = {
        documentFormatting = true
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "css",
        "scss",
        "markdown",
    },
    settings = {
        rootMarkers = {
            ".git/",
            ".eslintrc.json",
            ".eslintrc.js",
        },
        languages = {
            javascript = {
                {
                    lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
                    lintStdin = true
                },
                {
                    formatCommand = "./node_modules/.bin/prettier"
                }
            },
            typescript = {
                {
                    lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
                    lintStdin = true
                },
                {
                    formatCommand = "./node_modules/.bin/prettier"
                }
            },
            typescriptreact = {
                {
                    lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
                    lintStdin = true
                },
                {
                    formatCommand = "./node_modules/.bin/prettier"
                }
            },
            python = {
                {
                    formatCommand = "black -",
                    formatStdin = true
                },
                {
                    formatCommand = "isort --stdout -",
                    formatStdin = true
                },
                {
                    lintCommand = "flake8 --stdin-display-name ${INPUT} -",
                    lintStdin = true,
                    lintFormats = {"%f:%l:%c: %m"}
                },
            }
        },
    }
}

-- jdtls
--nvim_lsp.jdtls.setup({
--        on_attach=custom_attach
--})

-- Lua
require('nlua.lsp.nvim').setup(nvim_lsp, {
    on_attach = custom_attach,

    globals = {
      -- Colorbuddy
      "Color", "c", "Group", "g", "s",

      -- Custom
      "RELOAD",
    }
})

-- setup diagnostice
--[[
0. nil -> do default (could be enabled or disabled)
1. false -> disable it
2. true -> enable, use defaults
3. table -> enable, with (some) overrides
4. function -> can return any of above
--]]

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = {
      priority = 20
    },
    update_in_insert = true,
  }
)

--from tj
function MyLspRename()
    local current_word = vim.fn.expand("<cword>")
    local plenary_window = require('plenary.window.float').percentage_range_window(0.5, 0.2)
    vim.api.nvim_buf_set_option(plenary_window.bufnr, 'buftype', 'prompt')
    vim.fn.prompt_setprompt(plenary_window.bufnr, string.format('Rename "%s" to > ', current_word))
    vim.fn.prompt_setcallback(plenary_window.bufnr, function(text)
        vim.api.nvim_win_close(plenary_window.win_id, true)

        if text ~= '' then
            vim.schedule(function()
                vim.api.nvim_buf_delete(plenary_window.bufnr, { force = true })
                vim.lsp.buf.rename(text)
            end)
        else
            print("Nothing to rename!")
        end
    end)
    vim.cmd [[startinsert]]
end
