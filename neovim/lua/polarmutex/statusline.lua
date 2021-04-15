local theme = require("polarmutex.colorschemes.gruvbox")
local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")
local extension = require("galaxyline.provider_extensions")
local fileinfo = require("galaxyline.provider_fileinfo")
local diagnostic = require("galaxyline.provider_diagnostic")
local vcs = require("galaxyline.provider_vcs")
local has_lsp_status, lsp_status = pcall(require, "lsp-status")

local sep = {
    left_filled = " ", -- e0b2
    right_filled = " ", -- e0b0
    left = " ", -- e0b3
    right = " ", -- e0b1
    left_rounded = " ",
    right_rounded = " ",
}

local icons = {
    locked = "🔒",
    unsaved = "",
    warning = "",
    error = "ﳛ",
    branch = " ",
}

function condition.checkwidth()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 50 then return true end
    return false
end

local function buffer_not_empty()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then return true end
    return false
end

local function highlight(group, fg, bg, gui)
    local cmd = string.format("highlight %s guifg=%s guibg=%s", group, fg, bg)
    if gui ~= nil then cmd = cmd .. " gui=" .. gui end
    vim.cmd(cmd)
end

local mode_map = {
    n = {"N", "NORMAL", tostring(theme.GruvboxFg3.fg)},
    i = {"I", "INSERT", tostring(theme.GruvboxBlue.fg)},
    c = {"C", "COMMAND", tostring(theme.GruvboxGreen.fg)},
    V = {"V", "VISUAL", tostring(theme.GruvboxOrange.fg)},
    [""] = {"V", "VISUAL", tostring(theme.GruvboxOrange.fg)},
    v = {"V", "VISUAL", tostring(theme.GruvboxOrange.fg)},
    ["r?"] = {"C", ":CONFIRM", tostring(theme.GruvboxFg3.fg)},
    rm = {"M", "--MORE", tostring(theme.GruvboxFg3.fg)},
    R = {"R", "REPLACE", tostring(theme.GruvboxRed.fg)},
    Rv = {"V", "VIRTUAL", tostring(theme.GruvboxFg3.fg)},
    s = {"S", "SELECT", tostring(theme.GruvboxFg3.fg)},
    S = {"S", "SELECT", tostring(theme.GruvboxFg3.fg)},
    ["r"] = {"E", "HIT-ENTER", tostring(theme.GruvboxFg3.fg)},
    [""] = {"S", "SELECT", tostring(theme.GruvboxFg3.fg)},
    t = {"T", "TERMINAL", tostring(theme.GruvboxYellow.fg)},
    ["!"] = {"S", "SHELL", tostring(theme.GruvboxFg3.fg)},
}

gls.left = {
    {
        Mode = {
            provider = function()
                highlight("GalaxyLineMode", tostring(theme.GruvboxBg0.fg),
                          mode_map[vim.fn.mode()][3], "bold")
                highlight("GalaxyLineModeInv", mode_map[vim.fn.mode()][3],
                          tostring(theme.GruvboxBg2.fg), "bold")
                if not condition.checkwidth() then
                    return string.format("  %s ", mode_map[vim.fn.mode()][1])
                end
                return string.format("  %s ", mode_map[vim.fn.mode()][2])
            end,
            highlight = "GalaxyLineMode",
            separator = sep.right_rounded,
            separator_highlight = "GalaxyLineModeInv",
        },
    }, {
        GitBranch = {
            provider = "GitBranch",
            icon = icons.branch,
            condition = vcs.check_git_workspace,
            highlight = {theme.GruvboxGreen.fg, theme.GruvboxBg2.fg},
        },
    }, {
        FileIcon = {
            provider = "FileIcon",
            condition = buffer_not_empty,
            highlight = {
                require("galaxyline.provider_fileinfo").get_file_icon_color,
                theme.GruvboxBg2.fg,
            },
        },
    }, {
        FileName = {
            provider = {"FileName"},
            condition = buffer_not_empty,
            highlight = {theme.GruvboxFg2.fg, theme.GruvboxBg2.fg},
        },
    }, {
        FileStatus = {
            provider = function()
                local status = ""
                if vim.bo.readonly then
                    status = status .. " " .. icons.locked
                end
                if vim.bo.modified then
                    status = status .. " " .. icons.unsaved
                end
                return " " .. status .. " "
            end,
            highlight = {theme.GruvboxRed.fg, theme.GruvboxBg2.fg},
        },
    },
}

