require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


-- @TODO there's some useful whichkey bindings at "w" remap them to "W"?
map("n", "<leader>w", ":w<ENTER>", { desc = "Save " })
map("n", "<leader>q", ":q<ENTER>", { desc = "Quit NeoVim" })

-- tmux
map("n", "<C-h>", "<cmd>:NvimTmuxNavigateLeft<CR>")
map("n", "<C-j>", "<cmd>:NvimTmuxNavigateDown<CR>")
map("n", "<C-k>", "<cmd>:NvimTmuxNavigateUp<CR>")
map("n", "<C-l>", "<cmd>:NvimTmuxNavigateRight<CR>")

-- Smarter yank
--   yanks line starting from cursor
--   good for yanking to cli
map("v", "Y", "y$", {})

map("n", "<leader>H", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })

-- Hop
map("", "s", "<cmd>:HopChar1<CR>", { noremap = true, silent = true })
map("", "S", "<cmd>:HopPattern<CR>", { noremap = true, silent = true })
-- maps <leader>(direction) keys
map("", "<leader>h", "<cmd>HopWordCurrentLineBC<CR>", { desc = "Hop ←" })
map("", "<leader>j", "<cmd>HopVerticalAC<CR>",  { desc = "Hop ↑" })
map("", "<leader>k", "<cmd>HopVerticalBC<CR>",  { desc = "Hop ↓" })
map("", "<leader>l", "<cmd>HopWordCurrentLineAC<CR>", { desc = "Hop →" })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "NvimTree 🌳"})

-- Toggle diagnostics
map("n", "<leader>td", ":lua toggle_diagnostics()<CR>", { desc = "Toggle Diagnostics" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
