-- local theme = require("polarmutex.colorschemes.gruvbox")
local has_lsp_status, lsp_status = pcall(require, "lsp-status")
local M = {}

local active_sep = "rounded"

M.separators = {
    arrow = {"", ""},
    normal = {"", ""},
    rounded = {"", ""},
    blanck = {"", ""}
}

M.icons = {
    locked = "🔒",
    unsaved = "",
    warning = "",
    error = "ﳛ",
    branch = " "
}

M.colors = {
    active = "%#GruvboxGreenBold#",
    inactive = "%#GruvboxBg0#",
    mode = "%#GruvboxGreen#",
    mode_alt = "%#GruvboxBg0#",
    git = "%#GruvboxGreen#",
    git_alt = "%#GruvboxBg0#",
    filetype = "%#GruvboxGreen#",
    filetype_alt = "%#GruvboxBg0#",
    line_col = "%#GruvboxGreen#",
    line_col_alt = "%#GruvboxBg0#"
}

M.trunc_width = setmetatable({git_status = 90, filename = 140}, {
    __index = function()
        return 80
    end
})

M.is_truncated = function(_, width)
    local current_width = vim.api.nvim_win_get_width(0)
    return current_width < width
end

M.modes = {
    ["n"] = {"N", "Normal", "%#GruvboxGreenBold#"},
    ["no"] = {"N·P", "N·Pending", "%#GruvboxFg3#"},

    ["v"] = {"V", "Visual", "%#GruvboxOrange#"},
    ["V"] = {"V", "V·Line", "%#GruvboxOrang#"},
    [""] = {"V", "V·Block", "%#GruvboxOrange#"},

    ["s"] = {"S", "Select", "%#GruvboxFg3#"},
    ["S"] = {"S", "S·Line", "%#GruvboxFg3#"},
    [""] = {"S", "S·Block", "%#GruvboxFg3#"},

    ["i"] = {"I", "Insert", "%#GruvboxBlue#"},
    ["ic"] = {"I", "Insert", "%#GruvboxBlue#"},

    ["R"] = {"R", "Replace", "%#GruvboxRed#"},
    ["Rv"] = {"V", "V·Replace", "%#GruvboxFg3#"},

    ["c"] = {"C", "Command", "%#GruvboxGreen#"},
    ["cv"] = {"C", "Vim·Ex", "%#GruvboxGreen#"},
    ["ce"] = {"C", "Ex", "%#GruvboxGreen#"},

    ["r"] = {"E", "Prompt", "%#GruvboxFg3#"},
    ["rm"] = {"M", "More", "%#GruvboxFg3#"},
    ["r?"] = {"C", "Confirm", "%#GruvboxFg3#"},

    ["!"] = {"S", "SHELL", "%#GruvboxFg3#"},

    ["t"] = {"T", "TERMINAL", "%#GruvboxYellow#"},

    __index = function()
        return {"U", "Unknown", "%#GruvboxRed#"} -- handle edge cases
    end
}

M.get_current_mode = function(self)
    local current_mode = vim.api.nvim_get_mode().mode
    if self:is_truncated(self.trunc_width.mode) then
        return "1" -- string.format(" %s ", self.modes[current_mode][1]):upper()
    end
    return string.format(" %s ", self.modes[current_mode][2]):upper()
end

M.get_git_status = function(self)
    -- use fallback because it doesn't set this variable on the initial `BufEnter`
    local signs = vim.b.gitsigns_status_dict or
                      {head = "", added = 0, changed = 0, removed = 0}
    local is_head_empty = signs.head ~= ""

    if self:is_truncated(self.trunc_width.git_status) then
        return is_head_empty and string.format("  %s ", signs.head or "") or ""
    end

    return is_head_empty and
               string.format(" +%s ~%s -%s |  %s ", signs.added, signs.changed,
                             signs.removed, signs.head) or ""
end

M.get_filename = function(self)
    if self:is_truncated(self.trunc_width.filename) then
        return " %<%f "
    end
    return " %<%F "
end

M.get_filetype = function()
    local file_name, file_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
    local icon = require("nvim-web-devicons").get_icon(file_name, file_ext,
                                                       {default = true})
    local filetype = vim.bo.filetype

    if filetype == "" then
        return " No FT "
    end
    return string.format(" %s %s ", icon, filetype):lower()
end

M.get_lsp_status_message = function()
    local clients = vim.lsp.buf_get_clients(0)
    local connected = not vim.tbl_isempty(clients)
    if connected then
        local all_messages = lsp_status.messages()
        for _, msg in ipairs(all_messages) do
            if msg.name then
                local contents
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
end

M.get_lsp_connection = function()
    local clients = vim.lsp.buf_get_clients(0)
    local connected = not vim.tbl_isempty(clients)
    if connected then
        local status = " " .. "" .. " ( "
        for _, client in ipairs(clients) do
            status = status .. client.name .. " "
        end
        status = status .. ") "
        return status
    else
        return ""
    end
end

M.get_diagnostic_warn = function(self)
    local n = vim.lsp.diagnostic.get_count(0, "Warning")
    if n == 0 then
        return ""
    end
    return string.format(" %s %d ", self.icons.warning, n)
end

M.get_diagnostic_error = function(self)
    local n = vim.lsp.diagnostic.get_count(0, "Error")
    if n == 0 then
        return ""
    end
    return string.format(" %s %d ", self.icons.error, n)
end

M.get_line_col = function()
    return string.format(" %s:%s ", vim.fn.line("."), vim.fn.col("."))
end

M.set_active = function(self)
    local colors = self.colors

    local mode = colors.mode .. self:get_current_mode()
    -- local mode_alt = colors.mode_alt .. self.separators[active_sep][1]
    -- local git = colors.git .. self:get_git_status()
    -- local git_alt = colors.git_alt .. self.separators[active_sep][1]
    -- local filename = colors.inactive .. self:get_filename()
    -- local filetype_alt = colors.filetype_alt .. self.separators[active_sep][2]
    -- local filetype = colors.filetype .. self:get_filetype()
    -- local line_col = colors.line_col .. self:get_line_col()
    -- local line_col_alt = colors.line_col_alt .. self.separators[active_sep][2]

    return table.concat({mode}) -- mode_alt -- git, git_alt, -- file icon
    -- filename, -- file status
    -- "%=", -- lsp status messages
    -- "%=" -- filetype_alt, filetype, -- lsp connection
    -- diag warning
    -- diag error
    -- line_col, line_col_alt
end

M.set_inactive = function(self)
    return self.colors.inactive .. "%= %F %="
end

M.set_explorer = function(self)
    local title = self.colors.mode .. "   "
    local title_alt = self.colors.mode_alt .. self.separators[active_sep][2]

    return table.concat({self.colors.active, title, title_alt})
end

Statusline = setmetatable(M, {
    __call = function(statusline, mode)
        if mode == "active" then
            return statusline:set_active()
        end
        if mode == "inactive" then
            return statusline:set_inactive()
        end
        if mode == "explorer" then
            return statusline:set_explorer()
        end
    end
})

-- set statusline
-- TODO: replace this once we can define autocmd using lua
vim.api.nvim_exec([[
    augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
    au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
    augroup END
]], false)
