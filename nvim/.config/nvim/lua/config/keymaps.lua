-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Keep cursor centered when scrolling
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)

-- ciw on enter in normal mode
map("n", "<CR>", "ciw", opts)

-- Select all text in buffer
map("n", "<C-a>", "ggVG", opts)
