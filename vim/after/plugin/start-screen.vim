let g:startify_custom_header = [
            \'     __    __',
            \'    /_/ /\ \_\',
            \'   __ \ \/ / __',
            \'   \_\_\/\/_/_/       ____        __           __  ___      __',
            \'/\___\_\/_/___/\     / __ \____  / /___ ______/  |/  /_  __/ /____  _  __',
            \'\/ __/_/\_\__ \/    / /_/ / __ \/ / __ `/ ___/ /|_/ / / / / __/ _ \| |/_/',
            \'  /_/ /\/\ \_\     / ____/ /_/ / / /_/ / /  / /  / / /_/ / /_/  __/>  <',
            \'   __/ /\ \__     /_/    \____/_/\__,_/_/  /_/  /_/\__,_/\__/\___/_/|_|',
            \'   \_\ \/ /_/',
            \]

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                         },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()]  },
          \ { 'type': 'sessions',  'header': ['   Sessions']                      },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                     },
          \]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim'  },
            \ { 'z': '~/.zshrc'  },
            \]

let g:startify_enable_special = 0
