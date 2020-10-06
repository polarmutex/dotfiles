vim.api.nvim_command('set termguicolors')

local Color, colors, Group, groups, styles = require('colorbuddy').setup()

local g = groups
local c = colors
local s = styles

local b = s.bold
local i = s.italic
local n = s.inverse
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local sto = s.standout
local no = s.NONE

Color.new('dark0_hard',     '#1d2021')
Color.new('dark1',          '#3c3836')
Color.new('dark2',          '#504945')
Color.new('dark3',          '#665c54')
Color.new('dark4',          '#7c6f64')
Color.new('dark4_256',      '#7c6f64')

Color.new('gray_245',       '#928374')
Color.new('gray_244',       '#928374')

Color.new('bright_red',     '#fb4934')
Color.new('bright_green',   '#b8bb26')
Color.new('bright_yellow',  '#fabd2f')
Color.new('bright_blue',    '#83a598')
Color.new('bright_purple',  '#d3869b')
Color.new('bright_aqua',    '#8ec07c')
Color.new('bright_orange',  '#fe8019')

Color.new('neutral_red',    '#cc241d')
Color.new('neutral_green',  '#98971a')
Color.new('neutral_yellow', '#d79921')
Color.new('neutral_blue',   '#458588')
Color.new('neutral_purple', '#b16286')
Color.new('neutral_aqua',   '#689d6a')
Color.new('neutral_orange', '#d65d0e')

Color.new('faded_red',      '#9d0006')
Color.new('faded_green',    '#79740e')
Color.new('faded_yellow',   '#b57614')
Color.new('faded_blue',     '#076678')
Color.new('faded_purple',   '#8f3f71')
Color.new('faded_aqua',     '#427b58')
Color.new('faded_orange',   '#af3a03')

-- relative colors
Color.new('bg0',     '#1d2021') -- dark hard
Color.new('bg1',     '#3c3836')
Color.new('bg2',     '#504945')
Color.new('bg3',     '#665c54')
Color.new('bg4',     '#7c6f64')
Color.new('fg0',     '#f9f5d7')
Color.new('fg1',     '#ebdbb2')
Color.new('fg2',     '#d5c4a1')
Color.new('fg3',     '#bdae93')
Color.new('fg4',     '#a89984')
Color.new('fg4_256', '#a89984')
Color.new('red',     '#fb4934')
Color.new('green',   '#b8bb26')
Color.new('yellow',  '#fabd2f')
Color.new('blue',    '#83a598')
Color.new('purple',  '#d3869b')
Color.new('aqua',    '#8ec07c')
Color.new('orange',  '#fe8019')
Color.new('gray',    '#928374')

-- terminal colors
vim.g.terminal_color_0 = colors.bg0.H
vim.g.terminal_color_8 = colors.gray.H

vim.g.terminal_color_1 = colors.neutral_red.H
vim.g.terminal_color_9 = colors.red.H

vim.g.terminal_color_2 = colors.neutral_green.H
vim.g.terminal_color_10 = colors.green.H

vim.g.terminal_color_3 = colors.neutral_yellow.H
vim.g.terminal_color_11 = colors.yellow.H

vim.g.terminal_color_4 = colors.neutral_blue.H
vim.g.terminal_color_12 = colors.blue.H

vim.g.terminal_color_5 = colors.neutral_purple.H
vim.g.terminal_color_13 = colors.purple.H

vim.g.terminal_color_6 = colors.neutral_aqua.H
vim.g.terminal_color_14 = colors.aqua.H

vim.g.terminal_color_7 = colors.fg4.H
vim.g.terminal_color_15 = colors.fg1.H

