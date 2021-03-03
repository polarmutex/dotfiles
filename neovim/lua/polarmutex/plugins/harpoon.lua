local M = {}

M.setup = function()
    require('harpoon').setup({
        projects = {
            ["~/repos/brianryall.xyz"] = {
                term = {
                    cmds = {
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
        }
    })
end

return M;
