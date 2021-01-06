local actions = require('telescope.actions')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local utils = require('telescope.utils')
local conf = require('telescope.config').values
local Job = require('plenary.job')
local defaulter = utils.make_default_callable
local flatten = vim.tbl_flatten
local builtin = require('telescope.builtin')

local ChtSh={ }
local bat_options = {"bat" , "--style=plain" , "--color=always" , "--paging=always" , '--decorations=never','--pager=less'}

local _callable_obj = function()
  local obj = {}

  obj.__index = obj
  obj.__call = function(t, ...) return t:_find(...) end

  return obj
end

local ChtShFinder = _callable_obj()
function ChtShFinder:new(opts)
  assert(opts, "Options are required. See documentation for usage")

  local input_results
  if vim.tbl_islist(opts) then
    input_results = opts
  else
    input_results = opts.results
  end

  local entry_maker = opts.entry_maker or make_entry.gen_from_string()

  assert(input_results)
  assert(input_results, "Results are required for static finder")
  assert(type(input_results) == 'table', "self.results must be a table")

  local results = {}
  for k, v in ipairs(input_results) do
    local entry = entry_maker(v)

    if entry then
      entry.index = k
      table.insert(results, entry)
    end
  end


  return setmetatable({ results = results }, self)
end

function ChtShFinder:_find(prompt, process_result, process_complete)

  local count = 1
  for _, v in ipairs(self.results) do
      count = count + 1
  end

  for _, v in ipairs(self.results) do
    process_result(v)
  end

  process_complete()
end


ChtSh.a_query_list=function(prompt_bufnr)
  local selection = actions.get_selected_entry(prompt_bufnr)
  actions.close(prompt_bufnr)
  ChtSh.topic_list({topic = selection.value})
end

ChtSh.a_add_prompt=function(prompt_bufnr)
  local current_picker = actions.get_current_picker(prompt_bufnr)
  local prompt = vim.api.nvim_buf_get_lines(prompt_bufnr,0,1, false)[1]
  prompt = string.gsub(prompt," > ","")
  --print(vim.inspect(current_picker.finder))
  local entry_maker = make_entry.gen_from_string()
  local prompt_entry = entry_maker(prompt)
  local count = 1
  for k, v in pairs(current_picker.finder.results) do
      count = k
  end
  prompt_entry.index = count + 1
  table.insert(current_picker.finder.results, prompt_entry)
  print(vim.inspect(prompt_entry))
  current_picker:set_selection(prompt_entry.index)
end

ChtSh.root_list = function(opts)
  opts = opts or {}
  opts.limit = opts.limit or 100
  local cmd = 'curl cht.sh/:list'
  local results = vim.split(utils.get_os_command_output(cmd), '\n')
  pickers.new(opts, {
    prompt_title = 'chtsh root list',
    finder = finders.new_table {
      results = results,
      entry_maker = make_entry.gen_from_string(opts),
    },
    sorter = conf.file_sorter(opts),
    attach_mappings = function(_, map)
      map('i','<CR>',ChtSh.a_query_list)
      return true
    end
  }):find()
end

ChtSh.topic_list = function(opts)
  opts = opts or {}
  opts.topic = opts.topic or ':list'
  local cmd = 'curl cht.sh/'..opts.topic..'/:list'
  local results = vim.split(utils.get_os_command_output(cmd), '\n')
  pickers.new(opts, {
    prompt_title = 'chtsh topic list',
    finder = ChtShFinder:new{
        results=results,
        entry_maker = make_entry.gen_from_string(opts),
    },
    previewer = previewers.new_termopen_previewer{
      get_command = function(entry)
          print('in preview')
        local tmp_table = vim.split(entry.value,"\t");
        print(vim.inspect(tmp_table))
        if vim.tbl_isempty(tmp_table) then
          return {"echo", ""}
        end
        local query = string.gsub(entry.value,"%s+","+")
        print(query)
        return { 'curl' ,'cht.sh/'..opts.topic..'/'..query ,'view',tmp_table[1] }
      end
    },
    sorter = conf.file_sorter(opts),
    attach_mappings = function(_, map)
      -- actions.goto_file_selection_edit:replace(GH.a_gh_gist_append)
      map('i','<CR>',actions.close)
      map('n','q', ChtSh.a_add_prompt)
      return true
    end
  }):find()
end

return require('telescope').register_extension {
    setup = function()
      builtin.chtsh_root_list = ChtSh.root_list
      builtin.chtsh_topic_list = ChtSh.topic_list
      actions.a_query_list = ChtSh.a_query_list
    end;
    export = ChtSh
}