Group.new('GruvboxFg0',  c.fg0,  c.none, no)
Group.new('GruvboxFg1',  c.fg1,  c.none, no)
Group.new('GruvboxFg2',  c.fg2,  c.none, no)
Group.new('GruvboxFg3',  c.fg3,  c.none, no)
Group.new('GruvboxFg4',  c.fg4,  c.none, no)
Group.new('GruvboxGray', c.gray, c.none, no)
Group.new('GruvboxBg0',  c.bg0,  c.none, no)
Group.new('GruvboxBg1',  c.bg1,  c.none, no)
Group.new('GruvboxBg2',  c.bg2,  c.none, no)
Group.new('GruvboxBg3',  c.bg3,  c.none, no)
Group.new('GruvboxBg4',  c.bg4,  c.none, no)

Group.new('GruvboxRed',        c.red,    c.none, no)
Group.new('GruvboxRedBold',    c.red,    c.none, b)
Group.new('GruvboxGreen',      c.green,  c.none, no)
Group.new('GruvboxGreenBold',  c.green,  c.none, b)
Group.new('GruvboxYellow',     c.yellow, c.none, no)
Group.new('GruvboxYellowBold', c.yellow, c.none, b)
Group.new('GruvboxBlue',       c.blue,   c.none, no)
Group.new('GruvboxBlueBold',   c.blue,   c.none, b)
Group.new('GruvboxPurple',     c.purple, c.none, no)
Group.new('GruvboxPurpleBold', c.purple, c.none, b)
Group.new('GruvboxAqua',       c.aqua,   c.none, no)
Group.new('GruvboxAquaBold',   c.aqua,   c.none, b)
Group.new('GruvboxOrange',     c.orange, c.none, no)
Group.new('GruvboxOrangeBold', c.orange, c.none, b)

Group.new('GruvboxRedSign',        c.red,    c.bg1, no)
Group.new('GruvboxGreenSign',      c.green,  c.bg1, no)
Group.new('GruvboxYellowSign',     c.yellow, c.bg1, no)
Group.new('GruvboxBlueSign',       c.blue,   c.bg1, no)
Group.new('GruvboxPurpleSign',     c.purple, c.bg1, no)
Group.new('GruvboxAquaSign',       c.aqua,   c.bg1, no)
Group.new('GruvboxOrangeSign',     c.orange, c.bg1, no)

Group.new('GruvboxRedUnderline',        c.red,    c.none, uc)
Group.new('GruvboxGreenUnderline',      c.green,  c.none, uc)
Group.new('GruvboxYellowUnderline',     c.yellow, c.none, uc)
Group.new('GruvboxBlueUnderline',       c.blue,   c.none, uc)
Group.new('GruvboxPurpleUnderline',     c.purple, c.none, uc)
Group.new('GruvboxAquaUnderline',       c.aqua,   c.none, uc)
Group.new('GruvboxOrangeUnderline',     c.orange, c.none, uc)

-------------------------------------------------------------
-- Syntax Groups (descriptions and ordering from `:h w18`) --
-------------------------------------------------------------
Group.new('Special', g.GruvboxOrange, g.GruvboxOrange, g.GruvboxOrange) -- any special symbol

Group.new('Comment', c.gray,   c.none, i+b) -- any comment
Group.new('Todo',    g.GruvboxOrange, c.bg0,         b + i) -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
Group.new('Error',   g.GruvboxRed,    c.bg0,         b + r) -- any erroneous construct

Group.new('Statement',   g.GruvboxRed, g.GruvboxRed, g.GruvboxRed) -- any statement
Group.new('Conditional', g.GruvboxRed, g.GruvboxRed, g.GruvboxRed) -- if, then, else, endif, switch, etc.
Group.new('Repeat',      g.GruvboxRed, g.GruvboxRed, g.GruvboxRed) -- for, do, while, etc.
Group.new('Label',       g.GruvboxRed, g.GruvboxRed, g.GruvboxRed) -- case, default, etc.
Group.new('Exception',   g.GruvboxRed, g.GruvboxRed, g.GruvboxRed) -- try, catch, throw
Group.new('Operator',    g.GruvboxFg1, g.GruvboxFg1, g.GruvboxFg1) -- sizeof", "+", "*", etc.
Group.new('Keyword',     g.GruvboxRed, g.GruvboxRed, g.GruvboxRed) -- any other keyword

