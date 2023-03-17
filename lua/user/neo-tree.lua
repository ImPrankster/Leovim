require("neo-tree").setup({
  filesystem = {
    window = {
      width = 30,
      mappings = {
        ["l"] = "open",
        ["o"] = "system_open",
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- macOs: open file in default application in the background.
        -- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
        vim.api.nvim_command("silent !open -g " .. path)
        -- Linux: open file in default application
        vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
      end,
    },
  },
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
    modified = {
      symbol = "󰳻",
      highlight = "NeoTreeModified",
    },
    git_status = {
      symbols = {
        unstaged = "",
        staged = "",
        unmerged = "",
        renamed = "➜",
        untracked = "+",
        deleted = "-",
        ignored = "◌",
      }
    },
  },
})
