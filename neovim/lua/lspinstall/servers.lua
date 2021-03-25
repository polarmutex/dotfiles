local servers = {
    ["bashls"] = require'lspinstall/servers/bashls',
    ["cmake"] = require'lspinstall/servers/cmake',
    ["dockerls"] = require'lspinstall/servers/dockerls',
    ["efm"] = require'lspinstall/servers/efm',
    ["gopls"] = require'lspinstall/servers/gopls',
    ["sumneko"] = require'lspinstall/servers/sumneko',
    ["pyright"] = require'lspinstall/servers/pyright',
    ["rust_analyzer"] = require'lspinstall/servers/rust_analyzer',
    ["svelte"] = require'lspinstall/servers/svelte',
    ["tailwindcss"] = require'lspinstall/servers/tailwindcss',
    ["typescript"] = require'lspinstall/servers/typescript',
    ["vimls"] = require'lspinstall/servers/vimls',
}

return servers
