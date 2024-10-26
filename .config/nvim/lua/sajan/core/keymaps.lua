-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- use jk to exit insert mode
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Remap j to move down and center cursor
vim.api.nvim_set_keymap('n', 'j', 'jzz', { noremap = true, silent = true })

-- Remap k to move up and center cursor
vim.api.nvim_set_keymap('n', 'k', 'kzz', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<C-f>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', '<C-b>zz', { noremap = true, silent = true })

-- increment/decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" }) -- decrement

vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>lua require('oil').open_float('.')<CR>",
  { noremap = true, silent = true })

-- Enable incremental search
vim.opt.incsearch = true

-- Disable highlight search by default
vim.opt.hlsearch = false

-- Toggle highlight search with Ctrl-h
-- vim.api.nvim_set_keymap('n', '<C-f>', ':set hlsearch!<CR>', { noremap = true, silent = true })
