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
