-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ctrl + bracket indenting
vim.keymap.del("n", "<C-[>)")
vim.keymap.del("n", "<C-]>)")
vim.keymap.set("n", "<C-[>", "<<", { silent = true, remap = true })
vim.keymap.set("n", "<C-]", ">>", { silent = true, remap = true })
vim.keymap.set("v", "<C-]>", ">gv", { silent = true, remap = true })
vim.keymap.set("v", "<C-[>", "<gv", { silent = true, remap = true })
vim.keymap.set("i", "<C-]>", "<C-c>>>gi", { silent = true, remap = true })
vim.keymap.set("i", "<C-[>", "<C-c><<gi", { silent = true, remap = true })
