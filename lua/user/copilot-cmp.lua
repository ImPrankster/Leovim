require("copilot_cmp").setup({
  formatters = {
    insert_text = require("copilot_cmp.format").remove_existing
  },
})
