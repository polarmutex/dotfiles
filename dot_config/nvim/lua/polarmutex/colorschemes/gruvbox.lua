-- First, enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`
--
-- (try putting your cursor inside the ` and typing yi`:@"<CR>)
--
-- Calls to hsl() are now highlighted with the correct background colour
-- Highlight names groups will have the highlight style applied to them.
local lush = require("lush")
local hsl = lush.hsl

-- HSL stands for Hue        (0 - 360)
--                Saturation (0 - 100)
--                Lightness  (0 - 100)

-- gruvbox color palette
local colors = {
    dark0_hard = "#1d2021",
    dark0 = "#282828",
    dark0_soft = "#32302f",
    dark1 = "#3c3836",
    dark2 = "#504945",
    dark3 = "#665c54",
    dark4 = "#7c6f64",
    light0_hard = "#f9f5d7",
    light0 = "#fbf1c7",
    light0_soft = "#f2e5bc",
    light1 = "#ebdbb2",
    light2 = "#d5c4a1",
    light3 = "#bdae93",
    light4 = "#a89984",
    bright_red = "#fb4934",
    bright_green = "#b8bb26",
    bright_yellow = "#fabd2f",
    bright_blue = "#83a598",
    bright_purple = "#d3869b",
    bright_aqua = "#8ec07c",
    bright_orange = "#fe8019",
    neutral_red = "#cc241d",
    neutral_green = "#98971a",
    neutral_yellow = "#d79921",
    neutral_blue = "#458588",
    neutral_purple = "#b16286",
    neutral_aqua = "#689d6a",
    neutral_orange = "#d65d0e",
    faded_red = "#9d0006",
    faded_green = "#79740e",
    faded_yellow = "#b57614",
    faded_blue = "#076678",
    faded_purple = "#8f3f71",
    faded_aqua = "#427b58",
    faded_orange = "#af3a03",
    gray = "#928374",
}

-- options (dark mode by default)
local bg0 = colors.dark0
local bg1 = colors.dark1
local bg2 = colors.dark2
local bg3 = colors.dark3
local bg4 = colors.dark4

local fg0 = colors.light0
local fg1 = colors.light1
local fg2 = colors.light2
local fg3 = colors.light3
local fg4 = colors.light4

local red = colors.bright_red
local green = colors.bright_green
local yellow = colors.bright_yellow
local blue = colors.bright_blue
local purple = colors.bright_purple
local aqua = colors.bright_aqua
local orange = colors.bright_orange
local gray = colors.gray
local sign_column = bg0

-- global settings
local settings = {
    bg = "dark",
    contrast_dark = "hard",
    contrart_light = "medium",
    bold = true,
    italic = true,
    undercurl = true,
    underline = true,
    inverse = true,
    improved_strings = false,
    improved_warnings = false,
    invert = false,
    invert_signs = false,
    invert_selection = true,
    invert_tabline = false,
    italicize_comments = true,
    italicize_strings = false,
}

local styles = {
    italic = "italic",
    inverse = "inverse",
    bold = "bold",
    undercurl = "undercurl",
    underline = "underline",
}

-- handle light/dark contrast settings
if settings.contrast == "hard" then
    bg0 = colors[settings.bg .. "0_hard"]
elseif settings.contrast == "soft" then
    bg0 = colors[settings.bg .. "0_soft"]
end

-- swap colors if light mode
if settings.bg == "light" then
    bg0 = colors.light0
    bg1 = colors.light1
    bg2 = colors.light2
    bg3 = colors.light3
    bg4 = colors.light4

    fg0 = colors.dark0
    fg1 = colors.dark1
    fg2 = colors.dark2
    fg3 = colors.dark3
    fg4 = colors.dark4

    red = colors.faded_red
    green = colors.faded_green
    yellow = colors.faded_yellow
    blue = colors.faded_blue
    purple = colors.faded_purple
    aqua = colors.faded_aqua
    orange = colors.faded_orange
end

local hls_cursor = hsl(orange)
if vim.g.gruvbox_hls_cursor ~= nil then
    hls_cursor = hsl(colors[vim.g.gruvbox_hls_cursor])
end

local hls_highlight = hsl(yellow)
if vim.g.gruvbox_hls_cursor ~= nil then
    hls_highlight = hsl(colors[vim.g.gruvbox_hls_highlight])
end

local number_column
if vim.g.gruvbox_number_column ~= nil then
    number_column = hsl(colors[vim.g.gruvbox_number_column])
end

local color_column = hsl(bg1)
if vim.g.gruvbox_color_column ~= nil then
    color_column = hsl(colors[vim.g.gruvbox_color_column])
end

local vert_split = hsl(bg0)
if vim.g.gruvbox_vert_split ~= nil then
    vert_split = hsl(colors[vim.g.gruvbox_vert_split])
end

local invert_signs
if vim.g.gruvbox_invert_signs then invert_signs = styles.inverse end

local invert_selection = styles.inverse
if not vim.g.gruvbox_invert_selection then invert_selection = nil end

local invert_tabline
if vim.g.gruvbox_invert_tabline then invert_tabline = styles.inverse end

local tabline_sel = hsl(green)
if vim.g.gruvbox_tabline_sel then tabline_sel = hsl(colors[vim.g.gruvbox_tabline_sel]) end

local italic_comments = styles.italic
-- if not vim.g.gruvbox_italicize_comments then
--    italic_comments = ""
-- end

local italic_strings = "NONE"
if vim.g.gruvbox_italicize_strings then italic_strings = styles.italic end

local improved_strings_fg = hsl(fg1)
local improved_strings_bg = hsl(bg1)
local improved_strings_gui = italic_strings

local special_string_fg = hsl(orange)
local special_string_bg = hsl(bg1)
local special_string_gui = italic_strings

if not vim.g.gruvbox_improved_strings then
    improved_strings_fg = hsl(green)
    improved_strings_bg = nil

    special_string_bg = nil
    special_string_gui = nil
end

-- neovim terminal mode colors
vim.g.terminal_color_0 = bg0
vim.g.terminal_color_8 = gray
vim.g.terminal_color_1 = colors.neutral_red
vim.g.terminal_color_2 = red
vim.g.terminal_color_10 = green
vim.g.terminal_color_3 = colors.neutral_yellow
vim.g.terminal_color_11 = yellow
vim.g.terminal_color_4 = colors.neutral_blue
vim.g.terminal_color_12 = blue
vim.g.terminal_color_5 = colors.neutral_purple
vim.g.terminal_color_13 = purple
vim.g.terminal_color_6 = colors.neutral_aqua
vim.g.terminal_color_14 = aqua
vim.g.terminal_color_7 = fg4
vim.g.terminal_color_15 = fg1

-- Note: Some CursorLine highlighting will obscure any other highlighing on the
--       current line until you move your cursor.
--
--       You can disable the cursor line temporarily with:
--
--       `setlocal nocursorline`

-- Lush.hsl provides a number of conveniece functions for:
--
--   Relative adjustment: rotate(), saturate(), desaturate(), lighten(), darken()
--                        aliased to ro(), sa() de(), li(), da()
--   Overide:             hue(), saturation(), lightness()
--   Access:              .h, .s, .l
--   Coercion:            tostring(), "Concatenation: " .. color

-- To define our colour scheme, we will write what is called a lush-spec.
-- We will use lush.hsl as an aid.

-- A lush-spec function which returns a table, which defines our
-- highlight groups. It's usage is much simpler than it reads.
-- We'll define our lush-spec below.

-- Call lush with our lush-spec.
local theme = lush(function()
    return {
        -- lush-spec statements are in the form:
        --
        -- <HighlightGroupName> { bg = <hsl>, fg = <hsl>, sp = <hsl>, gui = <string> },
        -- Base groups

        -- LuaFormatter off
        GruvboxFg0({fg = fg0}),
        GruvboxFg1({fg = fg1}),
        GruvboxFg2({fg = fg2}),
        GruvboxFg3({fg = fg3}),
        GruvboxFg4({fg = fg4}),
        GruvboxGray({fg = gray}),
        GruvboxBg0({fg = bg0}),
        GruvboxBg1({fg = bg1}),
        GruvboxBg2({fg = bg2}),
        GruvboxBg3({fg = bg3}),
        GruvboxBg4({fg = bg4}),
        GruvboxRed({fg = red}),
        GruvboxRedBold({fg = red, gui = styles.bold}),
        GruvboxGreen({fg = green}),
        GruvboxGreenBold({fg = green, gui = styles.bold}),
        GruvboxYellow({fg = yellow}),
        GruvboxYellowBold({fg = yellow, gui = styles.bold}),
        GruvboxBlue({fg = blue}),
        GruvboxBlueBold({fg = blue, gui = styles.bold}),
        GruvboxPurple({fg = purple}),
        GruvboxPurpleBold({fg = purple, gui = styles.bold}),
        GruvboxAqua({fg = aqua}),
        GruvboxAquaBold({fg = aqua, gui = styles.bold}),
        GruvboxOrange({fg = orange}),
        GruvboxOrangeBold({fg = orange, gui = styles.bold}),

        GruvboxRedSign({fg = red, bg = sign_column, gui = invert_signs}),
        GruvboxGreenSign({fg = green, bg = sign_column, gui = invert_signs}),
        GruvboxYellowSign({fg = yellow, bg = sign_column, gui = invert_signs}),
        GruvboxBlueSign({fg = blue, bg = sign_column, gui = invert_signs}),
        GruvboxPurpleSign({fg = purple, bg = sign_column, gui = invert_signs}),
        GruvboxAquaSign({fg = aqua, bg = sign_column, gui = invert_signs}),
        GruvboxOrangeSign({fg = orange, bg = sign_column, gui = invert_signs}),

        GruvboxRedUnderline({gui = styles.undercurl, sp = red}),
        GruvboxGreenUnderline({gui = styles.undercurl, sp = green}),
        GruvboxYellowUnderline({gui = styles.undercurl, sp = yellow}),
        GruvboxBlueUnderline({gui = styles.undercurl, sp = blue}),
        GruvboxPurpleUnderline({gui = styles.undercurl, sp = purple}),
        GruvboxAquaUnderline({gui = styles.undercurl, sp = aqua}),
        GruvboxOrangeUnderline({gui = styles.undercurl, sp = orange}),

        ColorColumn({bg = color_column}),
        Conceal({fg = blue}),
        Cursor({gui = styles.inverse}),
        lCursor({Cursor}),
        iCursor({Cursor}),
        vCursor({Cursor}),
        CursorIM({Cursor}),
        CursorLine({bg = bg1}),
        CursorColumn({CursorLine}),
        Directory({GruvboxRedBold}),
        DiffAdd({fg = green, bg = bg0, gui = invert_signs}),
        DiffChange({fg = aqua, bg = bg0, gui = invert_signs}),
        DiffDelete({fg = red, bg = bg0, gui = invert_signs}),
        DiffText({fg = yellow, bg = bg0, gui = invert_signs}),
        ErrorMsg({fg = bg0, bg = red, gui = styles.bold}),
        VertSplit({fg = bg3, bg = vert_split}),
        Folded({fg = gray, bg = bg1, gui = italic_strings}),
        FoldColumn({fg = gray, bg = bg1}),
        SignColumn({bg = sign_column}),
        IncSearch({fg = hls_cursor, bg = bg0, gui = styles.inverse}),
        LineNr({fg = bg4, bg = number_column}),
        CursorLineNr({fg = yellow, bg = bg1}),
        MatchParen({bg = bg3, gui = styles.bold}),
        ModeMsg({GruvboxYellowBold}),
        MoreMsg({GruvboxYellowBold}),
        NonText({GruvboxBg2}),
        Normal({fg = fg1, bg = bg0}),
        NormalFloat({Normal}),
        NormalNC({Normal}),
        Pmenu({fg = fg1, bg = bg2}),
        PmenuSel({fg = bg2, bg = blue, gui = styles.bold}),
        PmenuSbar({bg = bg2}),
        PmenuThumb({bg = bg4}),
        Question({GruvboxOrangeBold}),
        QuickFixLine({fg = bg0, bg = yellow, gui = styles.bold}),
        Search({fg = hls_highlight, bg = bg0, gui = styles.inverse}),
        SpecialKey({GruvboxFg4}),
        SpellRare({GruvboxPurpleUnderline}),
        SpellBad({GruvboxRedUnderline}),
        TabLineFill({fg = bg4, bg = bg1, gui = invert_tabline}),
        TabLine({fg = bg4, bg = bg1, gui = invert_tabline}),
        TabLineSel({fg = tabline_sel, bg = bg1, gui = invert_tabline}),
        Title({GruvboxGreenBold}),
        Visual({bg = bg3, gui = invert_selection}),
        VisualNOS({Visual}),
        WarningMsg({GruvboxRedBold}),
        WildMenu({fg = blue, bg = bg2, gui = styles.bold}),
        Constant({GruvboxPurple}),
        -- Special {fg = special_string_fg, bg = special_string_bg, gui = special_string_gui},
        Special({}),
        String({
            fg = improved_strings_fg,
            bg = improved_strings_bg,
            gui = improved_strings_gui,
        }),
        Character({GruvboxPurple}),
        Number({GruvboxPurple}),
        Boolean({GruvboxPurple}),
        Float({GruvboxPurple}),
        Identifier({GruvboxBlue}),
        Function({GruvboxGreenBold}),
        Statement({GruvboxRed}),
        Conditional({GruvboxRed}),
        Repeat({GruvboxRed}),
        Label({GruvboxRed}),
        Exception({GruvboxRed}),
        Keyword({GruvboxRed}),
        Operator({GruvboxFg1}),
        PreProc({GruvboxAqua}),
        Include({GruvboxAqua}),
        Define({GruvboxAqua}),
        Macro({GruvboxAqua}),
        PreCondit({GruvboxAqua}),
        Type({GruvboxYellow}),
        StorageClass({GruvboxOrange}),
        Structure({GruvboxAqua}),
        Typedef({GruvboxYellow}),
        SpecialChar({GruvboxRed}),
        Tag({GruvboxAquaBold}),
        Delimiter({GruvboxFg0}), 
        Comment {fg = gray, gui = italic_comments},
        Debug({GruvboxRed}),
        Underlined({fg = blue, gui = styles.underline}),
        Bold({gui = styles.bold}),
        Italic({gui = styles.italic}),
        Ignore({}),
        Error({fg = red, gui = styles.bold .. "," .. styles.inverse}),
        -- Todo {fg = fg0, gui = styles.bold .. "," .. italic_comments},
        Todo({fg = fg0, gui = styles.bold}),
        -- LSP
        LspDiagnosticsDefaultError({GruvboxRed}),
        LspDiagnosticsSignError({GruvboxRedSign}),
        LspDiagnosticsUnderlineError({GruvboxRedUnderline}),
        LspDiagnosticsDefaultWarning({GruvboxYellow}),
        LspDiagnosticsSignWarning({GruvboxYellowSign}),
        LspDiagnosticsUnderlineWarning({GruvboxYellowUnderline}),
        LspDiagnosticsDefaultInformation({GruvboxBlue}),
        LspDiagnosticsSignInformation({GruvboxBlueSign}),
        LspDiagnosticsUnderlineInformation({GruvboxBlueUnderline}),
        LspDiagnosticsDefaultHint({GruvboxAqua}),
        LspDiagnosticsSignHint({GruvboxAquaSign}),
        LspDiagnosticsUnderlineHint({GruvboxAquaUnderline}),
        -- nvim-treesitter
        TSNone({}),
        TSError({Error}),
        TSTitle({Title}),
        TSLiteral({String}),
        TSURI({Underlined}),
        TSVariable({Special}),
        TSPunctDelimiter({Delimiter}),
        TSPunctBracket({Delimiter}),
        TSPunctSpecial({Delimiter}),
        TSConstant({Constant}),
        TSConstBuiltin({Special}),
        TSConstMacro({Define}),
        TSString({String}),
        TSStringRegex({String}),
        TSStringEscape({SpecialChar}),
        TSCharacter({Character}),
        TSNumber({Number}),
        TSBoolean({Boolean}),
        TSFloat({Float}),
        TSFunction({Function}),
        TSFuncBuiltin({Special}),
        TSFuncMacro({Macro}),
        TSParameter({Identifier}),
        TSParameterReference({TSParameter}),
        TSMethod({Function}),
        TSField({Identifier}),
        TSProperty({Identifier}),
        TSConstructor({Special}),
        TSAnnotation({PreProc}),
        TSAttribute({PreProc}),
        TSNamespace({Include}),
        TSConditional({Conditional}),
        TSRepeat({Repeat}),
        TSLabel({Label}),
        TSOperator({Operator}),
        TSKeyword({Keyword}),
        TSKeywordFunction({Keyword}),
        TSKeywordOperator({TSOperator}),
        TSException({Exception}),
        TSType({Type}),
        TSTypeBuiltin({Type}),
        TSInclude({Include}),
        TSVariableBuiltin({Special}),
        TSText({TSNone}),
        TSStrong({gui = styles.bold}),
        TSEmphasis({gui = italic_strings}),
        TSUnderline({gui = styles.underline}),

        -- json
        jsonKeyword({GruvboxGreen}),
        jsonQuote({GruvboxGreen}),
        jsonBraces({GruvboxFg1}),
        jsonString({GruvboxFg1}),

        -- Plugin: start-screen
        StartifyBracket({Delimiter}),
        StartifyFile({Identifier}),
        StartifyNumber({Number}),
        StartifyPath({Directory}),
        StartifySlash({Delimiter}),
        StartifySection({Statement}),
        StartifySpecial({Comment}),
        StartifyHeader({Title}),
        StartifyFooter({Title}),
        StartifyVar({StartifyPath}),
        StartifySelect({Title}), 

        -- Plugin: Telescope
        TelescopeSelection({GruvboxOrangeBold}),
        TelescopeSlectionCaret({GruvboxRed}),
        TelescopeMultiSelection({GruvboxGray}),
        TelescopeNormal({GruvboxFg1}),
        TelescopeBorder({TelescopeNormal}),
        TelescopePromptBorder({TelescopeNormal}),
        TelescopeResultsBorder({TelescopeNormal}),
        TelescopePreviewBorder({TelescopeNormal}),
        TelescopeMatching({GruvboxBlue}),
        TelescopePromptPrefix({GruvboxRed}),
        TelescopePrompt({TelescopeNormal}),

        -- Plugin: signify
        SignifySignAdd({GruvboxGreenSign}),
        SignifySignChange({GruvboxAquaSign}),
        SignifySignDelete({GruvboxRedSign}),

        --statusline
        StatusLine({fg = fg1, bg = bg1}),
        StatusLineNC({fg = fg1, bg = bg0}),
        StatuslineGreen{StatusLine, fg = green},
        StatuslineYellow{StatusLine, fg = yellow},
        StatusLineRed{StatusLine, fg = red},
        StatuslineGit{StatusLine, fg = green},
        
        StatusLineLineCol{StatusLine, fg = bg1, bg = blue},
        StatusLineLineColInv{StatusLineLineCol, gui = styles.inverse},

        StatusLineModeNormal({fg=bg1, bg=fg1, gui = styles.bold}),
        StatusLineModeNormalInv{StatusLineModeNormal, gui = styles.inverse},
        StatusLineModeVisual({fg=bg1, bg=orange, gui = styles.bold}),
        StatusLineModeVisualInv{StatusLineModeVisual, gui = styles.inverse},
        StatusLineModeSelect({fg=bg1, bg=fg1, gui = styles.bold}),
        StatusLineModeSelectInv{StatusLineModeSelect, gui = styles.inverse},
        StatusLineModeInsert({fg=bg1, bg=blue, gui = styles.bold}),
        StatusLineModeInsertInv{StatusLineModeInsert, gui = styles.inverse},
        StatusLineModeReplace({fg=bg1, bg=red, gui = styles.bold}),
        StatusLineModeReplaceInv{StatusLineModeReplace, gui = styles.inverse},
        StatusLineModeCommand({fg=bg1, bg=green, gui = styles.bold}),
        StatusLineModeCommandInv{StatusLineModeCommand, gui = styles.inverse},
        StatusLineModePrompt({fg=bg1, bg=fg1, gui = styles.bold}),
        StatusLineModePromptInv{StatusLineModePrompt, gui = styles.inverse},
        StatusLineModeTerminal({fg=bg1, bg=yellow, gui = styles.bold}),
        StatusLineModeTerminalInv{StatusLineModeTerminal, gui = styles.inverse},
        StatusLineModeUnknown ({fg=bg1, bg=red, gui = styles.bold}),
        StatusLineModeUnknownInv{StatusLineModeUnknown, gui = styles.inverse},

        -- LuaFormatter on

    }
end)

-- return our parsed theme for extension or use else where.
return theme
