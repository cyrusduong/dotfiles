-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- windows
-- delete using <C-w>d
map("n", "<C-W>d", "<C-W>c", { desc = "Delete Window", remap = true })
map("n", "<C-W>h", "<C-W>s", { desc = "Split window horizontally", remap = true })

-- bubble lines
map("n", "j", "ddp", { desc = "Move selection down", remap = true })
map("n", "k", "dd<Up>P", { desc = "Move selection down", remap = true })

-- bubble mutliple lines
map("v", "j", "xp`[V`]", { desc = "Move selection down", remap = true })
map("v", "k", "x<Up>P`[V`]", { desc = "Move selection down", remap = true })

-- Close buffer with <C-d>
map("n", "<C-d>", "<leader>bd", { desc = "Close buffer", remap = true })

-- Switch buffer/tabs? with normal l/h since I can use arrows pretty easy
map("n", "l", "L", { remap = true })
map("n", "h", "H", { remap = true })
