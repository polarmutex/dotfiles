local lspconfig = require("lspconfig")
local lspname = "sumneko_lua"
local install_path = vim.fn.stdpath("data") .. "/lspinstall/" .. lspname

lspconfig[lspname].setup{
    cmd = { install_path .. "/sumneko-lua-language-server" },
    settings = {
        Lua = {
            runtime = {
                -- LuaJIT in the case of Neovim
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    "vim", -- Packer
                    "use", -- Awesome
                    "awesome", "client", "root",
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    [vim.fn.expand("/usr/share/awesome/lib")] = true,
                },
            },
        },
    },
}
