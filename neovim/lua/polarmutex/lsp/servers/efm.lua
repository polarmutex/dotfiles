-- ESLINT
--local eslint = {
--	lintCommand = "./node_modules/.bin/eslint -f unix --stdin",
--	lintStdin = true,
--}
-- ESLINTD Server
local eslintd = {
	lintCommand = "eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "ESLINT:%f(%l,%c): %trror %m", "ESLINT: %f(%l,%c): %tarning %m" },
	lintIgnoreExitCode = true,
	--formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	--formatStdin = true
}

-- PRETTIER
local prettier = {
	formatCommand = "./node_modules/.bin/prettier --stdin-filepath=${INPUT}",
	formatStdin = true,
}

-- Python
--local black = {
--	formatCommand = "black -",
--	formatStdin = true,
--}
--local isort = {
--	formatCommand = "isort --stdout -",
--	formatStdin = true,
--}
local flake8 = {
	lintCommand = "flake8 --stdin-display-name ${INPUT} -",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
}
local mypy = {
	lintCommand = "mypy --show-column-numbers",
	lintFormats = {
		"%f:%l:%c: %trror: %m",
		"%f:%l:%c: %tarning: %m",
		"%f:%l:%c: %tote: %m",
	},
}

-- LUA
local styluaFormat = {
	formatCommand = "stylua -",
	formatStdin = true,
}
local luacheck = {
	lintCommand = "luacheck --globals vim --filename ${INPUT} --formatter plain -",
	lintStdin = true,
	lintFormats = {
		"%f:%l:%c: %m",
	},
}

return {
	init_options = {
		documentFormatting = true,
	},
	filetypes = {
		"javascript",
		"typescript",
		"typescriptreact",
		"lua",
		"python",
	},
	settings = {
		rootMarkers = {
			".git/",
			".eslintrc.json",
			".eslintrc.js",
		},
		languages = {
			javascript = { eslintd, prettier },
			typescript = { eslintd, prettier },
			typescriptreact = { eslintd, prettier },
			python = { flake8, mypy },
			lua = { luacheck, styluaFormat },
		},
	},
}
