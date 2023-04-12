-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>q", "<C-w>q", opts)

-- Shortcut like helix
keymap("n", "gl", "$", opts)
keymap("n", "gh", "^", opts)
keymap("n", "U", "<C-r>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Save
keymap("n", "<C-s>", "<cmd>w<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Change Record mapping
-- Disable
keymap("n", "+", "q", opts)
keymap("n", "q", "<Nop>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-s>", "<ESC>:w<CR>", opts)
keymap("i", "<C-h>", "<ESC>", opts)
keymap("i", "<C-l>", "<ESC>", opts)
keymap("i", "<C-z>", "<ESC>:u<CR>i", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- TroubleToggle
keymap("n", "<leader>t", ":TroubleToggle<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":Neotree toggle filesystem left<cr>", opts)
keymap("n", "<leader>b", ":Neotree toggle filesystem float<cr>", opts)

-- Hop
keymap("n", "s", ":HopChar2<CR>", opts)
keymap("n", "S", ":HopChar1<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "<leader>lh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "<leader>lr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "<leader>ll", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "<leader>ld", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>le", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show cursor diagnostics
-- Like show_line_diagnostics, it supports passing the ++unfocus argument
keymap("n", "<leader>lp", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>lE", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Toggle outline
keymap("n", "<leader>lo", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>", opts)
keymap("n", "J", "<cmd>Lspsaga hover_doc ++keep ++quiet<CR>", opts)

-- Call hierarchy
keymap("n", "<Leader>l>", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>l<", "<cmd>Lspsaga outgoing_calls<CR>")

-- Snip Run
keymap("n", "<leader>sr", ":SnipRun<CR>")
keymap("v", "<leader>sr", ":SnipRun<CR>")
keymap("n", "<leader>sc", ":SnipClose<CR>")
keymap("n", "<leader>ss", ":SnipReset<CR>")
