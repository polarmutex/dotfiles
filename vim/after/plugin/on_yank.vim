augroup LuaHighlight
    au!
    au TextYankPost * lua vim.highlight.on_yank { hlgroup = "Substitute", timeout = 150, on_macro = true }
augroup END 
