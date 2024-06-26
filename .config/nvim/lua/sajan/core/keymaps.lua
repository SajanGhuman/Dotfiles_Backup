-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- Remap j to move down and center cursor
vim.api.nvim_set_keymap('n', 'j', 'jzz', { noremap = true, silent = true })

-- Remap k to move up and center cursor
vim.api.nvim_set_keymap('n', 'k', 'kzz', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<C-f>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', '<C-d>zz', { noremap = true, silent = true })
-- increment/decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "ss", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "L", "<cmd>tabn<CR>", { desc = "Go to next tab" })                      --  go to next tab
keymap.set("n", "H", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                  --  go to previous tab
keymap.set("n", "tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "save file" })
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "save file and quit" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "quit file" })
