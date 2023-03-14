require("noice").setup {
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = true,            -- enables the Noice messages UI
    view = "mini",             -- default view for messages
    view_error = "mini",       -- view for errors
    view_warn = "mini",        -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = "mini",      -- view for search count messages. Set to `false` to disable
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },
}
