local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<Tab>"] = actions.move_selection_previous,
        ["<S-Tab>"] = actions.move_selection_next,
        ["<C-k>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<C-j>"] = actions.toggle_selection + actions.move_selection_better,
      },
      n = {
        ["l"] = actions.select_default,
        ["h"] = actions.select_horizontal,
        ["v"] = actions.select_vertical,
      },
    },
  },
  extensions = {
    workspaces = {
      -- keep insert mode after selection in the picker, default is false
      keep_insert = true,
    }
  },
}
