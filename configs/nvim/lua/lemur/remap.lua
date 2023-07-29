vim.g.mapleader = " "

--- NORMAL MODE KEYS ---
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--- YANK TO EOL ---
vim.keymap.set("n", "Y", "yg$")

--- LINE APPEND FROM END --- 
vim.keymap.set("n", "J", "mzJ`z")

--- CENTER HALF-PAGE JUMP --- 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--- CENTER SEARCH TERMS --- 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- CLIPBOARD & BUFFER ---
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--- VISUAL LINE MOVE ---
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- DISABLED ---
vim.keymap.set("n", "Q", "<nop>")
