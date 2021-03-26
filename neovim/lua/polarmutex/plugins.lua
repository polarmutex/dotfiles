-- Look into
-- https://github.com/lervag/wiki.vim
-- https://github.com/ihsanturk/neuron.vim
-- https://github.com/kdheepak/lazygit.nvim
-- https://github.com/johannesthyssen/vim-signit
-- https://github.com/kyazdani42/nvim-tree.lua
-- https://github.com/mkitt/tabline.vim

return require('packer').startup{
    function(use)

        local local_use = function(first, second)
            local plug_path
            local home

            if second == nil then
                plug_path = first
                home = 'polarmutex'
            else
                plug_path = second
                home = first
            end

            if vim.fn.isdirectory(vim.fn.expand("~/repos/" .. plug_path)) == 1 then
                use("~/repos/" .. plug_path)
            elseif vim.fn.isdirectory(vim.fn.expand("~/dev/" .. plug_path)) == 1 then
                use("~/dev/" .. plug_path)
            else
                use(string.format('%s/%s', home, plug_path))
            end
        end

        -- Packer can manage itself as an optional plugin
        use 'wbthomason/packer.nvim'

        -- LSP
        use 'neovim/nvim-lspconfig'
        --use 'nvim-lua/completion-nvim'
        use 'hrsh7th/nvim-compe'
        use 'nvim-lua/lsp-status.nvim'
        use 'glepnir/lspsaga.nvim'
        use 'onsails/lspkind-nvim'
        use 'kosayoda/nvim-lightbulb'
        use 'tjdevries/nlua.nvim'

        -- Tree-Sitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = function() vim.cmd [[TSUpdate]] end
        }
        --local_use('polarmutex','nvim-treesitter')
        use 'nvim-treesitter/playground'
        --use 'nvim-treesitter/completion-treesitter'
        local_use('polarmutex', 'beancount.nvim')
        local_use('polarmutex', 'contextprint.nvim')

        -- Telescope (fuzzy finder)
        use {
            'nvim-telescope/telescope.nvim',
	        requires = {
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'},
	    	    {'nvim-telescope/telescope-fzy-native.nvim'},
    		    {'nvim-telescope/telescope-fzf-writer.nvim'},
    		    {'nvim-telescope/telescope-packer.nvim'},
    		    {'nvim-telescope/telescope-github.nvim'},
                {'nvim-telescope/telescope-packer.nvim'},
	        },
        }
        use 'kyazdani42/nvim-web-devicons'
        use 'phaazon/hop.nvim'

        -- Statusline
        use {
            'glepnir/galaxyline.nvim',
            branch = 'main',
        }
        use 'tjdevries/express_line.nvim'

        --Buffer Tabs
        use 'akinsho/nvim-bufferline.lua'

        -- Terminal / File Nav
        use 'ThePrimeagen/harpoon'
        --local_use('polarmutex','harpoon')

        -- Git
        use 'TimUntersberger/neogit'
        use 'lewis6991/gitsigns.nvim'
        use 'pwntester/octo.nvim'
        --use 'mhinz/vim-signify'
        --use'tpope/vim-fugitive'
        --use 'tpope/vim-rhubarb'

        -- colorsheme
        use 'tjdevries/colorbuddy.nvim'
        use "rktjmp/lush.nvim"

        -- Increment / Decrement
        use 'monaqa/dial.nvim'
        --use 'tpope/vim-speeddating'    -- Handle changing of dates in a nicer manner

        -- text maniuplation
        -- use 'godlygeek/tabular'        -- Quickly align text by pattern
        use 'tpope/vim-surround'       -- Surround text objects easily
        use 'tpope/vim-commentary'     -- Easily comment out lines or objects
        -- use 'tpope/vim-repeat'         -- Repeat actions better
        use 'tpope/vim-abolish'        -- Cool things with words!
        -- use 'tpope/vim-characterize'
        -- use 'AndrewRadev/splitjoin.vim'
        -- use 'AndrewRadev/sideways.vim' -- Easy sideways movement

        -- Convert binary, hex, etc..
        use 'glts/vim-radical'

        -- Files
        --use 'tpope/vim-eunuch'

        -- Have the file system follow you aroun
        use 'airblade/vim-rooter'

        -- Text Navigation
        --use 'justinmk/vim-sneak'
        --use 'unblevable/quick-scope'

        -- Add some color
        use 'norcalli/nvim-colorizer.lua'
        -- use 'norcalli/nvim-terminal.lua'
        -- Auto pairs for '(' '[' '{'
        -- auto-pairs

        -- Help
        --use 'liuchengxu/vim-which-key'

        -- :Messages <- view messages in quickfix list
        -- :Verbose  <- view verbose output in preview window.
        -- :Time     <- measure how long it takes to run some stuff.
        use 'tpope/vim-scriptease'

        -- Quickfix enhancements. See :help vim-qf
        --use 'romainl/vim-qf'

        -- Better profiling output for startup.
        use 'tweekmonster/startuptime.vim'

        -- Neovim in the browser
        use {
            'glacambre/firenvim',
            run = function()
                vim.fn['firenvim#install'](0)
            end
        }

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
        --use 'ThePrimeagen/vim-apm'
        --local_use('polarmutex','vim-apm')
        use 'VimDeathmatch/client'

        -- tasks
        local_use('polarmutex', 'tasks.nvim')

    end,
    config = {
        display = {
            open_fn = require('packer.util').float
        }
    }
}
