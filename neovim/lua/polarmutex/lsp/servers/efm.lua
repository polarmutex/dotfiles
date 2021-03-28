-- ESLINT
local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
    lintStdin = true
}
-- ESLINTD Server
local eslintd = {
    lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %trror %m", "%f(%l,%c): %tarning %m"},
    lintIgnoreExitCode = true,
    --formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    --formatStdin = true
}

-- PRETTIER
local prettier = {
    formatCommand = "./node_modules/.bin/prettier --stdin-filepath=${INPUT}",
    formatStdin = true
}

return {
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
            javascript = {  eslintd, prettier },
            typescript = {  eslintd, prettier },
            typescriptreact = {  eslintd, prettier },
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