Group.new('Identifier', g.GruvboxBlue,      g.GruvboxBlue,      g.GruvboxBlue)      -- any variable name
Group.new('Function',   g.GruvboxGreenBold, g.GruvboxGreenBold, g.GruvboxGreenBold) -- function name (also: methods for classes)

Group.new('PreProc',   g.GruvboxAqua, g.GruvboxAqua, g.GruvboxAqua) -- generic Preprocessor
Group.new('Include',   g.GruvboxAqua, g.GruvboxAqua, g.GruvboxAqua) -- preprocessor #include
Group.new('Define',    g.GruvboxAqua, g.GruvboxAqua, g.GruvboxAqua) -- preprocessor #define
Group.new('Macro',     g.GruvboxAqua, g.GruvboxAqua, g.GruvboxAqua) -- same as Define
Group.new('PreCondit', g.GruvboxAqua, g.GruvboxAqua, g.GruvboxAqua) -- preprocessor #if, #else, #endif, etc.

Group.new('Constant',  g.GruvboxPurple, g.GruvboxPurple, g.GruvboxPurple) -- any constant
Group.new('Character', g.GruvboxPurple, g.GruvboxPurple, g.GruvboxPurple) -- a character constant: 'c', '\n'
Group.new('String',    g.GruvboxFg1,    c.none,          i)               -- this is a string
Group.new('Boolean',   g.GruvboxPurple, g.GruvboxPurple, g.GruvboxPurple) -- a boolean constant: TRUE, false
Group.new('Number',    g.GruvboxPurple, g.GruvboxPurple, g.GruvboxPurple) -- a floating point constant: 2.3e10
Group.new('Float',     g.GruvboxPurple, g.GruvboxPurple, g.GruvboxPurple) -- a floating point constant: 2.3e10

Group.new('Type',         g.GruvboxYellow, g.GruvboxYellow, g.GruvboxYellow) -- int, long, char, etc.
Group.new('StorageClass', g.GruvboxYellow, g.GruvboxYellow, g.GruvboxYellow) -- static, register, volatile, etc.
Group.new('Structure',    g.GruvboxYellow, g.GruvboxYellow, g.GruvboxYellow) -- struct, union, enum, etc.
Group.new('Typedef',      g.GruvboxYellow, g.GruvboxYellow, g.GruvboxYellow) -- A typedef

Group.new('SpecialChar', g.GruvboxGreenUnderline) -- special character in a constant
Group.new('Tag', g.GruvboxGreenUnderline) -- you can use CTRL-] on this
Group.new('Delimiter', g.GruvboxGreenUnderline) -- character that needs attention
Group.new('SpecialComment', g.GruvboxGreenUnderline) -- special things inside a comment
Group.new('Debug', g.GruvboxGreenUnderline) -- debugging statements
Group.new('Underlined', c.blue, c.none, ul) -- text that stands out, HTML links
Group.new('Ignore', g.GruvboxGreenUnderline) -- left blank, hidden

--------------------------------------------------------------------------------
-- Highlighting Groups (descriptions and ordering from `:h highlight-groups`) --
--------------------------------------------------------------------------------

Group.new('Normal', g.GruvboxFg1, c.bg0, no) -- normal text

Group.new('CursorLine',   c.none,        c.bg1,         no)
Group.new('CursorColumn', g.CursorLine,  g.CursorLine,  g.CursorLine)
Group.new('TabLineFill',  c.bg4,         c.bg1,         no)
Group.new('TabLineSel',   c.green,       c.bg1,         no)
Group.new('TabLine',      g.TabLineFill, g.TabLineFill, g.TabLineFill)
Group.new('MatchParen',   c.green,       c.bg0,         b + ul) -- The character under the cursor or just before it, if it is a paired bracket, and its match.

