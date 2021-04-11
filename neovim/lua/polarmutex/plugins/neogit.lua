local theme = require("polarmutex.colorschemes.gruvbox")

local neogit = require("neogit")

neogit.setup({
	disable_signs = true,
	-- customize displayed signs
	--signs = {
	--    -- { CLOSED, OPENED }
	--    section = { ">", "v" },
	--    item = { ">", "v" },
	--    hunk = { "", "" },
	--},
	-- override/add mappings
	--mappings = {
	--    -- modify status buffer mappings
	--    status = {
	--        -- Adds a mapping with "B" as key that does the "BranchPopup" command
	--        ["B"] = "BranchPopup",
	--        -- Removes the default mapping of "s"
	--        ["s"] = "",
	--    }
	--}
})

vim.cmd("hi NeogitNotificationInfo guifg=" .. theme.GruvboxGreen.fg)
vim.cmd("hi NeogitNotificationWarning guifg=" .. theme.GruvboxYellow.fg)
vim.cmd("hi NeogitNotificationError guifg=" .. theme.GruvboxRed.fg)

vim.cmd("hi def NeogitDiffAddHighlight guibg=#404040")
vim.cmd("hi def NeogitDiffDeleteHighlight guibg=#404040")
vim.cmd("hi def NeogitDiffContextHighlight ctermbg=4 guibg=#333333")
vim.cmd("hi def NeogitHunkHeader guifg=#cccccc guibg=#404040")
vim.cmd("hi def NeogitHunkHeaderHighlight guifg=#cccccc guibg=#4d4d4d")
