local M = {}

WindowId = WindowId or -1
BufferId = BufferId or -1

local function is_window_open()
    return vim.api.nvim_win_is_valid(WindowId)
end

local function close_window()
    vim.api.nvim_win_close(WindowId, true)
    WindowId = -1
end

local function buffer_exists()
    return BufferId and vim.api.nvim_buf_is_valid(BufferId)
end

local function create_buffer()
    BufferId = vim.api.nvim_create_buf(false, true)
end

local function open_window()
    if not buffer_exists() then
        create_buffer()
    end

    local vimstats = vim.api.nvim_list_uis()[1]
    local width = vimstats.width
    local height= vimstats.height

    local rowPadding = 6
    local rowHalfPadding = math.floor(rowPadding / 2)
    local colPadding = 6
    local colHalfPadding = math.floor(rowPadding / 2)
    local row = rowHalfPadding
    local col = colHalfPadding
    width = width - colPadding
    height = height - rowPadding

    WindowId = vim.api.nvim_open_win(BufferId, true, {
        relative='win', row=row, col=col, width=width, height=height, style='minimal'
    })

    local buffer_name = vim.api.nvim_buf_get_name(BufferId)

    if not string.match(buffer_name, "^term:") then
        vim.api.nvim_command("terminal")
    end
end

function M.toggle()
    if is_window_open() then
        print("closing")
        close_window()
        return
    end
    print("opening")
    open_window()
end

return M