Group.new('ColorColumn',  c.none,   c.bg1,  no) --  used for the columns set with 'colorcolumn'
Group.new('Conceal',      c.blue,   c.none, no) -- placeholder characters substituted for concealed text (see 'conceallevel')
Group.new('CursorLineNr', c.yellow, c.bg1,  no) -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

Group.new('NonText',    g.GruvboxBg2, g.GruvboxBg2, g.GruvboxBg2) -- '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
Group.new('SpecialKey', g.GruvboxFg4, g.GruvboxFg4, g.GruvboxFg4) -- Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.

Group.new('Visual',    c.none,   c.bg3,    no)       -- Visual mode selection
Group.new('VisualNOS', g.Visual, g.Visual, g.Visual) -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.

Group.new('Search',    c.yellow, c.bg0, b + r) -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
Group.new('IncSearch', c.orange, c.bg0, b + r) -- 'incsearch' highlighting; also used for the text replaced with ":s///c"

Group.new('QuickFixLine', c.bg0, c.yellow, b) -- Current quickfix item in the quickfix window.

Group.new('StatusLine',   c.fg1, c.bg2, no) -- status line of current window
Group.new('StatusLineNC', c.fg4, c.bg1, no) -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
--Group.new('StatusLineTerm', g.StatusLine, g.StatusLine, g.StatusLine) -- status line of current :terminal window
--Group.new('StatusLineTermNC', g.StatusLineNC, g.StatusLineNC, g.StatusLineNC) -- status line of non-current :terminal window

Group.new('VertSplit', c.bg3, c.bg0, no) -- the column separating verti-- cally split windows

Group.new('WildMenu', c.blue, c.bg2, b) --  current match in 'wildmenu' completion

Group.new('Directory', g.GruvboxGreenBold, g.GruvboxGreenBold, g.GruvboxGreenBold) -- directory names (and other special names in listings)

Group.new('Title', g.GruvboxGreenBold, g.GruvboxGreenBold, g.GruvboxGreenBold) -- titles for output from ":set all", ":autocmd" etc.

Group.new('ErrorMsg',   c.bg0,               c.red,               b)                   -- error messages on the command line
Group.new('MoreMsg',    g.GruvboxYellowBold, g.GruvboxYellowBold, g.GruvboxYellowBold) -- more-prompt
Group.new('ModeMsg',    g.GruvboxYellowBold, g.GruvboxYellowBold, g.GruvboxYellowBold) -- 'showmode' message (e.g., "-- INSERT --")
Group.new('Question',   g.GruvboxOrangeBold, g.GruvboxOrangeBold, g.GruvboxOrangeBold) -- hit-enter prompt and yes/no questions
Group.new('WarningMsg', g.GruvboxRedBold,    g.GruvboxRedBold,    g.GruvboxRedBold)    --  warning messages

Group.new('LineNr',   c.bg4, c.none, no) -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
Group.new('SignColumn', c.none, c.bg1, no) -- column where signs are displayed
Group.new('Folded', c.gray, c.bg1, i) -- line used for closed folds
Group.new('FoldColumn', c.gray, c.bg1, no) -- 'foldcolumn'
Group.new('qfLineNr', g.Type, g.Type, g.Type)

Group.new('Cursor', c.bg0, c.orange, no) -- the character under the cursor
Group.new('CursorIM', c.fg0, c.bg0, r) -- like Cursor, but used when in IME mode

Group.new('Pmenu', c.fg1, c.bg2, no) -- Popup menu: normal item.
Group.new('PmenuSel', c.bg2, c.blue, b) -- Popup menu: selected item.
Group.new('PmenuSbar', c.none, c.bg2, no) -- Popup menu: scrollbar.
Group.new('PmenuThumb', c.none, c.bg4, no) -- Popup menu: Thumb of the scrollbar.

Group.new('DiffAdd',    c.green, c.bg0, r) -- diff mode: Added line
Group.new('DiffChange', c.yellow, c.bg0, r) --  diff mode: Changed line
Group.new('DiffDelete', c.red, c.bg0, r) -- diff mode: Deleted line
Group.new('DiffText',   c.yellow, c.bg0, r) -- diff mode: Changed text within a changed line

