local M = {}

M.setup = function()
    require('harpoon').setup({
        terminal = {
        ["~/repos/brianryall.xyz"] = {
            "npm run dev\n"
        }
    }
    })
end

return M;
