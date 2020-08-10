local ok, _ = pcall(function() require('lsp-config') end)
if not ok then
    return
end

require('lsp-config')
require('tree-sitter-config')
