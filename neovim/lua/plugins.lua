
-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Temporary until https://github.com/neovim/neovim/pull/12632 is merged
vim._update_package_paths()

return require('packer').startup{
    function(use)
        local use_local = function(plug_path)
            if vim.fn.isdirectory(vim.fn.expand("~/dev/" .. plug_path)) == 1 then
                use("~/dev/" .. plug_path)
            else
                use('bryall/' .. plug_path)
            end
        end
        -- Packer can manage itself as an optional plugin
        use {'wbthomason/packer.nvim', opt = true}

        -- text maniuplation
        -- use 'godlygeek/tabular'        -- Quickly align text by pattern
        use 'tpope/vim-surround'       -- Surround text objects easily
        use 'tpope/vim-speeddating'    -- Handle changing of dates in a nicer manner
        use 'tpope/vim-commentary'     -- Easily comment out lines or objects
        -- use 'tpope/vim-repeat'         -- Repeat actions better
        use 'tpope/vim-abolish'        -- Cool things with words!
        -- use 'tpope/vim-characterize'
        -- use 'AndrewRadev/splitjoin.vim'
        -- use 'AndrewRadev/sideways.vim' -- Easy sideways movement

        -- Convert binary, hex, etc..
        use 'glts/vim-radical'

        -- Files
        use 'tpope/vim-eunuch'

        -- Have the file system follow you aroun
        use 'airblade/vim-rooter'

        -- Text Navigation
        use 'justinmk/vim-sneak'
        use 'unblevable/quick-scope'

        -- Add some color
        use 'norcalli/nvim-colorizer.lua'
        -- use 'norcalli/nvim-terminal.lua'
        -- Auto pairs for '(' '[' '{'
        -- auto-pairs

        -- Git
        use 'mhinz/vim-signify'
        use'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'

        -- Terminal
        use 'voldikss/vim-floaterm'

        -- Help
        use 'liuchengxu/vim-which-key'

        -- :Messages <- view messages in quickfix list
        -- :Verbose  <- view verbose output in preview window.
        -- :Time     <- measure how long it takes to run some stuff.
        use 'tpope/vim-scriptease'

        -- Quickfix enhancements. See :help vim-qf
        use 'romainl/vim-qf'

        -- Better profiling output for startup.
        use 'tweekmonster/startuptime.vim'

        -- Neovim in the browser
        use 'glacambre/firenvim'

        -- Lnaguages
        -- Lua
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-lua/telescope.nvim'
        use 'tjdevries/colorbuddy.nvim'
        use 'kyazdani42/nvim-web-devicons'

        -- LSP
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/completion-nvim'
        use 'nvim-lua/diagnostic-nvim'
        use 'nvim-lua/lsp-status.nvim'
        use 'tjdevries/nlua.nvim'

        -- Tree-Sitter
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-treesitter/playground'
        use 'nvim-treesitter/completion-treesitter'
        use_local 'beancount.nvim'

        -- Statusline
        use 'tjdevries/express_line.nvim'

        -- Whitespace
        use 'ntpeters/vim-better-whitespace'
        --show when there is gross trailing whitespace

        use 'RRethy/vim-illuminate'
        -- highlight current word

        -- Undo
        use 'mbbill/undotree'

        -- Test
        use 'vim-test/vim-test'

        -- Games/ Utils
        use 'takac/vim-hardtime'
        use 'ThePrimeagen/vim-be-good'
        --use_local 'vim-be-good'
        use 'ThePrimeagen/vim-apm'
        use 'VimDeathmatch/client'
end,
config = {
    display = {
        _open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win = pcall(function()
            return require('plenary.window.float').percentage_range_window(0.8, 0.8)
        end)

        if not ok then
            vim.cmd [[65vnew  [packer] ]]
            return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.buf
        local win = float_win.win

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, 'winblend', 10)

        return win, bufnr
      end
    },
  }
}