Group.new('EndOfBuffer', c.bg0, c.bg0, no) -- filler lines (~) after the last line in the buffer

Group.new('SpellBad', g.GruvboxRedUnderline, g.GruvboxRedUnderline, g.GruvboxRedUnderline) -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
Group.new('SpellCap', g.GruvboxBlueUnderline, g.GruvboxBlueUnderline, g.GruvboxBlueUnderline) -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
Group.new('SpellLocal',g.GruvboxAquaUnderline, g.GruvboxAquaUnderline, g.GruvboxAquaUnderline) -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
Group.new('SpellRare', g.GruvboxPurpleUnderline, g.GruvboxPurpleUnderline, g.GruvboxPurpleUnderline) -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.

--------------------------------
-- Miscellaneous Highlighting --
--------------------------------

Group.new('ToolbarLine', c.fg0, c.bg3, no)
Group.new('ToolbarButton', c.fg0, c.bg3, b)
Group.new('NormalMode', c.fg4, c.bg0, r)
Group.new('InsertMode', c.blue, c.bg0, r)
Group.new('ReplaceMode', c.aqua, c.bg0, r)
Group.new('VisualMode', c.orange, c.bg0, r)
Group.new('CommandMode', c.purple, c.bg0, r)
Group.new('Warnings', c.orange, c.bg0, r)

---------------------
-- Neovim Builtins --
---------------------

-- +- Neovim Support -+
-- Group.new("healthError",c.nord_11, c.nord_1)
-- Group.new("healthSuccess",c.nord_14, c.nord_1)
-- Group.new("healthWarning",c.nord_13, c.nord_1)
-- Group.new("TermCursorNC",c.nord_1, c.nord_1)

-- LSP Groups (descriptions and ordering from `:h lsp-highlight`)
Group.new("LspDiagnosticsError",          g.GruvboxRed, g.GruvboxRed, g.GruvboxRed) -- used for "Error" diagnostic virtual text
Group.new("LspDiagnosticsErrorSign",      g.GruvboxRedSign, g.GruvboxRedSign, g.GruvboxRedSign) -- used for "Error" diagnostic signs in sign column
Group.new("LspDiagnosticsErrorFloating",  g.GruvboxRed, g.GruvboxRed, g.GruvboxRed) -- used for "Error" diagnostic messages in the diagnostics float
Group.new("LspDiagnosticsUnderlineError", g.GruvboxRedUnderline, g.GruvboxRedUnderline, g.GruvboxRedUnderline)

Group.new("LspDiagnosticsWarning",         g.GruvboxYellow, g.GruvboxYellow, g.GruvboxYellow) -- used for "Warning" diagnostic virtual text
Group.new("LspDiagnosticsWarningSign",     g.GruvboxYellowSign, g.GruvboxYellowSign, g.GruvboxYellowSign) -- used for "Warning" diagnostic signs in sign column
Group.new("LspDiagnosticsWarningFloating", g.GruvboxYellow, g.GruvboxYellow, g.GruvboxYellow) -- used for "Warning" diagnostic messages in the diagnostics float
Group.new("LspDiagnosticsUnderlineWarning",  g.GruvboxYellowUnderline, g.GruvboxYellowUnderline, g.GruvboxYellowUnderline)

Group.new("LSPDiagnosticsInformation",          g.GruvboxBlue, g.GruvboxBlue, g.GruvboxBlue) -- used for "Information" diagnostic virtual text
Group.new("LspDiagnosticsInformationSign",      g.GruvboxBlueSign, g.GruvboxBlueSign, g.GruvboxBlueSign)  -- used for "Information" diagnostic signs in sign column
Group.new("LspDiagnosticsInformationFloating",  g.GruvboxBlue, g.GruvboxBlue, g.GruvboxBlue) -- used for "Information" diagnostic messages in the diagnostics float
Group.new("LspDiagnosticsUnderlineInformation", g.GruvboxBlueUnderline, g.GruvboxBlueUnderline, g.GruvboxBlueUnderline)