gls.mid = {
    {
        LspStatusMsgs = {
            provider = function()
                local clients = vim.lsp.buf_get_clients(0)
                local connected = not vim.tbl_isempty(clients)
                if connected then
                    local all_messages = lsp_status.messages()
                    for _, msg in ipairs(all_messages) do
                        if msg.name then
                            local contents = ""
                            if msg.progress then
                                contents = msg.title
                                if msg.message then
                                    contents = contents .. " " .. msg.message
                                end

                                if msg.percentage then
                                    contents = contents .. " (" .. msg.percentage .. ")"
                                end
                            elseif msg.status then
                                contents = msg.content
                            else
                                contents = msg.content
                            end

                            return " " .. contents .. " "
                        end
                    end
                    return ""
                else
                    return ""
                end
            end,
            highlight = {theme.GruvboxFg2.fg, theme.GruvboxBg2.fg},
        },
    },
}

gls.right = {
    {
        FileType = {
            provider = function()
                if not buffer_not_empty() then return "" end
                local icon = icons[vim.bo.fileformat] or ""
                return string.format(" %s %s ", icon, vim.bo.filetype)
            end,
            highlight = {theme.GruvboxFg2.fg, theme.GruvboxBg2.fg},
        },
    }, {
        LspStatus = {
            provider = function()
                local clients = vim.lsp.buf_get_clients(0)
                local connected = not vim.tbl_isempty(clients)
                if connected then
                    local status = " " .. "" .. " ( "
                    for id, client in ipairs(clients) do
                        status = status .. client.name .. " "
                    end
                    status = status .. ") "
                    return status
                else
                    return ""
                end
            end,
            highlight = {theme.GruvboxGreen.fg, theme.GruvboxBg2.fg},
        },
    }, {
        DiagnosticWarn = {
            provider = function()
                local n = vim.lsp.diagnostic.get_count(0, "Warning")
                if n == 0 then return "" end
                return string.format(" %s %d ", icons.warning, n)
            end,
            highlight = {theme.GruvboxYellow.fg, theme.GruvboxBg2.fg},
        },
        DiagnosticError = {
            -- provider = diagnostic.get_diagnostic_error,
            provider = function()
                local n = vim.lsp.diagnostic.get_count(0, "Error")
                if n == 0 then return "" end
                return string.format(" %s %d ", icons.error, n)
            end,
            highlight = {theme.GruvboxRed.fg, theme.GruvboxBg2.fg},
        },
    }, {
        PositionInfo = {
            provider = {
                function()
                    return string.format(" %s:%s ", vim.fn.line("."), vim.fn.col("."))
                end,
            },
            highlight = {theme.GruvboxBg2.fg, theme.GruvboxBlue.fg, "bold"},
            condition = buffer_not_empty,
            separator = sep.left_rounded,
            separator_highlight = {theme.GruvboxBlue.fg, theme.GruvboxBg2.fg},
        },
    }, {
        PercentInfo = {
            provider = fileinfo.current_line_percent,
            highlight = {theme.GruvboxBg2.fg, theme.GruvboxBlue.fg, "bold"},
            condition = buffer_not_empty,
        },
    }, {
        PosRightRounded = {
            provider = function() return sep.right_rounded end,
            highlight = {theme.GruvboxBlue.fg, theme.GruvboxBg2.fg},
        },
    },
}
