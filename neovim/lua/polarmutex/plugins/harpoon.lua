local M = {}

M.setup = function()
    require('harpoon').setup({
        ["~/repos/brianryall.xyz"] = {
            term = {
                cmd = {
                    "npm run dev\n"
                }
            },
            mark = {
            }
        },
        ["~/repos/beancount"] = {
            term = {
                cmd = {
                    "fava journal.beancount\n"
                }
            },
            mark = {
            }
        },
    })
end

return M;
