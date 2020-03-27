
" LSP Settings
:lua << EOF
    local nvim_lsp = require('nvim_lsp')
    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        local method = 'textDocument/publishDiagnostics'

        local default_callback = vim.lsp.callbacks[method]
        vim.lsp.callbacks[method] = function(err, method, result, client_id)
            default_callback(err, method, result, client_id)
            if result and result.diagnostics then
                for _, v in ipairs(result.diagnostics) do
                    v.uri = v.uri or result.uri
                end
                vim.lsp.util.set_qflist(result.diagnostics)
            end
        end
    end
    -- Servers.
    nvim_lsp.clangd.setup{
        cmd={"clangd-9"},
        on_attach=on_attach
    }
EOF

" set up mucomplete
let g:mucomplete#enable_auto_at_startup = 1
set completeopt+=noinsert,noselect

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

set wildoptions=pum
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*mypy_cache*
set wildignore+=*__pycache__*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules*
set wildignore+=**/node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
