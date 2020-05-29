" LSP Settings
:lua << EOF

    local nvim_lsp = require('nvim_lsp')
    local lsp_status = require('lsp-status')

    -- completion_customize_lsp_label as used in completion-nvim
    lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label  }
    -- Register the progress callback
    lsp_status.register_progress()

    local make_on_attach = function()
        return function(client)
            require'completion'.on_attach()
            require'diagnostic'.on_attach()

            -- Register the client for messages
            lsp_status.register_client(client.name)

            -- Set up autocommands for refreshing the statusline when LSP information changes
            vim.api.nvim_command('augroup lsp_aucmds')
            vim.api.nvim_command('au! * <buffer>')
            vim.api.nvim_command('au User LspDiagnosticsChanged redrawstatus!')
            vim.api.nvim_command('au User LspMessageUpdate redrawstatus!')
            vim.api.nvim_command('au User LspStatusUpdate redrawstatus!')
            vim.api.nvim_command('augroup END')

            -- If the client is a documentSymbolProvider, set up an autocommand 
            -- to update the containing function
            if client.resolved_capabilities.document_symbol then
                vim.api.nvim_command('augroup lsp_aucmds')
                vim.api.nvim_command('au CursorHold <buffer> lua require("lsp-status").update_current_function()')
                vim.api.nvim_command('augroup END')
            end
        end
    end

    -- Servers.
    local servers = {
        clangd = {
            cmd={
                'clangd-9',
                '--background-index',
                '--clang-tidy',
                '--completion-style=bundled',
                '--header-insertion=iwyu',
                '--suggest-missing-includes'
            },
            callbacks = {
                ['textDocument/clangd.fileStatus'] = lsp_status.extension_callbacks.clangd['textDocument/clangd.fileStatus']
            }
        },
        pyls_ms = {
            callbacks = {
                ['python/setStatusBarMessage'] = lsp_status.extension_callbacks.pyls_ms["python/setStatusBarMessage"],
                ['python/reportProgress'] = lsp_status.extension_callbacks.pyls_ms["python/reportProgress"],
                ['python/beginProgress'] = lsp_status.extension_callbacks.pyls_ms["python/beginProgress"],
                ['python/endProgress'] = lsp_status.extension_callbacks.pyls_ms["python/endProgress"],
            }
        },
        vimls = {},
        beancount_language_server = {},
        jdtls = {},
        --jedi_language_server = {
        --    callbacks = {
        --        --['window/logMessage'] = lsp_status.extension_callbacks.beancount_language_server["window/logMessage"]
        --    }
        --}
    }

    for server, config in pairs(servers) do
        config.on_attach = make_on_attach(config)
        nvim_lsp[server].setup(config)
    end
EOF

" Completion
let g:completion_enable_fuzzy_match = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Diagnostic-nvim
let g:diagnostic_enable_virtual_text = 1

"call sign_define('LspDiagnosticsErrorSign', {'text' : "🗙", 'texthl' : 'RedHover'})
"call sign_define('LspDiagnosticsWarningSign', {'text' : "➤", 'texthl' : 'YellowHover'})
"call sign_define('LspDiagnosticInformationSign', {'text' : "🛈", 'texthl' : 'WhiteHover'})
"call sign_define('LspDiagnosticsHintSign', {'text' : "❗", 'texthl' : 'CocHintHighlight'})

let g:completion_customize_lsp_label = {
      \ 'Function': "\uf794",
      \ 'Method': "\uf6a6",
      \ 'Variable': "\uf71b",
      \ 'Constant': "\uf8ff",
      \ 'Struct': "\ufb44",
      \ 'Class': "\uf0e8",
      \ 'Interface': "\ufa52",
      \ 'Text': "\ue612",
      \ 'Enum': "\uf435",
      \ 'EnumMember': "\uf02b",
      \ 'Module': "\uf668",
      \ 'Color': "\ue22b",
      \ 'Property': "\ufab6",
      \ 'Field': "\uf93d",
      \ 'Unit': "\uf475",
      \ 'File': "\uf471",
      \ 'Value': "\uf8a3",
      \ 'Event': "\ufacd",
      \ 'Folder': "\uf115",
      \ 'Keyword': "\uf893",
      \ 'Snippet': "\uf64d",
      \ 'Operator': "\uf915",
      \ 'Reference': "\uf87a",
      \ 'TypeParameter': "\uf278",
      \ 'Default': "\uf29c"
      \}

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> lf    <cmd>lua vim.lsp.buf.formatting()<CR>

" Completion-vim options
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

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