Group.new("LspDiagnosticsHint",          g.GruvboxAqua, g.GruvboxAqua, g.GruvboxAqua)  -- used for "Hint" diagnostic virtual text
Group.new("LspDiagnosticsHintSign",      g.GruvboxAquaSign, g.GruvboxAquaSign, g.GruvboxAquaSign) -- used for "Hint" diagnostic signs in sign column
Group.new("LspDiagnosticsHintFloating",  g.GruvboxAqua, g.GruvboxAqua, g.GruvboxAqua) -- used for "Hint" diagnostic messages in the diagnostics float
Group.new("LspDiagnosticsUnderlineHint", g.GruvboxAquaUnderline, g.GruvboxAquaUnderline, g.GruvboxAquaUnderline)

Group.new("LspReferenceText",  g.GruvboxGreen, g.GruvboxGreen, g.GruvboxGreen) -- used for highlighting "text" references
Group.new("LspReferenceRead",  g.GruvboxGreen, g.GruvboxGreen, g.GruvboxGreen) -- used for highlighting "read" references
Group.new("LspReferenceWrite", g.GruvboxGreen, g.GruvboxGreen, g.GruvboxGreen) -- used for highlighting "write" references

-- Nvim Treesitter Groups (descriptions and ordering from `:h nvim-treesitter-highlights`)
-- Group.new("TSError", g.Error, c.bg0, b) -- For syntax/parser errors
-- Group.new("TSPunctDelimiter", g.Delimiter, c.bg0) -- For delimiters ie: `.
-- Group.new("TSPunctBracket"       , c.fg     , nil) -- For brackets and parens
-- Group.new("TSPunctSpecial"       , c.fg     , nil) -- For special punctutation that does not fall in the catagories before
-- Group.new("TSConstant", g.Constant, c.bg0) -- For constants
-- Group.new("TSConstBuiltin", g.Constant, c.bg0) -- For constant that are built in the language: `nil` in Lua
-- Group.new("TSConstMacro", g.Constant, c.bg0) -- For constants that are defined by macros: `NULL` in C
-- Group.new("TSString", g.String, c.bg0) -- For strings
-- Group.new("TSStringRegex"        , c.fg_escape_char_construct , nil) -- For regexes
-- Group.new("TSStringEscape"       , c.fg_escape_char_backslash , nil) -- For escape characters within a string
-- Group.new("TSCharacter", g.Character, c.bg0) -- For characters
-- Group.new("TSNumber", g.Number, c.bg0) -- For integers
-- Group.new("TSBoolean", g.Boolean, c.bg0) -- For booleans
-- Group.new("TSFloat", g.Float, c.bg0) -- For floats
-- Group.new("TSFunction", g.Function, c.bg0) -- For function (calls and definitions
-- Group.new("TSFuncBuiltin", g.Function, c.bg0) -- For builtin functions: `table.insert` in Lua
-- Group.new("TSFuncMacro", g.Function, c.bg0) -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
-- Group.new("TSParameter"          , c.cyan              , c.none  , s.none) -- For parameters of a function.
-- Group.new("TSParameterReference" , g.TSParameter     , nil) -- For references to parameters of a function.
-- Group.new("TSMethod", g.Function, c.bg0) -- For method calls and definitions.
-- Group.new("TSField"    , c.magenta_alt_other , c.none  , s.none) -- For fields.
-- Group.new("TSProperty"    , TSField , c.none  , s.none) -- Same as `TSField`.
-- Group.new("TSConstructor"        , c.magenta_alt       , c.none)  -- For constructor calls and definitions: `{}` in Lua, and Java constructors
-- Group.new("TSConditional", g.Conditional, c.bg0) -- For keywords related to conditionnals
-- Group.new("TSRepeat", g.Repeat, c.bg0) -- For keywords related to loops
-- Group.new("TSLabel", g.Label, c.bg0) -- For labels: `label:` in C and `:label:` in Lua
-- Group.new("TSOperator", g.Operator, c.bg0) -- For any operator: `+`, but also `->` and `*` in C
-- Group.new("TSKeyword", g.Keyword, c.bg0) -- For keywords that don't fall in previous categories.
-- Group.new("TSKeywordFunction"    , c.magenta_alt       , c.none  , s.none) -- For keywords used to define a fuction.
-- Group.new("TSException", g.Exception, c.bg0) -- For exception related keywords.
-- Group.new("TSType", g.Type, c.bg0, s.none) -- For types.
-- Group.new("TSTypeBuiltin", g.Type, c.bg0, s.none) -- For builtin types (you guessed it, right ?).
-- Group.new("TSStructure", g.Structure, c.bg0) -- This is left as an exercise for the reader.
-- Group.new("TSInclude", g.Include, c.bg0) -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
-- Group.new("TSAnnotation"         , c.blue , c.none) -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
-- Group.new("TSText"             , c.fg              , c.bg           , b) -- For strings considered text in a markup language.
-- Group.new("TSStrong"             , c.fg              , c.bg           , b) -- For text to be represented with strong.
-- Group.new("TSEmphasis"            , c.blue_alt          , c.none  , b) -- For text to be represented with emphasis.
-- Group.new("TSUnderline"            , c.blue_alt          , c.none  , b) -- TSUnderline
-- Group.new("TSTitle"              , c.cyan_nuanced    , c.none) -- Text that is part of a title.
-- Group.new("TSLiteral"            , c.blue_alt          , c.none  , b) -- Literal text.
-- Group.new("TSURI"           , c.cyan              , c.none  , s.none) -- Any URI like a link or email.
-- Group.new("TSVariable"           , c.cyan              , c.none  , s.none) -- Any URI like a link or email.
-- Group.new("TSVariableBuiltin" , g.magenta_alt_other     , nil) -- Variable names that are defined by the languages, like `this` or `self`.

------------------------------------
-- Language-Specific Highlighting --
------------------------------------
--- TODO

-------------------------
-- Plugin Highlighting --
-------------------------
-- Express-Line
Group.new("ElNormal",      c.bg0, c.fg4, b)
Group.new("ElInsert",      c.bg0, c.red, b)
Group.new("ElReplace",     c.bg0, c.aqua, b)
Group.new("ElCommand",     c.bg0, c.purple, b)
Group.new("ElTerm",        c.bg0, c.green, b)
Group.new("ElVisual",      c.bg0, c.orange, b)
Group.new("ElVisualLine",  g.ElVisual, g.ElVisual, g.ElVisual)
Group.new("ElVisualBlock", g.ElVisual, g.ElVisual, g.ElVisual)

-- start-screen
Group.new("StartifyTitle",   c.red, c.none, b)
Group.new("StartifyBracket", c.blue, c.none, no)
Group.new("StartifyNumber",  c.yellow, c.none, b)
Group.new("StartifyPath",    c.orange, c.none, no)

-- Signify (mhinz/vim-signify)
Group.new('SignifySignAdd', g.GruvboxGreenSign, g.GruvboxGreenSign, g.GruvboxGreenSign)
Group.new('SignifySignChange', g.GruvboxYellowSign, g.GruvboxYellowSign, g.GruvboxYellowSign)
Group.new('SignifySignDelete', g.GruvboxRedSign, g.GruvboxRedSign, g.GruvboxRedSign)

-- Which Key (liuchengxu/vim-which-key)
Group.new('WhichKey',          c.green, c.bg0, no)
Group.new('WhichKeySeperator', c.green, c.bg0, no)
Group.new('WhichKeyGroup',     c.red, c.bg0, no)
Group.new('WhichKeyDesc',      c.blue, c.bg0, no)
Group.new('WhichKeyFloating',  c.bg0, c.none, no)

